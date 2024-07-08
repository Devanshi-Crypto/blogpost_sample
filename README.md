# PostgreSQL Blog Management System

This repository contains SQL scripts for a simple blog management system implemented in PostgreSQL. It demonstrates various PostgreSQL features and best practices for database design.

## Files:

- `schema.sql`: Contains table creation statements and index setup
- `sample_data.sql`: Inserts sample data into the tables
- `queries.sql`: Example queries demonstrating PostgreSQL features
- `functions.sql`: Custom functions, procedures, and triggers

## Usage:

1. Run `schema.sql` to create the database structure.
2. Execute `sample_data.sql` to populate the tables with sample data.
3. Use `queries.sql` to see example operations and PostgreSQL features in action.
4. Explore `functions.sql` for custom database functions and triggers.

## Features Demonstrated:

- Advanced data types (JSONB, arrays)
- Full-text search using GIN index
- Common Table Expressions (CTEs)
- Window functions
- JSON operations
- Custom functions and triggers
- Upsert operations

## Database Schema:

- authors: Stores information about blog post authors
- categories: Contains different blog categories
- posts: Main table for blog posts, including metadata and tags
- post_categories: Junction table for many-to-many relationship between posts and categories

Feel free to explore and use these scripts as a learning resource for PostgreSQL!

## How to Run them on VSCode?
    To run SQL files in Visual Studio Code (VS Code), you'll need to set up a PostgreSQL extension and configure your database connection. Here's a step-by-step guide:

    1. Install the PostgreSQL extension:
    - Open VS Code
    - Go to the Extensions view (Ctrl+Shift+X or Cmd+Shift+X on Mac)
    - Search for "PostgreSQL" 
    - Install the extension by Chris Kolkman (it should have a blue elephant icon)

    2. Configure your database connection:
    - Press Ctrl+Shift+P (or Cmd+Shift+P on Mac) to open the Command Palette
    - Type "PostgreSQL: Add Connection" and select it
    - Fill in your database details:
        - Host: localhost (or your database server address)
        - User: postgres (or your database username)
        - Password: (your database password)
        - Port: 5432 (default PostgreSQL port)
        - Database: blogpost_manager (or your database name)

    3. Open your SQL file in VS Code

    4. Run SQL queries:
    - To run the entire file:
        - Right-click anywhere in the file
        - Select "Run PostgreSQL Query"
    - To run a specific query:
        - Select the query text
        - Right-click and choose "Run PostgreSQL Query"
    - Alternatively, you can use the shortcut Ctrl+Enter (Cmd+Enter on Mac) to run the selected query or the entire file if nothing is selected

    5. View results:
    - The query results will appear in a new tab


## Note:

This is a demonstration project and may not include all best practices for a production environment. Always consider security, performance, and specific requirements when designing a real-world database system.