#!/bin/bash

cd frontend

# Create Card Component
cat > src/components/common/Card.tsx << 'EOF'
'use client';
import React from 'react';

interface CardProps extends React.HTMLAttributes<HTMLDivElement> {
  title?: string;
  subtitle?: string;
  children: React.ReactNode;
  className?: string;
}

const Card: React.FC<CardProps> = ({ title, subtitle, children, className = '', ...props }) => (
  <div className={`bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition ${className}`} {...props}>
    {title && <h3 className="text-xl font-bold text-gray-900 mb-2">{title}</h3>}
    {subtitle && <p className="text-gray-600 text-sm mb-4">{subtitle}</p>}
    {children}
  </div>
);

export default Card;
EOF

echo "✅ Created Card Component"

# Create Modal Component
cat > src/components/common/Modal.tsx << 'EOF'
'use client';
import React from 'react';
import Button from './Button';

interface ModalProps {
  isOpen: boolean;
  title: string;
  children: React.ReactNode;
  onClose: () => void;
  onConfirm?: () => void;
  confirmText?: string;
}

const Modal: React.FC<ModalProps> = ({
  isOpen,
  title,
  children,
  onClose,
  onConfirm,
  confirmText = 'Confirm',
}) => {
  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
      <div className="bg-white rounded-lg p-6 max-w-md w-full">
        <div className="flex justify-between items-center mb-4">
          <h2 className="text-2xl font-bold text-gray-900">{title}</h2>
          <button onClick={onClose} className="text-2xl text-gray-600 hover:text-gray-900">&times;</button>
        </div>
        {children}
        <div className="flex justify-end gap-4 mt-6">
          <Button variant="secondary" onClick={onClose}>Cancel</Button>
          {onConfirm && <Button onClick={onConfirm}>{confirmText}</Button>}
        </div>
      </div>
    </div>
  );
};

export default Modal;
EOF

echo "✅ Created Modal Component"

# Create Dashboard Page
cat > src/app/dashboard/page.tsx << 'EOF'
'use client';
import { useState, useEffect } from 'react';
import Card from '@/src/components/common/Card';
import Button from '@/src/components/common/Button';

const Dashboard = () => {
  const [stats, setStats] = useState({
    ideas: 0,
    teams: 0,
    projects: 0,
    followers: 0,
  });

  useEffect(() => {
    setStats({ ideas: 24, teams: 3, projects: 5, followers: 128 });
  }, []);

  return (
    <div className="min-h-screen bg-gray-50 py-12 px-4">
      <div className="max-w-7xl mx-auto">
        <h1 className="text-4xl font-bold text-gray-900 mb-8">Dashboard</h1>

        <div className="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
          <Card>
            <div className="text-center">
              <p className="text-4xl font-bold text-indigo-600">{stats.ideas}</p>
              <p className="text-gray-600 text-sm mt-2">Total Ideas</p>
            </div>
          </Card>
          <Card>
            <div className="text-center">
              <p className="text-4xl font-bold text-indigo-600">{stats.teams}</p>
              <p className="text-gray-600 text-sm mt-2">Active Teams</p>
            </div>
          </Card>
          <Card>
            <div className="text-center">
              <p className="text-4xl font-bold text-indigo-600">{stats.projects}</p>
              <p className="text-gray-600 text-sm mt-2">Projects</p>
            </div>
          </Card>
          <Card>
            <div className="text-center">
              <p className="text-4xl font-bold text-indigo-600">{stats.followers}</p>
              <p className="text-gray-600 text-sm mt-2">Followers</p>
            </div>
          </Card>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
          <Card className="lg:col-span-2" title="Recent Activity">
            <div className="space-y-4">
              <p className="text-gray-600">Your recent activity will appear here</p>
            </div>
          </Card>
          <Card title="Quick Links">
            <div className="space-y-2">
              <Button className="w-full" variant="outline">Generate Ideas</Button>
              <Button className="w-full" variant="outline">Ask Copilot</Button>
              <Button className="w-full" variant="outline">View Teams</Button>
            </div>
          </Card>
        </div>
      </div>
    </div>
  );
};

