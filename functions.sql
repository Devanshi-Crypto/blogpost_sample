-- Function to get posts by author
CREATE OR REPLACE FUNCTION get_posts_by_author(author_name TEXT)
RETURNS TABLE (post_title TEXT, post_status TEXT) AS $$
BEGIN
    RETURN QUERY
    SELECT p.title, p.status
    FROM posts p
    JOIN authors a ON p.author_id = a.id
    WHERE a.name = author_name;
END;
$$ LANGUAGE plpgsql;

-- Usage example:
-- SELECT * FROM get_posts_by_author('John Doe');

-- Function to update post status
CREATE OR REPLACE FUNCTION update_post_status(post_id INT, new_status TEXT)
RETURNS VOID AS $$
BEGIN
    UPDATE posts
    SET status = new_status,
        updated_at = CURRENT_TIMESTAMP
    WHERE id = post_id;
END;
$$ LANGUAGE plpgsql;

-- Usage example:
-- SELECT update_post_status(1, 'archived');

-- Trigger function to update 'updated_at' timestamp
CREATE OR REPLACE FUNCTION update_modified_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create trigger
CREATE TRIGGER update_post_modtime
BEFORE UPDATE ON posts
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();