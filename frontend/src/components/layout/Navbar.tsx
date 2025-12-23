'use client';
import Link from 'next/link';
import { useState } from 'react';
import Button from '../common/Button';

const Navbar = () => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  return (
    <nav className="bg-white shadow-md">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex justify-between items-center h-16">
          <Link href="/" className="flex items-center space-x-2">
            <div className="w-8 h-8 bg-indigo-600 rounded-lg flex items-center justify-center">
              <span className="text-white font-bold">AI</span>
            </div>
            <span className="font-bold text-lg text-gray-900">HackCopilot</span>
          </Link>

          <div className="hidden md:flex space-x-8">
            <Link href="/ideas" className="text-gray-600 hover:text-gray-900">Ideas</Link>
            <Link href="/copilot" className="text-gray-600 hover:text-gray-900">Copilot</Link>
            <Link href="/teams" className="text-gray-600 hover:text-gray-900">Teams</Link>
            <Link href="/dashboard" className="text-gray-600 hover:text-gray-900">Dashboard</Link>
          </div>

          <div className="hidden md:flex space-x-4">
            <Button variant="outline" size="sm" onClick={() => {}}>
              Sign In
            </Button>
            <Button size="sm" onClick={() => {}}>
              Get Started
            </Button>
          </div>

          <button
            onClick={() => setIsMenuOpen(!isMenuOpen)}
            className="md:hidden"
          >
            <span className="text-2xl">☰</span>
          </button>
        </div>
      </div>
    </nav>
  );
};

export default Navbar;
