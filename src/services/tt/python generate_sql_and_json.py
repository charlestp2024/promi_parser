import json
import pandas as pd
import re
from datetime import datetime

# --- Configuration ---
TENANT_ID = "df234305-8a47-4b4d-8efb-716a6b695428"

# --- Input Filenames ---
# These files must be present in the same directory, created by the first script.
INPUT_USER_MAP_JSON = "users_map.json"
INPUT_CLIENT_HIERARCHY_JSON = "client_hierarchy_map.json" # Corrected to match the generator's output

# --- Output SQL Filenames ---
OUTPUT_INVD_SQL_FILENAME = "generated_invd_inserts.sql"
OUTPUT_DRAFTING_SQL_FILENAME = "generated_drafting_inserts.sql"
OUTPUT_DOCKET_REVIEW_SQL_FILENAME = "generated_docket_review_inserts.sql"

def escape_sql(value):
    """A helper function to safely format values for SQL."""
    if pd.isna(value) or value is None:
        return "NULL"
    return str(value).replace("'", "''")

def main():
    print("--- Starting SQL Generation from JSON files ---")

    # Load mapping files
    print("Loading mapping files...")
    try:
        with open(INPUT_USER_MAP_JSON, 'r', encoding='utf-8') as f:
            user_map = json.load(f)
        with open(INPUT_CLIENT_HIERARCHY_JSON, 'r', encoding='utf-8') as f:
            client_hierarchy = json.load(f)
    except FileNotFoundError as e:
        print(f"ERROR: Could not find required input file: {e.filename}")
        print("Please ensure you have run the data generator script first.")
        return
        
    print("Mapping files loaded.")

    # Lists to hold SQL statements for each database
    invd_sql, drafting_sql, docket_review_sql = [], [], []
    NOW_TIMESTAMP = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

    # 1. Generate User INSERTs for all databases
    print("Generating SQL for Users...")
    for full_name, user_uuid in user_map.items():
        name_parts = full_name.split(" ", 1)
        first_name = name_parts[0]
        last_name = name_parts[1] if len(name_parts) > 1 else "Lname"
        email = f"{first_name.lower().replace(' ', '')}.{last_name.lower().replace(' ', '')}@example.com"
        
        invd_sql.append(f"INSERT INTO `user` (`full_name`, `uuid`, `first_name`, `last_name`, `tenant_id`, `email`, `deleted`, `inactive`) VALUES ('{escape_sql(full_name)}', '{user_uuid}', '{escape_sql(first_name)}', '{escape_sql(last_name)}', '{TENANT_ID}', '{escape_sql(email)}', 0, 0);")
        drafting_sql.append(f"INSERT INTO `user` (`id`, `fullname`, `tenant_id`, `email`, `contact`, `firstname`, `lastname`, `middlename`, `deleted`, `inactive`, `created_on`, `modified_on`) VALUES ('{user_uuid}', '{escape_sql(full_name)}', '{TENANT_ID}', '{email}', NULL, '{escape_sql(first_name)}', '{escape_sql(last_name)}', NULL, 0, 0, '{NOW_TIMESTAMP}', '{NOW_TIMESTAMP}');")
        docket_review_sql.append(f"INSERT INTO `users` (`uuid`, `first_name`, `last_name`, `full_name`, `email`, `address`, `contact`, `inactive`, `tenant_id`, `created_on`, `modified_on`) VALUES ('{user_uuid}', '{escape_sql(first_name)}', '{escape_sql(last_name)}', '{escape_sql(full_name)}', '{email}', NULL, NULL, 0, '{TENANT_ID}', '{NOW_TIMESTAMP}', '{NOW_TIMESTAMP}');")

    # 2. Generate Client, Department, and Division INSERTs
    print("Generating SQL for Clients, Departments, and Divisions...")
    client_code_counter = 1001
    
    # Correctly iterate through the client hierarchy dictionary
    for client_name, data in client_hierarchy.items():
        client_uuid = data['uuid']
        client_email_name = re.sub(r'[^a-zA-Z0-9]', '', client_name).lower()
        client_email = f"info@{client_email_name}.com"
        
        # --- Client INSERTs ---
        invd_sql.append(f"INSERT INTO `client` (`uuid`, `tenant_id`, `client_name`, `client_code`, `is_active`) VALUES ('{client_uuid}', '{TENANT_ID}', '{escape_sql(client_name)}', {client_code_counter}, 1);")
        drafting_sql.append(f"INSERT INTO `client` (`id`, `client_code`, `client_name`, `email`, `is_active`, `created_on`, `modified_on`, `tenant_id`) VALUES ('{client_uuid}', {client_code_counter}, '{escape_sql(client_name)}', '{client_email}', 1, '{NOW_TIMESTAMP}', '{NOW_TIMESTAMP}', '{TENANT_ID}');")
        docket_review_sql.append(f"INSERT INTO `client` (`uuid`, `client_name`, `client_code`, `is_active`, `tenant_id`, `created_on`, `modified_on`) VALUES ('{client_uuid}', '{escape_sql(client_name)}', {client_code_counter}, 1, '{TENANT_ID}', '{NOW_TIMESTAMP}', '{NOW_TIMESTAMP}');")
        client_code_counter += 1

        # --- Department INSERTs ---
        # Correctly iterate through the nested departments dictionary
        for dept_name, dept_uuid in data['departments'].items():
            invd_sql.append(f"INSERT INTO `department` (`uuid`, `tenant_id`, `client_id`, `department`) VALUES ('{dept_uuid}', '{TENANT_ID}', '{client_uuid}', '{escape_sql(dept_name)}');")
            drafting_sql.append(f"INSERT INTO `department` (`uuid`, `department`, `client_id`, `tenant_id`, `created_on`, `modified_on`) VALUES ('{dept_uuid}', '{escape_sql(dept_name)}', '{client_uuid}', '{TENANT_ID}', '{NOW_TIMESTAMP}', '{NOW_TIMESTAMP}');")
            docket_review_sql.append(f"INSERT INTO `department` (`uuid`, `department`, `tenant_id`, `client_id`, `created_on`, `modified_on`) VALUES ('{dept_uuid}', '{escape_sql(dept_name)}', '{TENANT_ID}', '{client_uuid}', '{NOW_TIMESTAMP}', '{NOW_TIMESTAMP}');")

        # --- Division INSERTs ---
        # Correctly iterate through the nested divisions dictionary
        for div_name, div_uuid in data['divisions'].items():
            invd_sql.append(f"INSERT INTO `client_division` (`id`, `division_name`, `tenant_id`, `client_id`, `is_active`) VALUES ('{div_uuid}', '{escape_sql(div_name)}', '{TENANT_ID}', '{client_uuid}', 1);")
            drafting_sql.append(f"INSERT INTO `client_division` (`id`, `division_name`, `client_id`, `is_active`, `created_on`, `modified_on`, `tenant_id`) VALUES ('{div_uuid}', '{escape_sql(div_name)}', '{client_uuid}', 1, '{NOW_TIMESTAMP}', '{NOW_TIMESTAMP}', '{TENANT_ID}');")

    # 3. Save all SQL statements to their respective files
    print("\nSaving SQL statements to files...")
    with open(OUTPUT_INVD_SQL_FILENAME, "w", encoding="utf-8") as f:
        f.write("-- Generated SQL inserts for INVD database\n\n")
        f.write("\n".join(invd_sql))
    print(f"Saved INVD SQL to {OUTPUT_INVD_SQL_FILENAME}")

    with open(OUTPUT_DRAFTING_SQL_FILENAME, "w", encoding="utf-8") as f:
        f.write("-- Generated SQL inserts for DRAFTING database\n\n")
        f.write("\n".join(drafting_sql))
    print(f"Saved DRAFTING SQL to {OUTPUT_DRAFTING_SQL_FILENAME}")

    with open(OUTPUT_DOCKET_REVIEW_SQL_FILENAME, "w", encoding="utf-8") as f:
        f.write("-- Generated SQL inserts for DOCKET_REVIEW database\n")
        f.write("-- NOTE: Populates tables `client`, `department`, and `users`.\n\n")
        f.write("\n".join(docket_review_sql))
    print(f"Saved DOCKET_REVIEW SQL to {OUTPUT_DOCKET_REVIEW_SQL_FILENAME}")

    print("\nAll SQL files generated successfully!")

if __name__ == "__main__":
    main()