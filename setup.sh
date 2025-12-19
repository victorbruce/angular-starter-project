#!/bin/bash

# Angular Starter Kit - Project Rename Script
# Usage: ./setup.sh <new-project-name>

# Color codes for pretty output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Check if project name is provided
if [ -z "$1" ]; then
  echo -e "${RED}❌ Error: Please provide a project name${NC}"
  echo -e "${CYAN}Usage: ./setup.sh <project-name>${NC}"
  echo -e "${CYAN}Example: ./setup.sh financial-dashboard${NC}"
  exit 1
fi

NEW_NAME=$1
OLD_NAME="angular-starter-project"  # ⚠️ CHANGE THIS to your current project name in angular.json

echo ""
echo -e "${CYAN}╔════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║  Angular Project Rename Script        ║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════╝${NC}"
echo ""
echo -e "${YELLOW}🔄 Renaming project from '$OLD_NAME' to '$NEW_NAME'${NC}"
echo ""

# Function to perform case-insensitive replacement on macOS/Linux
safe_replace() {
  local file=$1
  local old=$2
  local new=$3
  
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    sed -i '' "s/$old/$new/g" "$file"
  else
    # Linux
    sed -i "s/$old/$new/g" "$file"
  fi
}

# Update package.json
if [ -f package.json ]; then
  safe_replace package.json "\"name\": \"$OLD_NAME\"" "\"name\": \"$NEW_NAME\""
  echo -e "${GREEN}✅ Updated package.json${NC}"
else
  echo -e "${YELLOW}⚠️  package.json not found${NC}"
fi

# Update package-lock.json
if [ -f package-lock.json ]; then
  safe_replace package-lock.json "\"name\": \"$OLD_NAME\"" "\"name\": \"$NEW_NAME\""
  echo -e "${GREEN}✅ Updated package-lock.json${NC}"
fi

# Update angular.json
if [ -f angular.json ]; then
  safe_replace angular.json "\"$OLD_NAME\"" "\"$NEW_NAME\""
  echo -e "${GREEN}✅ Updated angular.json${NC}"
else
  echo -e "${YELLOW}⚠️  angular.json not found${NC}"
fi

# Update index.html title
if [ -f src/index.html ]; then
  safe_replace src/index.html "<title>.*</title>" "<title>$NEW_NAME</title>"
  echo -e "${GREEN}✅ Updated src/index.html${NC}"
else
  echo -e "${YELLOW}⚠️  src/index.html not found${NC}"
fi

# Update Dockerfile
if [ -f Dockerfile ]; then
  safe_replace Dockerfile "/app/dist/$OLD_NAME/browser" "/app/dist/$NEW_NAME/browser"
  echo -e "${GREEN}✅ Updated Dockerfile${NC}"
else
  echo -e "${YELLOW}⚠️  Dockerfile not found${NC}"
fi

# Update README.md title
if [ -f README.md ]; then
  safe_replace README.md "# $OLD_NAME" "# $NEW_NAME"
  echo -e "${GREEN}✅ Updated README.md${NC}"
fi

# Initialize git if not already initialized
if [ ! -d .git ]; then
  echo ""
  echo -e "${YELLOW}📦 Initializing git repository...${NC}"
  git init
  git add .
  git commit -m "Initial commit: $NEW_NAME project from angular-starter-kit"
  echo -e "${GREEN}✅ Git repository initialized${NC}"
fi

# Remove setup scripts (one-time use)
echo ""
echo -e "${YELLOW}🗑️  Removing setup scripts...${NC}"
rm -f setup.sh setup.ps1

echo ""
echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║  ✨ Project Setup Complete!           ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
echo ""
echo -e "${CYAN}Project renamed to: ${GREEN}$NEW_NAME${NC}"
echo ""
echo -e "${CYAN}🚀 Next steps:${NC}"
echo -e "   ${YELLOW}1.${NC} docker-compose up              ${CYAN}# Start development server${NC}"
echo -e "   ${YELLOW}2.${NC} Open http://localhost:4200     ${CYAN}# View your app${NC}"
echo -e "   ${YELLOW}3.${NC} Start coding! 🎉"
echo ""