'use client';

import { useState, useEffect } from 'react';

export default function Home() {
  const [ideas, setIdeas] = useState([]);
  const [loading, setLoading] = useState(false);
  const [topic, setTopic] = useState('');

  const generateIdeas = async () => {
    setLoading(true);
    try {
      const response = await fetch(
        `${process.env.NEXT_PUBLIC_API_URL}/api/copilot/generate-ideas`,
        {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ topic, count: 5 }),
        }
      );
      const data = await response.json();
      setIdeas(data.ideas || []);
    } catch (error) {
      console.error('Error generating ideas:', error);
    } finally {
      setLoading(false);
    }
  };

  return (
    <main className="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100 py-12 px-4 sm:px-6 lg:px-8">
      <div className="max-w-7xl mx-auto">
        {/* Header */}
        <div className="text-center mb-12">
          <h1 className="text-4xl font-bold text-gray-900 mb-4">AI Hackathon Copilot</h1>
          <p className="text-xl text-gray-600">Your intelligent companion for hackathon success</p>
        </div>

        {/* Feature Cards */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-12">
          <FeatureCard
            icon="💡"
            title="Idea Generation"
            description="Get creative project ideas powered by AI"
          />
          <FeatureCard
            icon="🏗️"
            title="Architecture"
            description="Receive tech stack recommendations"
          />
          <FeatureCard
            icon="🐛"
            title="Debugging"
            description="AI-assisted code debugging help"
          />
          <FeatureCard
            icon="👥"
            title="Collaboration"
            description="Real-time team coordination tools"
          />
        </div>

        {/* Main Content */}
        <div className="bg-white rounded-lg shadow-lg p-8 mb-8">
          <h2 className="text-2xl font-bold text-gray-900 mb-6">Generate Hackathon Ideas</h2>
          <div className="space-y-4">
            <div className="flex gap-4">
              <input
                type="text"
                value={topic}
                onChange={(e) => setTopic(e.target.value)}
                placeholder="Enter a topic or theme..."
                className="flex-1 px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"
              />
              <button
                onClick={generateIdeas}
                disabled={loading}
                className="bg-indigo-600 text-white px-6 py-2 rounded-lg hover:bg-indigo-700 disabled:opacity-50 transition"
              >
                {loading ? 'Generating...' : 'Generate'}
              </button>
            </div>
          </div>

          {/* Ideas List */}
          {ideas.length > 0 && (
            <div className="mt-8">
              <h3 className="text-xl font-semibold text-gray-900 mb-4">Generated Ideas</h3>
              <div className="space-y-4">
                {ideas.map((idea: any) => (
                  <div
                    key={idea.id}
                    className="border border-gray-200 rounded-lg p-4 hover:border-indigo-500 transition"
                  >
                    <h4 className="font-semibold text-gray-900">{idea.title}</h4>
                    <p className="text-gray-600 text-sm mt-2">{idea.description}</p>
                  </div>
                ))}
              </div>
            </div>
          )}
        </div>

        {/* CTA Section */}
        <div className="bg-gradient-to-r from-indigo-600 to-blue-600 rounded-lg shadow-lg p-8 text-center text-white">
          <h2 className="text-2xl font-bold mb-4">Ready to start building?</h2>
          <p className="mb-6">Sign up now and get access to all AI copilot features</p>
          <button className="bg-white text-indigo-600 px-8 py-3 rounded-lg font-semibold hover:bg-gray-100 transition">
            Get Started
          </button>
        </div>
      </div>
    </main>
  );
}

function FeatureCard({
  icon,
  title,
  description,
}: {
  icon: string;
  title: string;
  description: string;
}) {
  return (
    <div className="bg-white rounded-lg shadow p-6 text-center hover:shadow-lg transition">
      <div className="text-3xl mb-3">{icon}</div>
      <h3 className="font-semibold text-gray-900 mb-2">{title}</h3>
      <p className="text-gray-600 text-sm">{description}</p>
    </div>
  );
}
