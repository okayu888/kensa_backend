import sqlite3
from pathlib import Path

DB_PATH = Path("kensa.db")
SCHEMA_PATH = Path("schema.sql")

def main():
    if not SCHEMA_PATH.exists():
        raise FileNotFoundError("schema.sql が見つかりません")

    conn = sqlite3.connect(DB_PATH)
    try:
        schema = SCHEMA_PATH.read_text(encoding="utf-8")
        conn.executescript(schema)
        conn.commit()
        print(f"✅ DBを作成しました: {DB_PATH.resolve()}")
    finally:
        conn.close()

if __name__ == "__main__":
    main()
