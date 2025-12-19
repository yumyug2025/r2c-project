# R2C Project GitHub Setup Script
# This script will help you set up your R2C project on GitHub

Write-Host "=== R2C Project GitHub Setup ===" -ForegroundColor Green
Write-Host ""

# Check if we're in the correct directory
$currentDir = Get-Location
Write-Host "Current directory: $currentDir"

if (-not (Test-Path "index.html")) {
    Write-Host "ERROR: index.html not found in current directory!" -ForegroundColor Red
    Write-Host "Please run this script from the R2C project directory." -ForegroundColor Yellow
    exit 1
}

Write-Host "✓ Found project files" -ForegroundColor Green

# Initialize git repository
Write-Host ""
Write-Host "Step 1: Initializing git repository..." -ForegroundColor Cyan
git init
if ($LASTEXITCODE -ne 0) {
    Write-Host "Warning: git init may have already been run" -ForegroundColor Yellow
}

# Add all files
Write-Host ""
Write-Host "Step 2: Adding files to git..." -ForegroundColor Cyan
git add .
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Files added successfully" -ForegroundColor Green
} else {
    Write-Host "✗ Error adding files" -ForegroundColor Red
    exit 1
}

# Make first commit
Write-Host ""
Write-Host "Step 3: Making initial commit..." -ForegroundColor Cyan
git commit -m "Initial commit: R2C website and feedback form"
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Initial commit created" -ForegroundColor Green
} else {
    Write-Host "✗ Error creating commit" -ForegroundColor Red
    exit 1
}

# Rename branch to main if needed
Write-Host ""
Write-Host "Step 4: Setting up main branch..." -ForegroundColor Cyan
git branch -M main
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Main branch set up" -ForegroundColor Green
} else {
    Write-Host "Warning: Could not rename branch, but continuing..." -ForegroundColor Yellow
}

# Add remote origin
Write-Host ""
Write-Host "Step 5: Setting up remote repository..." -ForegroundColor Cyan
Write-Host "IMPORTANT: Make sure you've created a repository named 'r2c-project' on GitHub first!" -ForegroundColor Yellow
Write-Host "If you haven't, please create it now at https://github.com/new" -ForegroundColor Yellow
Write-Host ""
Write-Host "Press Enter after you've created the repository..." -ForegroundColor Cyan
Read-Host

$remoteUrl = "https://github.com/yumyug2025/r2c-project.git"
git remote add origin $remoteUrl
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Remote repository added" -ForegroundColor Green
} else {
    Write-Host "Warning: Remote may already be set up" -ForegroundColor Yellow
}

# Push to GitHub
Write-Host ""
Write-Host "Step 6: Pushing to GitHub..." -ForegroundColor Cyan
Write-Host "You may be prompted for your GitHub username and password (use personal access token as password)" -ForegroundColor Yellow
Write-Host ""

git push -u origin main
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Successfully pushed to GitHub!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Your repository is now available at: https://github.com/yumyug2025/r2c-project" -ForegroundColor Blue
} else {
    Write-Host "✗ Error pushing to GitHub" -ForegroundColor Red
    Write-Host "You may need to create a personal access token at https://github.com/settings/tokens" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "=== Setup Complete ===" -ForegroundColor Green