export default Dashboard;
EOF

echo "✅ Created Dashboard Page"

# Create Ideas Page
cat > src/app/ideas/page.tsx << 'EOF'
'use client';
import { useState } from 'react';
import Card from '@/src/components/common/Card';
import Button from '@/src/components/common/Button';
import Input from '@/src/components/common/Input';

const IdeasPage = () => {
  const [ideas, setIdeas] = useState([
    { id: 1, title: 'AI-Powered Scheduling App', description: 'Smart calendar app using ML', category: 'AI' },
    { id: 2, title: 'Health Tracker', description: 'Track your wellness journey', category: 'Health' },
    { id: 3, title: 'Community Platform', description: 'Connect with local communities', category: 'Social' },
  ]);
  const [search, setSearch] = useState('');

  const filtered = ideas.filter(idea => 
    idea.title.toLowerCase().includes(search.toLowerCase()) ||
    idea.description.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <div className="min-h-screen bg-gray-50 py-12 px-4">
      <div className="max-w-7xl mx-auto">
        <div className="flex justify-between items-center mb-8">
          <h1 className="text-4xl font-bold text-gray-900">Hackathon Ideas</h1>
          <Button>Generate New Idea</Button>
        </div>

        <Card className="mb-8">
          <Input
            placeholder="Search ideas..."
            value={search}
            onChange={(e) => setSearch(e.target.value)}
          />
        </Card>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {filtered.map((idea) => (
            <Card key={idea.id} title={idea.title}>
              <p className="text-gray-600 mb-4">{idea.description}</p>
              <div className="flex justify-between items-center">
                <span className="bg-indigo-100 text-indigo-800 px-3 py-1 rounded-full text-sm">
                  {idea.category}
                </span>
                <Button size="sm">View Details</Button>
              </div>
            </Card>
          ))}
        </div>
      </div>
    </div>
  );
};

export default IdeasPage;
EOF

echo "✅ Created Ideas Page"

# Create Copilot Page
cat > src/app/copilot/page.tsx << 'EOF'
'use client';
import { useState } from 'react';
import Card from '@/src/components/common/Card';
import Button from '@/src/components/common/Button';
import Input from '@/src/components/common/Input';

const CopilotPage = () => {
  const [query, setQuery] = useState('');
  const [response, setResponse] = useState('');
  const [loading, setLoading] = useState(false);

  const handleQuery = async () => {
    setLoading(true);
    // Simulate API call
    setTimeout(() => {
      setResponse('AI Copilot response for: ' + query);
      setLoading(false);
    }, 1000);
  };

  return (
    <div className="min-h-screen bg-gray-50 py-12 px-4">
      <div className="max-w-4xl mx-auto">
        <h1 className="text-4xl font-bold text-gray-900 mb-8">AI Copilot</h1>

        <Card className="mb-8">
          <h2 className="text-2xl font-bold text-gray-900 mb-4">Ask the Copilot</h2>
          <div className="space-y-4">
            <Input
              placeholder="What would you like help with?"
              value={query}
              onChange={(e) => setQuery(e.target.value)}
            />
            <div className="flex gap-4">
              <Button isLoading={loading} onClick={handleQuery}>Get Help</Button>
              <Button variant="outline">Clear</Button>
            </div>
          </div>
        </Card>

        {response && (
          <Card>
            <h3 className="text-xl font-bold text-gray-900 mb-4">Response</h3>
            <p className="text-gray-600">{response}</p>
          </Card>
        )}

        <Card className="mt-8" title="Popular Questions">
          <ul className="space-y-2">
            <li className="text-indigo-600 cursor-pointer hover:underline">How to structure my hackathon project?</li>
            <li className="text-indigo-600 cursor-pointer hover:underline">What tech stack should I use?</li>
            <li className="text-indigo-600 cursor-pointer hover:underline">How to debug my code?</li>
          </ul>
        </Card>
      </div>
    </div>
  );
};

export default CopilotPage;
EOF

echo "✅ Created Copilot Page"

echo "\n✨ All pages and features created successfully!"

