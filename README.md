# AI Hackathon Copilot

An intelligent AI-powered hackathon planning and collaboration platform designed for students, teams, mentors, and organizers. Features an advanced AI copilot that assists with idea generation, architecture suggestions, debugging, and team coordination.

## Features

### 🤖 AI Copilot
- **Idea Generation**: Generate innovative hackathon project ideas based on topics and constraints
- **Architecture Suggestions**: Get AI-powered recommendations for tech stacks and architecture patterns
- **Debugging Assistance**: Real-time debugging help and code suggestions
- **Team Coordination**: AI-assisted team management and task delegation

### 👥 Collaboration Features
- Real-time team collaboration workspace
- Project management and task tracking
- Team member roles and permissions
- Code snippet sharing
- Resource library

### 📊 Dashboard
- Project overview and analytics
- Team performance metrics
- Timeline and milestone tracking
- Integration with GitHub

## Tech Stack

### Frontend
- **Framework**: Next.js 14
- **Styling**: Tailwind CSS
- **Language**: TypeScript
- **State Management**: Zustand
- **HTTP Client**: Axios

### Backend
- **Runtime**: Node.js
- **Framework**: Express.js
- **Database**: MongoDB
- **Authentication**: JWT
- **API Integration**: Perplexity AI

### Deployment
- **Frontend**: Vercel
- **Backend**: Heroku / Railway
- **Database**: MongoDB Atlas

## Project Structure

```
ai-hackathon-copilot/
├── frontend/                 # Next.js frontend application
│   ├── src/
│   │   ├── components/      # Reusable React components
│   │   ├── pages/           # Next.js pages
│   │   └── utils/           # Utility functions
│   ├── public/              # Static assets
│   └── package.json
├── server/                   # Express.js backend
│   ├── routes/              # API routes
│   ├── models/              # MongoDB schemas
│   ├── middleware/          # Express middleware
│   └── index.js             # Server entry point
├── .env.example             # Environment variables template
├── package.json             # Root package.json
└── README.md
```

## Getting Started

### Prerequisites
- Node.js (v16 or higher)
- npm or yarn
- MongoDB Atlas account
- Perplexity API key

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/HRISHIKESH-hackoff/ai-hackathon-copilot.git
   cd ai-hackathon-copilot
   ```

2. **Set up environment variables**
   ```bash
   cp .env.example .env.local
   # Edit .env.local with your configuration
   ```

3. **Install root dependencies**
   ```bash
   npm install
   ```

4. **Install frontend dependencies**
   ```bash
   cd frontend
   npm install
   cd ..
   ```

5. **Install backend dependencies**
   ```bash
   cd server
   npm install
   cd ..
   ```

### Running the Application

**Development Mode** (Run both frontend and backend concurrently):
```bash
npm run dev
```

**Frontend Only**:
```bash
cd frontend
npm run dev
```

**Backend Only**:
```bash
cd server
npm run dev
```

**Production Build**:
```bash
npm run build
```

## API Endpoints

### Health Check
- `GET /api/health` - Server health status

### AI Copilot
- `POST /api/copilot/generate-ideas` - Generate hackathon project ideas
- `POST /api/copilot/architecture` - Get architecture recommendations
- `POST /api/copilot/debug` - Get debugging assistance

### User Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - User login
- `POST /api/auth/logout` - User logout

### Teams
- `GET /api/teams` - List user's teams
- `POST /api/teams` - Create new team
- `GET /api/teams/:id` - Get team details
- `PUT /api/teams/:id` - Update team
- `DELETE /api/teams/:id` - Delete team

### Projects
- `GET /api/projects` - List projects
- `POST /api/projects` - Create new project
- `GET /api/projects/:id` - Get project details
- `PUT /api/projects/:id` - Update project
- `DELETE /api/projects/:id` - Delete project

## Environment Variables

```
PORT=5000                                    # Server port
NODE_ENV=development                         # Environment
MONGODB_URI=your_mongodb_connection_string   # MongoDB connection
JWT_SECRET=your_secret_key                   # JWT secret
PERPLEXITY_API_KEY=your_api_key              # Perplexity API key
NEXT_PUBLIC_API_URL=http://localhost:5000   # API base URL
```

## Development Guidelines

### Code Style
- Use TypeScript for type safety
- Follow ESLint configuration
- Use Prettier for code formatting
- Component names should be PascalCase
- Utility functions should be camelCase

### Git Workflow
1. Create a feature branch: `git checkout -b feature/your-feature`
2. Make changes and commit: `git commit -m "Add feature"`
3. Push to branch: `git push origin feature/your-feature`
4. Submit a Pull Request

## Deployment

### Deploy Frontend to Vercel
```bash
cd frontend
npm install -g vercel
vercel
```

### Deploy Backend
```bash
# Using Heroku
heroku create your-app-name
heroku config:set NODE_ENV=production
heroku config:set MONGODB_URI=your_mongodb_uri
heroku config:set JWT_SECRET=your_secret
heroku config:set PERPLEXITY_API_KEY=your_api_key
git push heroku main
```

## Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

MIT License - See LICENSE file for details

## Support

For support, email hrishikesh@example.com or create an issue in the repository.

## Roadmap

- [ ] Real-time collaboration with WebSockets
- [ ] Video/Audio chat integration
- [ ] Advanced code editor integration
- [ ] CI/CD pipeline integration
- [ ] Mobile app (React Native)
- [ ] Advanced AI features with GPT-4
- [ ] Hackathon event management
- [ ] Prize and leaderboard system

---

**Created with ❤️ by HRISHIKESH-hackoff**
