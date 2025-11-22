#!/usr/bin/env bash
# ============================================================================
# ly Display Manager Configuration Script
# ============================================================================
# Description: Configure ly with Tokyo Night Dark theme and Matrix animation
# Author: Yeshua (generated with Claude Code)
# ============================================================================

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}Configuring ly Display Manager${NC}"
echo -e "${BLUE}========================================${NC}\n"

# Backup original config
if [ ! -f /etc/ly/config.ini.backup ]; then
    echo -e "${YELLOW}Creating backup of original config...${NC}"
    sudo cp /etc/ly/config.ini /etc/ly/config.ini.backup
    echo -e "${GREEN}✓ Backup created at /etc/ly/config.ini.backup${NC}\n"
fi

# Configure ly with Tokyo Night Dark + Matrix animation
echo -e "${YELLOW}Applying Tokyo Night Dark theme with Matrix animation...${NC}"

# Change animation to matrix
sudo sed -i 's/animation = colormix/animation = matrix/' /etc/ly/config.ini

# Update matrix colors to Tokyo Night cyan/blue
sudo sed -i 's/cmatrix_fg = 0x009ece6a/cmatrix_fg = 0x007dcfff/' /etc/ly/config.ini

# Optional: Make background completely black for better contrast
# sudo sed -i 's/bg = 0x001a1b26/bg = 0x00000000/' /etc/ly/config.ini

echo -e "${GREEN}✓ ly configured successfully!${NC}\n"

echo -e "${BLUE}Current configuration:${NC}"
grep -E "(animation =|bg =|fg =|border_fg =|cmatrix_fg =)" /etc/ly/config.ini

echo -e "\n${YELLOW}Note: Logout to see the new ly configuration${NC}"
echo -e "${YELLOW}If you want a pure black background instead of dark blue,${NC}"
echo -e "${YELLOW}uncomment the last sed command in this script.${NC}\n"
