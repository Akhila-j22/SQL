# 📐 SQL Normalization – Designing Smart Database Tables

**Normalization** is a process used to design relational database tables in a way that **eliminates redundancy**, improves **data integrity**, and ensures **efficient data storage**.

---

## 💡 Why Normalize?

Without normalization:
- Data gets repeated unnecessarily (redundancy)
- Updates become error-prone
- Inconsistencies arise

With normalization:
✅ Data is structured  
✅ Updates are easier  
✅ Storage is optimized

---

## 🔢 1NF – First Normal Form

📌 **Rule**:  
- Each column should contain **atomic (indivisible)** values  
- No repeating groups

### ❌ Bad Table (Unnormalized):

| Student_ID | Name   | Courses           |
|------------|--------|-------------------|
| 1          | Akhil  | DBMS, OS          |
| 2          | Priya  | DSA, Java, Python |

### ✅ In 1NF:

| Student_ID | Name   | Course   |
|------------|--------|----------|
| 1          | Akhil  | DBMS     |
| 1          | Akhil  | OS       |
| 2          | Priya  | DSA      |
| 2          | Priya  | Java     |
| 2          | Priya  | Python   |

---

## 🧱 2NF – Second Normal Form

📌 **Rule**:  
- Must be in **1NF**  
- **No partial dependency** (i.e., all non-key columns depend on the whole primary key)

### ❌ Bad Design:

| OrderID | ProductID | ProductName | CustomerName |
|---------|-----------|-------------|---------------|
| 1       | 101       | Keyboard    | Akhil         |
| 1       | 102       | Mouse       | Akhil         |

➡️ `CustomerName` depends only on `OrderID`, not `ProductID`.

### ✅ In 2NF:

**Orders Table:**

| OrderID | CustomerName |
|---------|---------------|
| 1       | Akhil         |

**OrderDetails Table:**

| OrderID | ProductID | ProductName |
|---------|-----------|-------------|
| 1       | 101       | Keyboard    |
| 1       | 102       | Mouse       |

---

## 🧱 3NF – Third Normal Form

📌 **Rule**:  
- Must be in **2NF**  
- **No transitive dependency** (i.e., non-key column should not depend on another non-key column)

### ❌ Bad Design:

| Emp_ID | Emp_Name | Dept_ID | Dept_Name |
|--------|----------|---------|------------|
| 1      | Akhil    | 101     | HR         |
| 2      | Priya    | 102     | IT         |

➡️ `Dept_Name` depends on `Dept_ID`, not `Emp_ID`.

### ✅ In 3NF:

**Employees Table:**

| Emp_ID | Emp_Name | Dept_ID |
|--------|----------|---------|
| 1      | Akhil    | 101     |
| 2      | Priya    | 102     |

**Departments Table:**

| Dept_ID | Dept_Name |
|---------|------------|
| 101     | HR         |
| 102     | IT         |

---

## 🧠 BCNF – Boyce-Codd Normal Form

📌 **Rule**:  
- Must be in **3NF**  
- For every functional dependency X → Y, X should be a **super key**

### ❌ Problem Case:

| Course | Instructor | Room |
|--------|------------|------|
| DBMS   | Akhil      | R1   |
| OS     | Priya      | R2   |

If:
- A course is taught by only one instructor  
- A room is assigned to only one instructor  
But Course is not a super key.

✅ Fix by separating:

**Course Table:**

| Course | Instructor |
|--------|------------|
| DBMS   | Akhil      |
| OS     | Priya      |

**Instructor_Room Table:**

| Instructor | Room |
|------------|------|
| Akhil      | R1   |
| Priya      | R2   |

---

## 🔁 4NF – Fourth Normal Form

📌 **Rule**:  
- Must be in **BCNF**  
- No **multi-valued dependencies**

### ❌ Bad Design:

| Student | Hobby   | Language |
|---------|---------|----------|
| Akhil   | Music   | English  |
| Akhil   | Dance   | English  |
| Akhil   | Music   | Hindi    |
| Akhil   | Dance   | Hindi    |

➡️ Hobby and Language are independent sets.

✅ In 4NF:

**Student_Hobby Table:**

| Student | Hobby   |
|---------|---------|
| Akhil   | Music   |
| Akhil   | Dance   |

**Student_Language Table:**

| Student | Language |
|---------|----------|
| Akhil   | English  |
| Akhil   | Hindi    |

---

## 🔄 5NF – Fifth Normal Form

📌 **Rule**:  
- Must be in **4NF**  
- Deals with **join dependency** — i.e., data can be split into smaller pieces and rejoined without loss

Often theoretical and rare, used in highly decomposed models like data warehouses.

---

## ✅ Summary Table

| Normal Form | Rule Focus                               |
|-------------|-------------------------------------------|
| 1NF         | Atomic values, no repeating groups        |
| 2NF         | No partial dependency                     |
| 3NF         | No transitive dependency                  |
| BCNF        | Super key dependency                      |
| 4NF         | No multi-valued dependency                |
| 5NF         | No join dependency                        |

---

If this helped you,  
**drop a ⭐ star** and pass it on to others.  
Let’s make SQL simple, strong, and worth loving 💙

---

**Author:** Akhila Juturu 
📩 jakhilareddy2204@gmail.com
