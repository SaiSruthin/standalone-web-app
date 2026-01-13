-- Migration: Add Sprints functionality
-- This migration adds sprint support to the project management tool

-- Create sprints table
CREATE TABLE IF NOT EXISTS sprints (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    project_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    goal TEXT,
    start_date DATE,
    end_date DATE,
    status TEXT NOT NULL DEFAULT 'PLANNING' CHECK(status IN ('PLANNING', 'ACTIVE', 'COMPLETED')),
    completed_at DATETIME,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE
);

-- Add sprint_id column to tasks (nullable)
ALTER TABLE tasks ADD COLUMN sprint_id INTEGER REFERENCES sprints(id) ON DELETE SET NULL;

-- Add story_points column to tasks (nullable)
ALTER TABLE tasks ADD COLUMN story_points INTEGER;

-- Add backlog_order column to tasks (nullable)
ALTER TABLE tasks ADD COLUMN backlog_order INTEGER;

-- Create indexes for sprints
CREATE INDEX IF NOT EXISTS idx_sprints_project ON sprints(project_id);
CREATE INDEX IF NOT EXISTS idx_sprints_status ON sprints(status);

-- Create indexes for new task columns
CREATE INDEX IF NOT EXISTS idx_tasks_sprint ON tasks(sprint_id);
CREATE INDEX IF NOT EXISTS idx_tasks_backlog_order ON tasks(backlog_order);

