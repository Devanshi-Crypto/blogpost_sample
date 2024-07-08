-- Create the authors table
CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    bio TEXT,
    joined_date DATE DEFAULT CURRENT_DATE
);

-- Create the categories table
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

-- Create the posts table
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    content TEXT,
    author_id INTEGER REFERENCES authors(id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE,
    tags TEXT[],
    status TEXT CHECK (status IN ('draft', 'published', 'archived')),
    metadata JSONB
);

-- Create the post_categories junction table
CREATE TABLE post_categories (
    post_id INTEGER REFERENCES posts(id),
    category_id INTEGER REFERENCES categories(id),
    PRIMARY KEY (post_id, category_id)
);

-- Create index for full-text search
CREATE EXTENSION IF NOT EXISTS pg_trgm;
CREATE INDEX posts_content_idx ON posts USING GIN (to_tsvector('english', content));