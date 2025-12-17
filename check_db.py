import sqlite3
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent
DB_PATH = BASE_DIR / "kensa.db"


def main():
    conn = sqlite3.connect(DB_PATH)
    cur = conn.cursor()

    # 患者を1人追加
    cur.execute("""
        INSERT INTO patients (
            patient_code,
            name,
            birth_date,
            age,
            gender,
            medical_history,
            medication_info,
            notes
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    """, (
        "P-001",
        "山田 太郎",
        "1980-05-01",
        44,
        "男性",
        "高血圧",
        "降圧剤",
        "初診"
    ))

    conn.commit()

    # 登録結果を確認
    cur.execute("SELECT * FROM patients;")
    rows = cur.fetchall()

    print("=== patients の中身 ===")
    for row in rows:
        print(row)

    conn.close()

if __name__ == "__main__":
    main()
