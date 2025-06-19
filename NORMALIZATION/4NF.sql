-- ❌ TABLE VIOLATING 4NF
-- Problem: Multi-valued dependencies (MVDs)

CREATE TABLE student_skills_projects_raw (
    student_name VARCHAR(50),
    skill VARCHAR(50),
    project VARCHAR(50)
);

INSERT INTO student_skills_projects_raw VALUES
('Akhil', 'SQL', 'Library App'),
('Akhil', 'Java', 'Library App'),
('Akhil', 'SQL', 'E-Commerce'),
('Akhil', 'Java', 'E-Commerce');

-- Here, skills and projects are independent — MVD violation

-- ✅ FIX 4NF — Split into 2 tables

-- 1. Student Skills
CREATE TABLE student_skills (
    student_name VARCHAR(50),
    skill VARCHAR(50)
);

INSERT INTO student_skills VALUES
('Akhil', 'SQL'),
('Akhil', 'Java');

-- 2. Student Projects
CREATE TABLE student_projects (
    student_name VARCHAR(50),
    project VARCHAR(50)
);

INSERT INTO student_projects VALUES
('Akhil', 'Library App'),
('Akhil', 'E-Commerce');
