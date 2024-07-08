-- Basic SELECT query
SELECT title, content FROM posts WHERE status = 'published';

-- JOIN query
SELECT p.title, a.name AS author
FROM posts p
JOIN authors a ON p.author_id = a.id;

-- JSON querying
SELECT title, metadata->>'views' AS views
FROM posts
WHERE (metadata->>'likes')::int > 5;

-- Full-text search
SELECT title
FROM posts
WHERE to_tsvector('english', content) @@ to_tsquery('english', 'postgresql');

-- Array operations
SELECT title
FROM posts
WHERE 'tips' = ANY(tags);

-- Common Table Expression (CTE)
WITH post_stats AS (
    SELECT author_id, COUNT(*) as post_count
    FROM posts
    GROUP BY author_id
)
SELECT authors.name, COALESCE(post_stats.post_count, 0) as post_count
FROM authors
LEFT JOIN post_stats ON authors.id = post_stats.author_id;

-- Window function
SELECT 
    title,
    created_at,
    ROW_NUMBER() OVER (PARTITION BY author_id ORDER BY created_at) as author_post_number
FROM posts;

-- Upsert operation
INSERT INTO categories (name)
VALUES ('Technology')
ON CONFLICT (name)
DO UPDATE SET name = EXCLUDED.name || ' (updated)';