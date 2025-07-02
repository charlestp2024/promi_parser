# populate_data.py
import pandas as pd
import random
from faker import Faker
import numpy as np
from datetime import datetime, timedelta
import uuid
import json

# --- Configuration ---
TOTAL_ROWS = 10000  # Reduced for faster testing, change back to 100000 if needed
TENANT_ID = "df234305-8a47-4b4d-8efb-716a6b695428"
IMPORT_USER_ID = "bf255bcc-e2db-4d47-8e3e-5b8b7b4f105d"
IMPORT_USER_NAME="Admin Tekip"
# --- Output Filenames ---
OUTPUT_EXCEL_FILENAME = "populated_patent_data_final.xlsx"
OUTPUT_USER_MAP_JSON = "users_map.json"
OUTPUT_CLIENT_HIERARCHY_JSON = "client_hierarchy_map.json"

# --- Data Generation (same as before) ---
fake = Faker()
FILING_ENTITY_TYPES = ["Small", "Large", "Micro", "Individual", "Startup", "Others"]
FIRST_FILING_TYPES = ["Provisional", "Non-Provisional", "PCT Application"]
DOCKET_STATUSES = [
    "Abandoned",
    "Rated To File",
    "Hold",
    "Rated To Publish",
    "Open",
    "Trade Secret",
    "Not Yet Rated",
    "Active",
    "Complete",
]
SUBDOCKET_STATUSES = ["Abandoned", "Active", "Hold", "Complete", "Granted"]
SUBDOCKET_FILING_TYPES = [
    "Provisional",
    "Non-Provisional",
    "PCT",
    "National Phase",
    "Divisional",
    "Continuation",
]
COUNTRIES = {
    "IN": "India",
    "CN": "China",
    "NZ": "New Zealand",
    "BD": "Bangladesh",
    "CA": "Canada",
    "FR": "France",
    "US": "United States",
    "SG": "Singapore",
    "NP": "Nepal",
    "WO": "WIPO",
    "RS": "Serbia",
    "AU": "Australia",
    "FI": "Finland",
    "ID": "Indonesia",
    "BR": "Brazil",
    "JP": "Japan",
    "DE": "Germany",
}
COUNTRY_CODES = list(COUNTRIES.keys())
YES_NO = ["Yes", "No"]
print("Creating pools of reusable names and entities...")
PERSONNEL_POOL = [fake.name() for _ in range(200)]
CLIENT_POOL = [fake.company() for _ in range(150)]
CLIENT_DIVISION_POOL = [
    "R&D",
    "Engineering",
    "Product Dev",
    "Core Tech",
    "Innovation Lab",
]
DEPARTMENT_POOL = [
    "AI Solutions",
    "Cybersecurity",
    "Robotics",
    "Biomedical",
    "Civil Systems",
    "Aerospace",
]
ALL_COLUMNS = [
    "Docket Level/Subdocket Level",
    "Docket Number",
    "Title",
    "Filing Entity Type",
    "First Filing Type",
    "Current Status",
    "Foreign Filing Countries",
    "Manager (Internal)",
    "Reviewer",
    "Drafter",
    "First Filing Country",
    "Filing & Maintenance Cost Estimate",
    "Foreign Filing License Required(Yes/No)",
    "Deadline for filing(Date)",
    "Annuity Timeline",
    "Current Status Date",
    "First Filing Date",
    "Sent For Review(Yes/No)",
    "Sent for Drafting(Yes/No)",
    "Client",
    "Client Division",
    "Department",
    "Analyst",
    "Patent Agent",
    "Inventors",
    "Sub-Docket Number",
    "Type Of Filing",
    "Country Of Filing",
    "Patent Office(Country)",
    "Status",
    "Type of Filing Entity",
    "Application Number",
    "Publication Number",
    "Assignee Name",
    "Tentative Filing Date",
    "Prior Filing Date",
    "Priority Date",
    "Filing Date",
    "Publication Date",
    "Grant Date",
    "Expected Filing Year",
    "Recent OA Received Date",
    "Inforce(Yes/No)",
    "Annuity Fee",
    "Term Extension",
    "Sent for Prosecution(Yes/No)",
    "Sent for Annuity(Yes/No)",
]


def generate_date(start_date):
    return fake.date_between(
        start_date=start_date, end_date=start_date + timedelta(days=1800)
    )


