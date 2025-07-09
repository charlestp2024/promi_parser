import pandas as pd
from excel import excel_validate
from services.start_parse import import_excel
from dotenv import load_dotenv, find_dotenv

load_dotenv(find_dotenv())
DB_NAME = "pmv_invention_disclosure"
TENANT_ID = "df234305-8a47-4b4d-8efb-716a6b695428"
IMPORT_USER_UUID = "bf255bcc-e2db-4d47-8e3e-5b8b7b4f105d"
HEADER_ROW = 1


def process_excel(file_path: str, data_type: str = "client"):
    df = pd.read_excel(file_path, header=1)

    # is_valid = excel_validate.validate_excel_df(
    # df, error_report_path="MissingFieldsReport.xlsx"
    # )
    # if not is_valid:
    #     return
    import_excel(
        excel_file=file_path,
        tenant_id=TENANT_ID,
        import_user=IMPORT_USER_UUID,
        header_row=HEADER_ROW,
    )


if __name__ == "__main__":
    process_excel("D:/var/populated_patent_data_final.xlsx", data_type="client")
