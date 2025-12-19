# Angular Starter Kit - Project Rename Script (Windows PowerShell)
# Usage: .\setup.ps1 <new-project-name>

param(
    [Parameter(Mandatory=$true, HelpMessage="Enter the new project name")]
    [string]$NewName
)

$OldName = "angular-starter-project"  # ⚠️ CHANGE THIS to your current project name in angular.json

Write-Host ""
Write-Host "╔════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║  Angular Project Rename Script        ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""
Write-Host "🔄 Renaming project from '$OldName' to '$NewName'" -ForegroundColor Yellow
Write-Host ""

# Function to safely replace text in file
function Update-FileContent {
    param(
        [string]$FilePath,
        [string]$OldValue,
        [string]$NewValue,
        [string]$Description
    )
    
    if (Test-Path $FilePath) {
        try {
            $content = Get-Content $FilePath -Raw
            $content = $content -replace [regex]::Escape($OldValue), $NewValue
            $content | Set-Content $FilePath -NoNewline
            Write-Host "✅ Updated $Description" -ForegroundColor Green
            return $true
        }
        catch {
            Write-Host "⚠️  Failed to update $Description : $_" -ForegroundColor Yellow
            return $false
        }
    }
    else {
        Write-Host "⚠️  $Description not found" -ForegroundColor Yellow
        return $false
    }
}

# Update package.json
Update-FileContent -FilePath "package.json" `
    -OldValue "`"name`": `"$OldName`"" `
    -NewValue "`"name`": `"$NewName`"" `
    -Description "package.json"

# Update package-lock.json
if (Test-Path "package-lock.json") {
    Update-FileContent -FilePath "package-lock.json" `
        -OldValue "`"name`": `"$OldName`"" `
        -NewValue "`"name`": `"$NewName`"" `
        -Description "package-lock.json"
}

# Update angular.json (replace all occurrences)
if (Test-Path "angular.json") {
    try {
        $content = Get-Content "angular.json" -Raw
        $content = $content -replace [regex]::Escape("`"$OldName`""), "`"$NewName`""
        $content | Set-Content "angular.json" -NoNewline
        Write-Host "✅ Updated angular.json" -ForegroundColor Green
    }
    catch {
        Write-Host "⚠️  Failed to update angular.json: $_" -ForegroundColor Yellow
    }
}

# Update index.html title
if (Test-Path "src/index.html") {
    try {
        $content = Get-Content "src/index.html" -Raw
        $content = $content -replace "<title>.*?</title>", "<title>$NewName</title>"
        $content | Set-Content "src/index.html" -NoNewline
        Write-Host "✅ Updated src/index.html" -ForegroundColor Green
    }
    catch {
        Write-Host "⚠️  Failed to update src/index.html: $_" -ForegroundColor Yellow
    }
}

# Update Dockerfile
Update-FileContent -FilePath "Dockerfile" `
    -OldValue "/app/dist/$OldName/browser" `
    -NewValue "/app/dist/$NewName/browser" `
    -Description "Dockerfile"

# Update README.md title
if (Test-Path "README.md") {
    try {
        $content = Get-Content "README.md" -Raw
        $content = $content -replace "# $OldName", "# $NewName"
        $content | Set-Content "README.md" -NoNewline
        Write-Host "✅ Updated README.md" -ForegroundColor Green
    }
    catch {
        Write-Host "⚠️  Failed to update README.md: $_" -ForegroundColor Yellow
    }
}

# Initialize git if not already initialized
if (-not (Test-Path ".git")) {
    Write-Host ""
    Write-Host "📦 Initializing git repository..." -ForegroundColor Yellow
    git init
    git add .
    git commit -m "Initial commit: $NewName project from angular-starter-kit"
    Write-Host "✅ Git repository initialized" -ForegroundColor Green
}

# Remove setup scripts (one-time use)
Write-Host ""
Write-Host "🗑️  Removing setup scripts..." -ForegroundColor Yellow
Remove-Item "setup.sh" -ErrorAction SilentlyContinue
Remove-Item "setup.ps1" -ErrorAction SilentlyContinue

Write-Host ""
Write-Host "╔════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║  ✨ Project Setup Complete!           ║" -ForegroundColor Green
Write-Host "╚════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""
Write-Host "Project renamed to: " -ForegroundColor Cyan -NoNewline
Write-Host "$NewName" -ForegroundColor Green
Write-Host ""
Write-Host "🚀 Next steps:" -ForegroundColor Cyan
Write-Host "   1. docker-compose up              " -ForegroundColor Yellow -NoNewline
Write-Host "# Start development server" -ForegroundColor Cyan
Write-Host "   2. Open http://localhost:4200     " -ForegroundColor Yellow -NoNewline
Write-Host "# View your app" -ForegroundColor Cyan
Write-Host "   3. Start coding! 🎉" -ForegroundColor Yellow
Write-Host ""