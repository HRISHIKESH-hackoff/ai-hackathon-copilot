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
