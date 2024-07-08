-- Insert sample authors
INSERT INTO authors (name, bio) VALUES
('John Doe', 'A passionate writer'),
('Jane Smith', 'Tech enthusiast and blogger');

-- Insert sample categories
INSERT INTO categories (name) VALUES
('Technology'),
('Lifestyle'),
('Travel');

-- Insert sample posts
INSERT INTO posts (title, content, author_id, tags, status, metadata) VALUES
('First Post', 'This is the content of the first post', 1, 
 ARRAY['intro', 'welcome'], 'published', 
 '{"views": 100, "likes": 10}'::jsonb),
('PostgreSQL Tips', 'Here are some advanced PostgreSQL tips...', 2,
 ARRAY['database', 'tips'], 'published',
 '{"views": 150, "likes": 25}'::jsonb),
('Travel Adventures', 'My recent travel experiences...', 1,
 ARRAY['travel', 'adventure'], 'draft',
 '{"views": 0, "likes": 0}'::jsonb);

-- Insert sample post_categories
INSERT INTO post_categories (post_id, category_id) VALUES
(1, 1), -- First Post in Technology
(2, 1), -- PostgreSQL Tips in Technology
(3, 3); -- Travel Adventures in Travel