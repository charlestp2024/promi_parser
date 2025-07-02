# services/logger.py
import logging
from logging.handlers import RotatingFileHandler
import os
import sys
import io

LOG_DIR = "logs"
LOG_FILE = "import.log"
os.makedirs(LOG_DIR, exist_ok=True)

# ✅ Force UTF-8 for stdout to support characters like ✓ ✗ ⏱
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")

# ✅ Initialize logger
logger = logging.getLogger("promive_logger")
logger.setLevel(logging.INFO)

formatter = logging.Formatter("%(levelname)s | %(asctime)s | %(message)s")

# ✅ File handler with UTF-8 encoding
file_handler = RotatingFileHandler(
    os.path.join(LOG_DIR, LOG_FILE),
    maxBytes=2_000_000,
    backupCount=5,
    encoding="utf-8",  # Ensure file supports all characters
)
file_handler.setFormatter(formatter)

# ✅ Console handler using UTF-8-safe stdout
console_handler = logging.StreamHandler(sys.stdout)
console_handler.setFormatter(formatter)

# ✅ Add handlers only once
if not logger.hasHandlers():
    logger.addHandler(file_handler)
    logger.addHandler(console_handler)
