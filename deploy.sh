#!/bin/bash

# Deploy script for pushing dist folder to gh-pages branch
# Run this script after building your project

echo "Building project..."
npm run build

if [ $? -ne 0 ]; then
    echo "Build failed!"
    exit 1
fi

echo "Switching to gh-pages branch..."

# Stash any uncommitted changes on main
git stash

# Create and switch to gh-pages branch (or switch if it exists)
git checkout gh-pages 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Creating new gh-pages branch..."
    git checkout --orphan gh-pages
    git rm -rf .
else
    echo "Switched to existing gh-pages branch"
    # Clear the branch except .git
    git rm -rf . 2>/dev/null || true
fi

echo "Copying dist files..."
# Copy dist contents to root
cp -r dist/* .

echo "Committing changes..."
git add .
git commit -m "Deploy: $(date)"

echo "Pushing to origin/gh-pages..."
git push origin gh-pages

echo "Switching back to main branch..."
git checkout main

# Restore stashed changes if any
git stash pop 2>/dev/null || true

echo "Deployment complete!"
echo "Your site should be available at: https://yourusername.github.io/portfolio"
