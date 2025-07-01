import logging
import pandas as pd
from excel.ExcelData import ExcelColumns

# Configure logger for this module
logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)
handler = logging.StreamHandler()
formatter = logging.Formatter("[%(asctime)s] %(levelname)s - %(message)s")
handler.setFormatter(formatter)
if not logger.hasHandlers():
    logger.addHandler(handler)

# Mandatory fields
MANDATORY_DOCKET_FIELDS = [
    ExcelColumns.DOCKET_LEVEL,
    ExcelColumns.DOCKET_NUMBER,
    ExcelColumns.TITLE,
    ExcelColumns.FILING_ENTITY_TYPE,
    ExcelColumns.SENT_FOR_REVIEW,
    ExcelColumns.SENT_FOR_DRAFTING,
    ExcelColumns.FIRST_FILING_COUNTRY,
]

MANDATORY_COMMON_FIELDS = [
    ExcelColumns.CLIENT,
    ExcelColumns.DEPARTMENT,
    ExcelColumns.ANALYST,
    ExcelColumns.PATENT_AGENT,
    ExcelColumns.INVENTORS,
]

MANDATORY_SUBDOCKET_FIELDS = [
    ExcelColumns.SUB_DOCKET_NUMBER,
    ExcelColumns.TYPE_OF_FILING,
    ExcelColumns.COUNTRY_OF_FILING,
    ExcelColumns.PATENT_OFFICE_COUNTRY,
    ExcelColumns.SENT_FOR_PROSECUTION,
    ExcelColumns.SENT_FOR_ANNUITY,
]

# Allowed values for specific columns
ALLOWED_FILING_ENTITY_TYPE = {
    "Small",
    "Large",
    "Micro",
    "Individual",
    "Startup",
    "Others",
}
ALLOWED_FIRST_FILING_TYPE = {"Provisional", "Non-provisional", "PCT"}

