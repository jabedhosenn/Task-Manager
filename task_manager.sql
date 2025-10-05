CREATE DATABASE task_manager;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    status VARCHAR(50) DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
INSERT INTO users (name, email) VALUES
('Jabed', 'jabed@gmail.com'),
('Nahid', 'nahid@gmail.com'),
('Shovon', 'shovon@gmail.com');

INSERT INTO tasks (user_id, title, description, status) VALUES
(1, 'Complete project report', 'Finish the final report for the project by end of the week.', 'In Progress'),
(1, 'Team meeting', 'Organize a team meeting to discuss project milestones.', 'Pending'),
(2, 'Code review', 'Review code submissions from the development team.', 'Completed'),
(3, 'Client presentation', 'Prepare slides for the upcoming client presentation.', 'Pending');

-- End of file

-- Step 4: SQL Queries
-- Select All Tasks
SELECT * FROM tasks;

-- Update a Task’s Status
UPDATE tasks
SET status = 'Completed'
WHERE id = 2;

-- Delete a Task
DELETE FROM tasks
WHERE id = 3;

-- Show Tasks with Sorting and Limit (Pagination)
SELECT * FROM tasks
ORDER BY created_at DESC
LIMIT 10 OFFSET 0;

-- Aggregator Functions
SELECT u.name, COUNT(t.id) AS total_tasks
FROM users u
LEFT JOIN tasks t ON u.id = t.user_id
GROUP BY u.id;

-- Inner Join
SELECT u.name, t.title, t.status
FROM users u
INNER JOIN tasks t ON u.id = t.user_id;

-- Left Join
SELECT u.name, t.title, t.status
FROM users u
LEFT JOIN tasks t ON u.id = t.user_id;

-- Right Join
SELECT u.name, t.title, t.status
FROM users u
RIGHT JOIN tasks t ON u.id = t.user_id;
