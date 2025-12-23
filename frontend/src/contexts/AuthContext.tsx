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
