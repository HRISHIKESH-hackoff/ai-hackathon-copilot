import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';

dotenv.config();

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(express.json());

// Routes
app.get('/api/health', (req, res) => {
  res.json({ status: 'AI Hackathon Copilot Server is running' });
});

// AI Copilot Routes
app.post('/api/copilot/generate-ideas', async (req, res) => {
  try {
    const { topic, count } = req.body;
    // TODO: Integrate Perplexity API
    res.json({
      success: true,
      ideas: [
        { id: 1, title: 'Sample Idea 1', description: 'This is a sample hackathon idea' },
        { id: 2, title: 'Sample Idea 2', description: 'Another sample idea' }
      ]
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.post('/api/copilot/architecture', async (req, res) => {
  try {
    const { projectDescription } = req.body;
    // TODO: Integrate Perplexity API for architecture suggestions
    res.json({
      success: true,
      architecture: {
        frontend: 'React/Next.js with Tailwind CSS',
        backend: 'Node.js/Express',
        database: 'MongoDB',
        deployment: 'Vercel for frontend, Heroku for backend'
      }
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.post('/api/copilot/debug', async (req, res) => {
  try {
    const { code, error } = req.body;
    // TODO: Integrate Perplexity API for debugging
    res.json({
      success: true,
      suggestion: 'This is a sample debugging suggestion'
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Error handling
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ error: 'Internal Server Error' });
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
