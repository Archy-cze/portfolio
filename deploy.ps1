# Deploy script for pushing dist folder to gh-pages branch
# Run this script after building your project

Write-Host "Building project..." -ForegroundColor Green
npm run build

if ($LASTEXITCODE -ne 0) {
    Write-Host "Build failed!" -ForegroundColor Red
    exit 1
}

Write-Host "Switching to gh-pages branch..." -ForegroundColor Green

# Create and switch to gh-pages branch (or switch if it exists)
git checkout gh-pages 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "Creating new gh-pages branch..." -ForegroundColor Yellow
    git checkout --orphan gh-pages
    git rm -rf .
} else {
    Write-Host "Switched to existing gh-pages branch" -ForegroundColor Yellow
    # Clear the branch except .git
    git rm -rf . 2>$null
}

Write-Host "Copying dist files..." -ForegroundColor Green
# Copy dist contents to root
Copy-Item -Path "dist\*" -Destination "." -Recurse -Force

Write-Host "Committing changes..." -ForegroundColor Green
git add .
git commit -m "Deploy: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"

Write-Host "Pushing to origin/gh-pages..." -ForegroundColor Green
git push origin gh-pages

Write-Host "Switching back to main branch..." -ForegroundColor Green
git checkout main

Write-Host "Deployment complete!" -ForegroundColor Green
Write-Host "Your site should be available at: https://yourusername.github.io/portfolio" -ForegroundColor Cyan
