# 🗂️ Task Manager Database

## 📘 Overview
This project is a simple SQL-based Task Manager system demonstrating basic CRUD operations, relationships, and queries.

## 🧩 Database Information
**Database Name:** task_manager

### Tables Created:
1. **users**
   - id (Primary Key)
   - name
   - email
   - created_at

2. **tasks**
   - id (Primary Key)
   - user_id (Foreign Key → users.id)
   - title
   - description
   - status
   - created_at

### Relationship:
One-to-Many (1:N)
Each user can have multiple tasks.
`tasks.user_id` references `users.id`.

## 🧾 SQL Queries Used

### Data Retrieval
```sql
SELECT * FROM tasks;
```

### Update Task
```sql
UPDATE tasks 
SET status = 'Completed' 
WHERE id = 2;
```

### Delete Task
```sql
DELETE FROM tasks 
WHERE id = 5;
```

### Sorting & Pagination
```sql
SELECT * FROM tasks 
ORDER BY created_at 
DESC LIMIT 3;
```

### Aggregation
```sql
SELECT u.name, COUNT(t.id) AS total_tasks
FROM users u
LEFT JOIN tasks t ON u.id = t.user_id
GROUP BY u.id;
```

### Joins
- **INNER JOIN**
```sql
SELECT u.name, t.title, t.status
FROM users u
INNER JOIN tasks t ON u.id = t.user_id;
```
- **LEFT JOIN**
```sql
SELECT u.name, t.title, t.status
FROM users u
LEFT JOIN tasks t ON u.id = t.user_id;
```
- **RIGHT JOIN**
```sql
SELECT u.name, t.title, t.status
FROM users u
RIGHT JOIN tasks t ON u.id = t.user_id;
```


## 📅 Created On
2025-10-05

## 👨‍💻 Author
**Jabed Hosen**
