# Team Projects & Workflow Manager

A standalone web application for managing team projects, tasks, workflows, and organizations with role-based permissions and activity history.

## Features

- **Organizations**: Create and manage organizations with role-based access control
- **Projects**: Create projects within organizations with custom workflow configurations
- **Tasks**: Manage tasks with status transitions, priorities, due dates, and assignees
- **Workflows**: Define custom status workflows with allowed transitions
- **Permissions**: Role-based permissions (Owner, Admin, Member, Viewer)
- **Activity History**: Complete audit trail of all changes
- **Authentication**: Session-based user authentication

## Tech Stack

- **Frontend**: React + TypeScript + Vite
- **Backend**: Node.js + Express + TypeScript
- **Database**: SQLite with sql.js (pure JavaScript, no native compilation required)

## Setup

### Prerequisites

- Node.js (v18 or higher)
- npm

### Installation

1. Install dependencies for both frontend and backend:
   ```bash
   npm run install:all
   ```

   Or install them separately:
   ```bash
   npm run install:backend
   npm run install:frontend
   ```

### Running the Application

1. Start the backend server (in one terminal):
   ```bash
   npm run dev:backend
   ```
   The backend will run on http://localhost:3001

2. Start the frontend development server (in another terminal):
   ```bash
   npm run dev:frontend
   ```
   The frontend will run on http://localhost:5173

3. Open your browser and navigate to http://localhost:5173

### Database

The SQLite database is automatically created in `backend/data/app.db` when the server starts. The schema is automatically applied from `database/schema.sql`.

## Usage

1. **Register/Login**: Create an account or login with existing credentials
2. **Create Organization**: Create a new organization (you'll automatically be the owner)
3. **Add Members**: Invite team members and assign roles
4. **Create Projects**: Create projects within organizations
5. **Configure Workflows**: Define custom status workflows for each project
6. **Manage Tasks**: Create tasks, update statuses, assign priorities and due dates
7. **View Activity**: Track all changes in the activity feed

## Role Permissions

| Action | Owner | Admin | Member | Viewer |
|--------|-------|-------|--------|--------|
| Manage org members | ✓ | ✓ | ✗ | ✗ |
| Create/delete projects | ✓ | ✓ | ✓ | ✗ |
| Edit project workflow | ✓ | ✓ | ✓ | ✗ |
| Create/edit tasks | ✓ | ✓ | ✓ | ✗ |
| Delete tasks | ✓ | ✓ | ✓ | ✗ |
| Change task status | ✓ | ✓ | ✓ | ✗ |
| View projects/tasks | ✓ | ✓ | ✓ | ✓ |
| Delete organization | ✓ | ✗ | ✗ | ✗ |

## Project Structure

```
standalone web app/
├── backend/          # Express backend
│   ├── src/
│   │   ├── config/   # Database configuration
│   │   ├── models/   # Data models
│   │   ├── routes/   # API routes
│   │   ├── services/ # Business logic
│   │   ├── middleware/ # Auth & permissions
│   │   └── utils/    # Utilities
│   └── data/         # SQLite database (auto-generated)
├── frontend/         # React frontend
│   └── src/
│       ├── components/ # React components
│       ├── context/    # React context
│       └── services/   # API client
├── database/         # SQL schema
└── README.md
```

## API Endpoints

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login
- `POST /api/auth/logout` - Logout
- `GET /api/auth/me` - Get current user

### Organizations
- `GET /api/organizations` - List user's organizations
- `POST /api/organizations` - Create organization
- `GET /api/organizations/:id` - Get organization details
- `PUT /api/organizations/:id` - Update organization
- `DELETE /api/organizations/:id` - Delete organization
- `GET /api/organizations/:id/members` - Get members
- `POST /api/organizations/:id/members` - Add member
- `PUT /api/organizations/:id/members/:userId` - Update member role
- `DELETE /api/organizations/:id/members/:userId` - Remove member

### Projects
- `GET /api/projects?organization_id=:id` - List projects
- `POST /api/projects` - Create project
- `GET /api/projects/:id` - Get project details
- `PUT /api/projects/:id` - Update project
- `DELETE /api/projects/:id` - Delete project

### Tasks
- `GET /api/tasks?project_id=:id` - List tasks
- `POST /api/tasks` - Create task
- `GET /api/tasks/:id` - Get task details
- `PUT /api/tasks/:id` - Update task
- `DELETE /api/tasks/:id` - Delete task

### Activity
- `GET /api/activity/organization/:id` - Get organization activity
- `GET /api/activity/project/:id` - Get project activity
- `GET /api/activity/task/:id` - Get task activity
- `GET /api/activity/user/me` - Get user activity

## Development

The application uses:
- **TypeScript** for type safety
- **Express sessions** for authentication
- **better-sqlite3** for synchronous database operations
- **React Router** for client-side routing
- **Vite** for fast frontend development

## License

ISC

