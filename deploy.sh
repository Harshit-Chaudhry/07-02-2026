#!/bin/bash

# Rose Day Website - Quick Deploy Script
# Makes deployment super easy!

echo "╔════════════════════════════════════════════╗"
echo "║   🌹 Rose Day Website Deploy 💜           ║"
echo "╚════════════════════════════════════════════╝"
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Check if aria_math.mp3 exists
echo -e "${PURPLE}[1/3]${NC} Checking for Aria Math..."

if [ ! -f "aria_math.mp3" ]; then
    echo -e "${YELLOW}⚠️  aria_math.mp3 not found!${NC}"
    echo ""
    echo "Do you want to download it now? (y/n)"
    read -r response
    
    if [[ "$response" =~ ^[Yy]$ ]]; then
        echo -e "${PURPLE}Downloading Aria Math...${NC}"
        wget -q --show-progress https://archive.org/download/MinecraftVolumeBeta/Minecraft%20-%20Volume%20Beta%20-%2010%20Aria%20Math.mp3 -O aria_math.mp3
        
        if [ -f "aria_math.mp3" ]; then
            echo -e "${GREEN}✓ Downloaded successfully!${NC}"
        else
            echo -e "${RED}✗ Download failed. Please download manually.${NC}"
            echo "Visit: https://ytmp3.nu/ and search 'Minecraft Aria Math'"
            exit 1
        fi
    else
        echo -e "${RED}Please add aria_math.mp3 to this folder before deploying!${NC}"
        
    fi
else
    echo -e "${GREEN}✓ aria_math.mp3 found!${NC}"
fi
echo ""

# Check if Vercel CLI is installed
echo -e "${PURPLE}[2/3]${NC} Checking Vercel CLI..."

if ! command -v vercel &> /dev/null; then
    echo -e "${YELLOW}⚠️  Vercel CLI not installed${NC}"
    echo ""
    echo "Install Vercel CLI? (y/n)"
    read -r response
    
    if [[ "$response" =~ ^[Yy]$ ]]; then
        echo -e "${PURPLE}Installing Vercel CLI...${NC}"
        npm install -g vercel
        
        if command -v vercel &> /dev/null; then
            echo -e "${GREEN}✓ Vercel CLI installed!${NC}"
        else
            echo -e "${RED}✗ Installation failed${NC}"
            echo ""
            echo -e "${YELLOW}Alternative: Deploy via Vercel website${NC}"
            echo "1. Go to https://vercel.com"
            echo "2. Sign up (free)"
            echo "3. Drag this folder to deploy"
            exit 1
        fi
    else
        echo -e "${YELLOW}No problem! Deploy via website instead:${NC}"
        echo "1. Go to https://vercel.com"
        echo "2. Sign up (free)"
        echo "3. Drag this folder to deploy"
        exit 0
    fi
else
    echo -e "${GREEN}✓ Vercel CLI ready!${NC}"
fi
echo ""

# Deploy
echo -e "${PURPLE}[3/3]${NC} Deploying to Vercel..."
echo ""

# Check if already logged in
if ! vercel whoami &> /dev/null; then
    echo "Please login to Vercel:"
    vercel login
fi

echo ""
echo "Deploying your Rose Day website..."
echo ""

# Deploy
vercel --prod

echo ""
echo "╔════════════════════════════════════════════╗"
echo "║           🎉 DEPLOYMENT COMPLETE! 🎉      ║"
echo "╚════════════════════════════════════════════╝"
echo ""
echo -e "${GREEN}Your website is LIVE! 🚀${NC}"
echo ""
echo -e "${PURPLE}Next Steps:${NC}"
echo "1. Copy the deployment URL (shown above)"
echo "2. Test it in your browser"
echo "3. Send it to her!"
echo ""
echo -e "${YELLOW}Message template:${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Hey! Happy Rose Day! 🌹💜"
echo ""
echo "I made something special for you:"
echo "[paste your Vercel link here]"
echo ""
echo "Turn your sound on and click 'Begin'! 🎵"
echo "I coded this myself - hope you love it! 😊"
echo ""
echo "Happy Rose Day! 💜"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo -e "${GREEN}🌹 Good luck! She's going to love it! 💜${NC}"
echo ""
