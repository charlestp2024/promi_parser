import os
import uuid


DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")
DB_HOST = os.getenv("DB_HOST")
DB_PORT = os.getenv("DB_PORT")

def get_database_url(db_name: str) -> str:
    return (
        f"mysql+pymysql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{db_name}"
        "?charset=utf8mb4"
    )

# Kafka Configuration
KAFKA_BROKER = "192.168.10.220:9096"
KAFKA_TOPIC_CLIENT_ADDED = "client_service-client-added"
# Constants for bulk upload
DEFAULT_TENANT_ID = uuid.UUID("df234305-8a47-4b4d-8efb-716a6b695428")
DEFAULT_ADDED_BY_USER_ID = uuid.UUID("bf255bcc-e2db-4d47-8e3e-5b8b7b4f105d")
