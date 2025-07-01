# services/logger.py
import logging
from logging.handlers import RotatingFileHandler
import os
import sys
import io

LOG_DIR = "logs"
LOG_FILE = "import.log"
os.makedirs(LOG_DIR, exist_ok=True)

# Force UTF-8 for stdout to handle ✓ ✗ ⏱ etc.
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")

logger = logging.getLogger("promive_logger")
logger.setLevel(logging.DEBUG)

formatter = logging.Formatter("%(levelname)s | %(asctime)s | %(message)s")

file_handler = RotatingFileHandler(
    os.path.join(LOG_DIR, LOG_FILE), maxBytes=2_000_000, backupCount=5
)
file_handler.setFormatter(formatter)

console_handler = logging.StreamHandler(sys.stdout)
console_handler.setFormatter(formatter)

if not logger.handlers:
    logger.addHandler(file_handler)
    logger.addHandler(console_handler)
