# 📦 SQL Server Automation Project — Stored Procedures & Triggers

Welcome to our database project repository, designed for **Fatma Al-Mamari** by **Samir, Is’haq, and Mohammed Al-Khusaibi**. This project demonstrates practical applications of **Stored Procedures** and **Triggers** in Microsoft SQL Server using real-world scenarios: an Anime Catalog System (`AnimeRed`) and a Product Auditing System.

---

## 📑 <details>
<summary>Table of Contents</summary>

- [📌 About Stored Procedures](#-about-stored-procedures)
- [⚙ Why Use Stored Procedures?](#-why-use-stored-procedures)
- [🛠 Limitations of Stored Procedures](#-limitations-of-stored-procedures)
- [📚 Types of Stored Procedures](#-types-of-stored-procedures)
- [📄 SQL Stored Procedure Syntax](#-sql-stored-procedure-syntax)
- [🎮 Project Scenario: AnimeRed](#-project-scenario-animered)
  - [➕ Add New Anime (Stored Procedure)](#-add-new-anime-stored-procedure)
  - [🔄 Alter Procedure with Print](#-alter-procedure-with-print)
  - [📤 Output Parameter Example](#-output-parameter-example)
  - [🔁 Loop + Condition Based Procedure](#-loop--condition-based-procedure)
- [🧠 About SQL Triggers](#-about-sql-triggers)
- [🏗 Steps to Build a Trigger](#-steps-to-build-a-trigger)
  - [📋 Step 1: Audit Table](#-step-1-audit-table)
  - [📥 Step 2: After DML Trigger](#-step-2-after-dml-trigger)
  - [🧪 Step 3: Testing with Inserts](#-step-3-testing-with-inserts)
  - [🗑 Step 4: Testing with Deletes](#-step-4-testing-with-deletes)
- [✅ Conclusion](#-conclusion)

</details>

---

## 📌 About Stored Procedures

Stored Procedures are precompiled SQL statements that enhance performance, reusability, and security by encapsulating logic into callable modules.

_🧠 Simplified_: Imagine a fancy restaurant. Instead of repeating your order every time, you hit a button (`EXEC`) and get your meal based on predefined parameters — that’s how stored procedures work.

---

## ⚙ Why Use Stored Procedures?

1. **Performance** — Precompiled, faster execution.
2. **Reusability & Modularity** — Reuse logic across the system.
3. **Security** — Grant access to procedures instead of direct table access.

---

## 🛠 Limitations of Stored Procedures

- Debugging complexity.
- Hard to integrate with version control.
- Can cause scattered business logic across code and database.

---

## 📚 Types of Stored Procedures

- **System**: Built-in for administration (`sp_help`, `sp_rename`)
- **User Defined (UDP)**: Custom logic like `AddAnime`
- **Extended**: Written in other languages (C, C++)
- **CLR**: Use .NET languages (like C#) for advanced logic

---

## 📄 SQL Stored Procedure Syntax

```sql
CREATE PROCEDURE procedure_name
  @Param1 TYPE,
  @Param2 TYPE
AS
BEGIN
  -- SQL statements
END;
```

---

## 🎮 Project Scenario: AnimeRed

A platform for cataloging and rating anime, demonstrating stored procedures.

### ➕ Add New Anime (Stored Procedure)

```sql
CREATE PROCEDURE AddAnime
  @Title NVARCHAR(100),
  @Genre NVARCHAR(50),
  @Episodes INT,
  @Rating FLOAT
AS
BEGIN
  INSERT INTO Anime (...) VALUES (...);
END;
```

### 🔄 Alter Procedure with Print

```sql
PRINT 'Anime successfully added!';
```

### 📤 Output Parameter Example

```sql
@NewAnimeID INT OUTPUT
```

### 🔁 Loop + Condition Based Procedure

```sql
WHILE @CurrentID <= @MaxID
BEGIN
  IF EXISTS (...) PRINT 'Top-rated Anime: ...';
END;
```

---

## 🧠 About SQL Triggers

Triggers are automated "guards" that fire after `INSERT`, `DELETE`, or `UPDATE` events to track changes and enhance data integrity.

---

## 🏗 Steps to Build a Trigger

### 📋 Step 1: Audit Table

```sql
CREATE TABLE product_audits (
  change_id INT PRIMARY KEY,
  product_id INT,
  ...
);
```

### 📥 Step 2: After DML Trigger

```sql
CREATE TRIGGER keep_changes
ON production.products
AFTER INSERT, DELETE
AS
BEGIN
  -- Audit logic
END;
```

### 🧪 Step 3: Testing with Inserts

```sql
INSERT INTO production.products (...) VALUES (...);
```

### 🗑 Step 4: Testing with Deletes

```sql
DELETE FROM production.products WHERE product_id = ...;
```

---

## ✅ Conclusion

This project illustrates how **Stored Procedures** and **Triggers** can automate and secure business logic within a SQL Server environment using real-world scenarios such as an anime rating platform and a product audit system.

---

## 🧾 License

MIT License – feel free to use, modify, and share.

---
