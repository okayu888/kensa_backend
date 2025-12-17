-- =========================
-- 患者テーブル
-- =========================
DROP TABLE IF EXISTS patients;

CREATE TABLE patients (
  patient_id INTEGER PRIMARY KEY AUTOINCREMENT,
  patient_code TEXT NOT NULL UNIQUE,
  name TEXT NOT NULL,
  birth_date TEXT,
  age INTEGER,
  gender TEXT,
  medical_history TEXT,
  medication_info TEXT,
  notes TEXT,
  created_at TEXT DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- 検査テーブル
-- =========================
DROP TABLE IF EXISTS exams;

CREATE TABLE exams (
  exam_id TEXT PRIMARY KEY,
  patient_id INTEGER NOT NULL,
  exam_date TEXT NOT NULL,
  exam_time TEXT NOT NULL,
  laxative_type TEXT,
  note TEXT,
  FOREIGN KEY (patient_id) REFERENCES patients (patient_id)
);


-- =========================
-- 記録ログテーブル
-- =========================
DROP TABLE IF EXISTS logs;

CREATE TABLE logs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  exam_id TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  category TEXT NOT NULL,   -- laxative / stool / symptom
  label TEXT,               -- 腹痛・吐き気・その他（症状のみ）
  count INTEGER NOT NULL,   -- カウント
  note TEXT,
  FOREIGN KEY (exam_id) REFERENCES exams (exam_id)
);