print("Starting data generation...")
# (The entire data generation loop remains the same as your original script)
all_rows, row_count, docket_id = [], 0, 1
while row_count < TOTAL_ROWS:
    docket_number = f"DOCKET-{docket_id:05d}"
    client_name = random.choice(CLIENT_POOL)
    department = random.choice(DEPARTMENT_POOL)
    client_division = random.choice(CLIENT_DIVISION_POOL)
    inventors_list = ", ".join(random.sample(PERSONNEL_POOL, k=random.randint(1, 3)))
    first_filing_country_code = random.choice(COUNTRY_CODES)
    first_filing_date = fake.date_between(start_date="-5y", end_date="-1y")
    docket_row = {col: np.nan for col in ALL_COLUMNS}
    docket_row.update(
        {
            "Docket Level/Subdocket Level": "Docket Level",
            "Docket Number": docket_number,
            "Title": fake.bs().title(),
            "Filing Entity Type": random.choice(FILING_ENTITY_TYPES),
            "First Filing Type": random.choice(FIRST_FILING_TYPES),
            "Current Status": random.choice(DOCKET_STATUSES),
            "Foreign Filing Countries": ", ".join(
                random.sample(COUNTRY_CODES, k=random.randint(2, 5))
            ),
            "Manager (Internal)": random.choice(PERSONNEL_POOL),
            "Reviewer": random.choice(PERSONNEL_POOL),
            "Drafter": random.choice(PERSONNEL_POOL),
            "First Filing Country": first_filing_country_code,
            "Filing & Maintenance Cost Estimate": round(
                random.uniform(10000.00, 100000.00), 2
            ),
            "Foreign Filing License Required(Yes/No)": random.choice(YES_NO),
            "Deadline for filing(Date)": generate_date(first_filing_date),
            "Annuity Timeline": first_filing_date
            + timedelta(days=random.randint(1095, 1825)),
            "Current Status Date": generate_date(first_filing_date),
            "First Filing Date": first_filing_date,
            "Sent For Review(Yes/No)": random.choice(YES_NO),
            "Sent for Drafting(Yes/No)": random.choice(YES_NO),
            "Client": client_name,
            "Client Division": client_division,
            "Department": department,
            "Analyst": random.choice(PERSONNEL_POOL),
            "Patent Agent": random.choice(PERSONNEL_POOL),
            "Inventors": inventors_list,
        }
    )
    all_rows.append(docket_row)
    row_count += 1
    if row_count >= TOTAL_ROWS:
        break
    num_sub_dockets = random.randint(1, 4)
    for i in range(num_sub_dockets):
        sub_docket_row = {col: np.nan for col in ALL_COLUMNS}
        filing_country = random.choice(COUNTRY_CODES)
        filing_date = generate_date(first_filing_date)
        sub_client_division = (
            docket_row["Client Division"]
            if random.random() < 0.9
            else random.choice(CLIENT_DIVISION_POOL)
        )
        sub_analyst = (
            docket_row["Analyst"]
            if random.random() < 0.8
            else random.choice(PERSONNEL_POOL)
        )
        sub_patent_agent = (
            docket_row["Patent Agent"]
            if random.random() < 0.8
            else random.choice(PERSONNEL_POOL)
        )
        original_inventors = docket_row["Inventors"].split(", ")
        sub_inventors_list = (
            random.sample(
                original_inventors, k=random.randint(1, len(original_inventors) - 1)
            )
            if len(original_inventors) > 1 and random.random() < 0.3
            else original_inventors
        )
        sub_inventors_str = ", ".join(sub_inventors_list)
        sub_docket_status = random.choice(SUBDOCKET_STATUSES)
        sub_docket_row.update(
            {
                "Docket Level/Subdocket Level": "Subdocket Level",
                "Docket Number": docket_number,
                "Client": client_name,
                "Department": department,
                "Client Division": sub_client_division,
                "Analyst": sub_analyst,
                "Patent Agent": sub_patent_agent,
                "Inventors": sub_inventors_str,
                "Sub-Docket Number": f"{docket_number}-SUB{i+1:03d}",
                "Type Of Filing": random.choice(SUBDOCKET_FILING_TYPES),
                "Country Of Filing": filing_country,
                "Patent Office(Country)": filing_country,
                "Foreign Filing Countries": ", ".join(
                    random.sample(COUNTRY_CODES, k=random.randint(2, 5))
                ),
                "Status": sub_docket_status,
                "Type of Filing Entity": docket_row["Filing Entity Type"],
                "Application Number": f"{filing_country}/{random.randint(2020, 2025)}/{random.randint(100000, 999999)}",
                "Filing & Maintenance Cost Estimate": round(
                    random.uniform(5000.00, 50000.00), 2
                ),
                "Publication Number": f"WO/{random.randint(2021, 2026)}/{random.randint(100000, 999999)}",
                "Assignee Name": client_name,
                "Tentative Filing Date": generate_date(first_filing_date),
                "Prior Filing Date": first_filing_date,
                "Priority Date": first_filing_date,
                "Filing Date": filing_date,
                "Publication Date": generate_date(filing_date),
                "Grant Date": (
                    generate_date(filing_date + timedelta(days=730))
                    if sub_docket_status == "Granted"
                    else np.nan
                ),
                "Expected Filing Year": filing_date.year,
                "Recent OA Received Date": (
                    generate_date(filing_date) if random.random() > 0.5 else np.nan
                ),
                "Inforce(Yes/No)": (
                    "Yes" if sub_docket_status in ["Active", "Granted"] else "No"
                ),
                "Annuity Fee": round(random.uniform(500.00, 5000.00), 2),
                "Term Extension": np.nan,
                "Sent for Prosecution(Yes/No)": random.choice(YES_NO),
                "Sent for Annuity(Yes/No)": random.choice(YES_NO),
            }
        )
        all_rows.append(sub_docket_row)
        row_count += 1
        if row_count >= TOTAL_ROWS:
            break
    docket_id += 1
    if row_count % 1000 == 0:
        print(f"Generated {row_count}/{TOTAL_ROWS} rows...")