ALLOWED_CURRENT_STATUS = [
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

# Subdocket-specific allowed values
ALLOWED_SUBDOCKET_STATUS = ["Abandoned", "Active", "Hold", "Complete", "Granted"]
ALLOWED_SUBDOCKET_TYPE_OF_FILING_ENTITY = [
    "Small",
    "Large",
    "Micro",
    "Individu",
    "Startup",
    "Others",
]


class ExcelValidationError(Exception):
    """Custom exception for Excel validation errors."""

    pass


def validate_excel_df(
    df: pd.DataFrame, error_report_path: str = "MissingFieldsReport.xlsx"
) -> bool:
    """
    Validates the DataFrame for column presence and mandatory fields.
    Saves an error report if issues are found.

    Returns True if validation passes, False otherwise.
    """
    # Step 1: Validate columns
    missing_columns = validate_columns_presence(df)
    if missing_columns:
        print("🚨 Missing columns:", ", ".join(missing_columns))
        return False

    # Step 2: Validate mandatory fields in each row
    error_rows = validate_mandatory_fields(df)
    if error_rows:
        save_error_report(error_rows, error_report_path)
        return False
    else:
        print("✅ All mandatory fields are filled. Ready for further processing!")
        return True


def validate_columns_presence(df: pd.DataFrame):
    try:
        if not isinstance(df, pd.DataFrame):
            logger.error("Input is not a pandas DataFrame.")
            raise TypeError("Input must be a pandas DataFrame.")

        expected_columns = [
            getattr(ExcelColumns, field) for field in ExcelColumns.__dataclass_fields__
        ]
        missing_columns = [col for col in expected_columns if col not in df.columns]
        if missing_columns:
            logger.warning(f"Missing columns detected: {missing_columns}")
        else:
            logger.info("All expected columns are present.")
        return missing_columns
    except Exception as e:
        logger.exception("Exception occurred during column presence validation.")
        raise ExcelValidationError(f"Error during column presence validation: {e}")


def validate_mandatory_fields(df: pd.DataFrame):
    try:
        if not isinstance(df, pd.DataFrame):
            logger.error("Input is not a pandas DataFrame.")
            raise TypeError("Input must be a pandas DataFrame.")

        error_rows = []
        for idx, row in df.iterrows():
            level = str(row.get(ExcelColumns.DOCKET_LEVEL, "")).strip().lower()
            error_row = {
                "Row Number": idx + 3,
                "Missing Fields": "",
                "Other Errors": "",
            }

            if level == "docket":
                mandatory_fields = MANDATORY_DOCKET_FIELDS + MANDATORY_COMMON_FIELDS
            elif level == "subdocket":
                mandatory_fields = (
                    MANDATORY_DOCKET_FIELDS
                    + MANDATORY_COMMON_FIELDS
                    + MANDATORY_SUBDOCKET_FIELDS
                )
            else:
                msg = f"Unrecognized level '{level}'"
                logger.info(
                    f"Row {idx+3}: Unrecognized level '{level}', added to error_rows."
                )
                if error_row["Other Errors"]:
                    error_row["Other Errors"] += " | " + msg
                else:
                    error_row["Other Errors"] = msg

            # Check for missing mandatory fields
            missing_fields = [
                field
                for field in mandatory_fields
                if pd.isna(row.get(field, "")) or str(row.get(field, "")).strip() == ""
            ]
            if missing_fields:
                logger.info(f"Row {idx+3}: Missing fields: {missing_fields}")
                error_row["Missing Fields"] = ", ".join(missing_fields)

            # Case-insensitive value validation for FILING_ENTITY_TYPE (skip if empty)
            filing_entity_type = str(
                row.get(ExcelColumns.FILING_ENTITY_TYPE, "")
            ).strip()
            if filing_entity_type:
                if filing_entity_type.lower() not in {
                    v.lower() for v in ALLOWED_FILING_ENTITY_TYPE
                }:
                    msg = (
                        f"Invalid value for '{ExcelColumns.FILING_ENTITY_TYPE}': '{filing_entity_type}'. "
                        f"Allowed values: {sorted(ALLOWED_FILING_ENTITY_TYPE)}"
                    )
                    logger.info(f"Row {idx+3}: {msg}")
                    if error_row["Other Errors"]:
                        error_row["Other Errors"] += " | " + msg
                    else:
                        error_row["Other Errors"] = msg

            # Case-insensitive value validation for FIRST_FILING_TYPE (skip if empty)
            first_filing_type = str(row.get(ExcelColumns.FIRST_FILING_TYPE, "")).strip()
            if first_filing_type:
                if first_filing_type.lower() not in {
                    v.lower() for v in ALLOWED_FIRST_FILING_TYPE
                }:
                    msg = (
                        f"Invalid value for '{ExcelColumns.FIRST_FILING_TYPE}': '{first_filing_type}'. "
                        f"Allowed values: {sorted(ALLOWED_FIRST_FILING_TYPE)}"
                    )
                    logger.info(f"Row {idx+3}: {msg}")
                    if error_row["Other Errors"]:
                        error_row["Other Errors"] += " | " + msg
                    else:
                        error_row["Other Errors"] = msg

            # Case-insensitive value validation for CURRENT_STATUS (skip if empty)
            current_status = str(row.get(ExcelColumns.CURRENT_STATUS, "")).strip()
            if current_status:
                if current_status.lower() not in {
                    v.lower() for v in ALLOWED_CURRENT_STATUS
                }:
                    msg = (
                        f"Invalid value for '{ExcelColumns.CURRENT_STATUS}': '{current_status}'. "
                        f"Allowed values: {ALLOWED_CURRENT_STATUS}"
                    )
                    logger.info(f"Row {idx+3}: {msg}")
                    if error_row["Other Errors"]:
                        error_row["Other Errors"] += " | " + msg
                    else:
                        error_row["Other Errors"] = msg

            # --- Subdocket-specific validations ---
            if level == "subdocket":
                # STATUS
                status_val = str(row.get(ExcelColumns.STATUS, "")).strip()
                if status_val:
                    if status_val.lower() not in (
                        v.lower() for v in ALLOWED_SUBDOCKET_STATUS
                    ):
                        msg = (
                            f"Invalid value for '{ExcelColumns.STATUS}': '{status_val}'. "
                            f"Allowed values: {ALLOWED_SUBDOCKET_STATUS}"
                        )
                        logger.info(f"Row {idx+3}: {msg}")
                        if error_row["Other Errors"]:
                            error_row["Other Errors"] += " | " + msg
                        else:
                            error_row["Other Errors"] = msg

                # TYPE_OF_FILING_ENTITY
                type_of_filing_entity_val = str(
                    row.get(ExcelColumns.TYPE_OF_FILING_ENTITY, "")
                ).strip()
                if type_of_filing_entity_val:
                    if type_of_filing_entity_val.lower() not in (
                        v.lower() for v in ALLOWED_SUBDOCKET_TYPE_OF_FILING_ENTITY
                    ):
                        msg = (
                            f"Invalid value for '{ExcelColumns.TYPE_OF_FILING_ENTITY}': '{type_of_filing_entity_val}'. "
                            f"Allowed values: {ALLOWED_SUBDOCKET_TYPE_OF_FILING_ENTITY}"
                        )
                        logger.info(f"Row {idx+3}: {msg}")
                        if error_row["Other Errors"]:
                            error_row["Other Errors"] += " | " + msg
                        else:
                            error_row["Other Errors"] = msg

            # Only append if there is any error
            if error_row["Missing Fields"] or error_row["Other Errors"]:
                error_rows.append(error_row)

        if error_rows:
            logger.warning(
                f"Total rows with missing mandatory fields or invalid values: {len(error_rows)}"
            )
        else:
            logger.info(
                "No missing mandatory fields or invalid values found in any row."
            )

        return error_rows
    except Exception as e:
        logger.exception("Exception occurred during mandatory fields validation.")
        raise ExcelValidationError(f"Error during mandatory fields validation: {e}")


def save_error_report(error_rows, output_path: str):
    try:
        if not isinstance(error_rows, list):
            logger.error("error_rows must be a list of dictionaries.")
            raise TypeError("error_rows must be a list of dictionaries.")
        if not isinstance(output_path, str):
            logger.error("output_path must be a string.")
            raise TypeError("output_path must be a string.")

        if error_rows:
            error_df = pd.DataFrame(error_rows)
            error_df.to_excel(output_path, index=False)
            logger.info(f"✅ Error report saved to: {output_path}")
            print(f"✅ Error report saved to: {output_path}")
        else:
            logger.info("✅ No missing mandatory fields or invalid values found.")
            print("✅ No missing mandatory fields or invalid values found.")
    except Exception as e:
        logger.exception("Exception occurred while saving error report.")
        raise ExcelValidationError(f"Error while saving error report: {e}")
