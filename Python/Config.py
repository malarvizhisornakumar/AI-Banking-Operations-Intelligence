"""
===============================================================================
Project : AI Cheque Extraction Quality Analytics Platform
File    : 07_Config.py
Author  : Malarvizhi S
Description : Project Configuration
===============================================================================
"""

from pathlib import Path

# =============================================================================
# Project Paths
# =============================================================================

PROJECT_ROOT = Path(__file__).resolve().parent

DATA_FOLDER = PROJECT_ROOT / "Data"

OUTPUT_FOLDER = PROJECT_ROOT / "Output"

LOG_FOLDER = PROJECT_ROOT / "Logs"

# =============================================================================
# SQL Server Configuration
# =============================================================================

SQL_SERVER = r"localhost\SQLEXPRESS"

DATABASE = "AI_Cheque_Analytics_DB"

ODBC_DRIVER = "ODBC Driver 17 for SQL Server"

TRUSTED_CONNECTION = "yes"

# =============================================================================
# Source Files
# =============================================================================

RAW_DATA_FILE = DATA_FOLDER / "Generated_Banking_Data.csv"

VALIDATED_DATA_FILE = OUTPUT_FOLDER / "Validated_Banking_Data.csv"

VALIDATION_REPORT = OUTPUT_FOLDER / "Validation_Report.csv"

DUPLICATE_REPORT = OUTPUT_FOLDER / "Duplicate_Exception_Report.csv"

KPI_REPORT = OUTPUT_FOLDER / "KPI_Report.csv"

# =============================================================================
# Business Rules
# =============================================================================

VALID_ACCOUNT_LENGTHS = [6, 7, 8, 10, 16]

MIN_CONFIDENCE_SCORE = 80

START_DATE = "2000-01-01"

END_DATE = "2017-12-31"

# =============================================================================
# Batch Configuration
# =============================================================================

MAX_BOXES = 100

MAX_RC_BOXES = 500

MAX_SHOE_BOXES = 2000

CHEQUES_PER_SHOEBOX_MIN = 2000

CHEQUES_PER_SHOEBOX_MAX = 3000

# =============================================================================
# AI Model Information
# =============================================================================

MODEL_NAME = "Qwen2.5-VL"

MODEL_VERSION = "2.5"

OCR_ENGINE = "Ollama"

# =============================================================================
# Default Status
# =============================================================================

STATUS_COMPLETED = "Completed"

STATUS_FAILED = "Failed"

STATUS_PENDING = "Pending Validation"

STATUS_MANUAL = "Manual Review"

# =============================================================================
# Dashboard Thresholds
# =============================================================================

GREEN_THRESHOLD = 99

AMBER_THRESHOLD = 95

RED_THRESHOLD = 90

print("Configuration Loaded Successfully")