# --- DataFrame Creation and Excel Export ---
print("\nGeneration complete. Creating DataFrame...")
df = pd.DataFrame(all_rows, columns=ALL_COLUMNS)
for col in df.select_dtypes(include=["datetime64[ns]"]).columns:
    df[col] = df[col].dt.strftime("%Y-%m-%d")
print(f"Saving Excel data to {OUTPUT_EXCEL_FILENAME}...")
df.to_excel(OUTPUT_EXCEL_FILENAME, index=False, engine="openpyxl", na_rep="")
print("Excel file saved.")


# --- JSON MAPPING GENERATION ---
print("\n--- Starting JSON Mapping Generation ---")

# Initialize the user map with the special import user and their predefined ID.
user_uuid_map = {
    IMPORT_USER_NAME: IMPORT_USER_ID
}
client_hierarchy_map = {}

# 1. Generate User Map
print("Processing `user` data for mapping...")
user_columns = ["Manager (Internal)", "Reviewer", "Drafter", "Analyst", "Patent Agent"]
all_users = set()

# Gather all unique user names from the DataFrame
for col in user_columns:
    all_users.update(df[col].dropna().unique())
for inventor_list in df["Inventors"].dropna().unique():
    # Split inventor strings and strip whitespace
    all_users.update([name.strip() for name in inventor_list.split(",")])
all_users.discard("")  # Remove any empty strings that might have crept in

# Populate the user map, adding new UUIDs for users not already present
for full_name in all_users:
    if full_name not in user_uuid_map:
        user_uuid_map[full_name] = str(uuid.uuid4())

# 2. Generate Client Hierarchy Map (Clients, Departments, Divisions)
print("Processing client hierarchy for mapping...")
unique_clients = df["Client"].dropna().unique()
for client_name in unique_clients:
    if not client_name:
        continue

    client_uuid = str(uuid.uuid4())
    client_hierarchy_map[client_name] = {
        "uuid": client_uuid,
        "departments": {},
        "divisions": {},
    }

    # Find unique departments for this client
    client_depts = df[df["Client"] == client_name]["Department"].dropna().unique()
    for dept_name in client_depts:
        client_hierarchy_map[client_name]["departments"][dept_name] = str(uuid.uuid4())

    # Find unique divisions for this client
    client_divs = df[df["Client"] == client_name]["Client Division"].dropna().unique()
    for div_name in client_divs:
        client_hierarchy_map[client_name]["divisions"][div_name] = str(uuid.uuid4())

# 3. Save mapping dictionaries to JSON files
print("Saving mapping data to JSON files...")
with open(OUTPUT_USER_MAP_JSON, "w", encoding="utf-8") as f:
    json.dump(user_uuid_map, f, indent=4)
print(f"Saved user map to {OUTPUT_USER_MAP_JSON}")

with open(OUTPUT_CLIENT_HIERARCHY_JSON, "w", encoding="utf-8") as f:
    json.dump(client_hierarchy_map, f, indent=4)
print(f"Saved client hierarchy map to {OUTPUT_CLIENT_HIERARCHY_JSON}")

print("\nData and mapping generation complete!")