# 🪟 SQL Window Functions – Explained with Real Sales Data

Window functions allow you to perform **calculations across rows related to the current row**, without collapsing them like `GROUP BY`. Perfect for **ranking, comparisons, running totals**, and more.

---

## 🧱 Sample Table: `sales`

| sale_id | emp_name | region | amount |
|---------|----------|--------|--------|
| 1       | Akhil    | South  | 5000   |
| 2       | Akhil    | South  | 8000   |
| 3       | Priya    | North  | 6000   |
| 4       | Priya    | North  | 7500   |
| 5       | Karan    | East   | 4000   |
| 6       | Karan    | East   | 9000   |
| 7       | Sneha    | West   | 8500   |
| 8       | Sneha    | West   | 8500   |

---

## 🔢 `ROW_NUMBER()`

Assigns a **unique row number** within a partition (based on order).

```sql
SELECT emp_name, region, amount,
  ROW_NUMBER() OVER(PARTITION BY emp_name ORDER BY amount DESC) AS row_num
FROM sales;
```

📌 Use for pagination or picking *Nth highest* row.

---

## 🏅 `RANK()`

Ranks rows within a partition, **skips numbers** when ties occur.

```sql
SELECT emp_name, region, amount,
  RANK() OVER(PARTITION BY region ORDER BY amount DESC) AS rnk
FROM sales;
```

📌 Use when ties matter, and you need gaps.

---

## 🥈 `DENSE_RANK()`

Ranks rows like `RANK()` but **no gaps** in ranking.

```sql
SELECT emp_name, region, amount,
  DENSE_RANK() OVER(PARTITION BY region ORDER BY amount DESC) AS dense_rnk
FROM sales;
```

📌 Ideal when you want continuous ranking (e.g., 1, 2, 2, 3).

---

## 🔮 `LEAD()`

Accesses the **next row’s** value from the current row.

```sql
SELECT emp_name, region, amount,
  LEAD(amount) OVER(PARTITION BY emp_name ORDER BY amount) AS next_sale
FROM sales;
```

📌 Use for comparing current vs future values.

---

## 🧭 `LAG()`

Accesses the **previous row’s** value.

```sql
SELECT emp_name, region, amount,
  LAG(amount) OVER(PARTITION BY emp_name ORDER BY amount) AS prev_sale
FROM sales;
```

📌 Use for change calculations or trend analysis.

---

## 🎲 `NTILE(n)`

Divides result set into `n` buckets.

```sql
SELECT emp_name, region, amount,
  NTILE(2) OVER(ORDER BY amount DESC) AS half_bucket
FROM sales;
```

📌 Use for percentile, quartile, or ranking-based banding.

---

## 💰 `SUM() OVER(PARTITION BY ...)`

Calculates **running total** or totals by group without collapsing rows.

```sql
SELECT emp_name, region, amount,
  SUM(amount) OVER(PARTITION BY emp_name ORDER BY sale_id) AS running_total
FROM sales;
```

📌 Running totals or rolling aggregates.

---

## 🌍 `SUM() OVER()` (No PARTITION)

Calculates **total across all rows**.

```sql
SELECT emp_name, region, amount,
  SUM(amount) OVER() AS grand_total
FROM sales;
```

📌 Every row will have the same grand total.

---

## 🧠 Summary Table

| Function       | Use Case                               |
|----------------|------------------------------------------|
| `ROW_NUMBER()` | Unique row ID per partition              |
| `RANK()`       | Rank with gaps for ties                  |
| `DENSE_RANK()` | Rank without gaps for ties               |
| `LEAD()`       | Fetch value from next row                |
| `LAG()`        | Fetch value from previous row            |
| `NTILE(n)`     | Divide data into n evenly distributed buckets |
| `SUM() OVER()` | Running or grand total                   |

---

If this helped you,  
**drop a ⭐ star** and pass it on to others.  
Let’s make SQL simple, strong, and worth loving 💙

---

**Author:** Akhila Juturu  
📩 jakhilareddy2204@gmail.com
