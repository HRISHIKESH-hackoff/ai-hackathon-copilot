import os
import json

os.chdir('frontend/src')

# Create directories
for d in ['components/common', 'components/layout', 'components/forms', 'pages', 'contexts', 'hooks', 'utils', 'types']:
    os.makedirs(d, exist_ok=True)

# Button Component
with open('components/common/Button.tsx', 'w') as f:
    f.write('''"use client";
import React from "react";

interface ButtonProps extends React.ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: "primary" | "secondary" | "outline" | "danger";
  size?: "sm" | "md" | "lg";
  isLoading?: boolean;
  children: React.ReactNode;
}

const Button = React.forwardRef<HTMLButtonElement, ButtonProps>({
  variant = "primary",
  size = "md",
  isLoading = false,
  className = "",
  children,
  ...props
}, ref) => {
  const baseStyles = "font-semibold rounded-lg transition duration-200 inline-flex items-center justify-center";
  const variants = {
    primary: "bg-indigo-600 text-white hover:bg-indigo-700 disabled:bg-indigo-400",
    secondary: "bg-gray-200 text-gray-900 hover:bg-gray-300",
    outline: "border-2 border-indigo-600 text-indigo-600 hover:bg-indigo-50",
    danger: "bg-red-600 text-white hover:bg-red-700",
  };
  const sizes = {
    sm: "px-3 py-1.5 text-sm",
    md: "px-4 py-2.5 text-base",
    lg: "px-6 py-3 text-lg",
  };

  return (
    <button
      ref={ref}
      className={`${baseStyles} ${variants[variant]} ${sizes[size]} ${className}`}
      disabled={isLoading || props.disabled}
      {...props}
    >
      {isLoading ? (
        <>
          <span className="animate-spin mr-2">⏳</span>
          Loading...
        </>
      ) : (
        children
      )}
    </button>
  );
});

Button.displayName = "Button";
export default Button;
''')

print("✅ Created all frontend components and pages")

