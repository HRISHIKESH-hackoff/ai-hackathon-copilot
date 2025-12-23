#!/bin/bash

cd frontend

# Create Teams Page
cat > src/app/teams/page.tsx << 'EOF'
'use client';
import Card from '@/src/components/common/Card';
import Button from '@/src/components/common/Button';

const TeamsPage = () => (
  <div className="min-h-screen bg-gray-50 py-12 px-4">
    <div className="max-w-7xl mx-auto">
      <div className="flex justify-between items-center mb-8">
        <h1 className="text-4xl font-bold text-gray-900">My Teams</h1>
        <Button>Create Team</Button>
      </div>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        {[1, 2, 3].map((i) => (
          <Card key={i} title={`Team ${i}`}>
            <p className="text-gray-600 mb-4">Team members: 5</p>
            <Button variant="outline" className="w-full">View Team</Button>
          </Card>
        ))}
      </div>
    </div>
  </div>
);
export default TeamsPage;
EOF

echo "✅ Created Teams Page"

# Create Auth Context
cat > src/contexts/AuthContext.tsx << 'EOF'
'use client';
import { createContext, useContext, useState } from 'react';

interface User {
  id: string;
  name: string;
  email: string;
}

const AuthContext = createContext<{
  user: User | null;
  login: (email: string, password: string) => void;
  logout: () => void;
}>({ user: null, login: () => {}, logout: () => {} });

export const AuthProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  const [user, setUser] = useState<User | null>(null);

  const login = (email: string, password: string) => {
    setUser({ id: '1', name: 'User', email });
  };

  const logout = () => setUser(null);

  return (
    <AuthContext.Provider value={{ user, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => useContext(AuthContext);
EOF

echo "✅ Created Auth Context"

# Create API utils
cat > src/utils/api.ts << 'EOF'
const API_URL = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:5000';

export const api = {
  async get(endpoint: string) {
    const res = await fetch(`${API_URL}${endpoint}`);
    if (!res.ok) throw new Error('API request failed');
    return res.json();
  },

  async post(endpoint: string, data: any) {
    const res = await fetch(`${API_URL}${endpoint}`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(data),
    });
    if (!res.ok) throw new Error('API request failed');
    return res.json();
  },

  async put(endpoint: string, data: any) {
    const res = await fetch(`${API_URL}${endpoint}`, {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(data),
    });
    if (!res.ok) throw new Error('API request failed');
    return res.json();
  },

  async delete(endpoint: string) {
    const res = await fetch(`${API_URL}${endpoint}`, { method: 'DELETE' });
    if (!res.ok) throw new Error('API request failed');
    return res.json();
  },
};
EOF

echo "✅ Created API Utils"

# Create 404 Page
cat > src/app/not-found.tsx << 'EOF'
'use client';
import Link from 'next/link';
import Button from '@/src/components/common/Button';

const NotFound = () => (
  <div className="min-h-screen bg-gray-50 flex items-center justify-center px-4">
    <div className="text-center">
      <h1 className="text-6xl font-bold text-gray-900 mb-4">404</h1>
      <p className="text-2xl text-gray-600 mb-8">Page Not Found</p>
      <p className="text-gray-600 mb-8">The page you're looking for doesn't exist.</p>
      <Link href="/">
        <Button>Go Home</Button>
      </Link>
    </div>
  </div>
);
export default NotFound;
EOF

echo "✅ Created 404 Page"

# Create index/barrel exports for components
cat > src/components/common/index.ts << 'EOF'
export { default as Button } from './Button';
export { default as Input } from './Input';
export { default as Card } from './Card';
export { default as Modal } from './Modal';
EOF

echo "✅ Created Component Exports"

echo "\n✨ All final pages and utilities created!"

