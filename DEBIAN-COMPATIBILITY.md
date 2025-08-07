# Debian Compatibility Notes

## 🐧 Omakub FOSS Debian Edition

This version of Omakub FOSS has been adapted to work on **Debian 12 (Bookworm)** and newer versions, in addition to Ubuntu 24.04+.

## 🚀 Installation

### Debian 12+ Installation:
```bash
wget -qO- https://raw.githubusercontent.com/AhmadMajid/omakub-foss/main/boot-debian.sh | bash
```

### Ubuntu 24.04+ Installation (original):
```bash
wget -qO- https://raw.githubusercontent.com/AhmadMajid/omakub-foss/main/install | bash
```

## ✅ What Works on Debian

### **Terminal Tools (Full Compatibility)**
- ✅ All CLI utilities (fzf, ripgrep, bat, eza, zoxide, etc.)
- ✅ Development tools (Neovim, lazygit, lazydocker, btop)
- ✅ Terminal multiplexer (Zellij)
- ✅ Programming languages (Ruby, Node.js, Go, PHP, Python, etc.)
- ✅ Docker (uses Debian Docker repository)
- ✅ Database containers (MySQL, Redis, PostgreSQL)

### **Desktop Apps (High Compatibility)**
- ✅ LibreOffice, VLC, Signal, Flameshot
- ✅ Google Chrome, VS Code (direct .deb installs)
- ✅ **GNOME extensions and theming** (with OS-specific handling)
- ✅ Alacritty terminal

## ⚠️ Debian Limitations & Workarounds

### **1. Fastfetch Installation**
- **Issue**: Ubuntu PPA not available for Debian
- **Solution**: Automatically downloads from GitHub releases
- **Status**: ✅ **Fixed** - Works seamlessly

### **2. GNOME Extensions**
- **Issue**: Ubuntu-specific extension disabling may fail
- **Solution**: Safely skip Ubuntu extension disabling on Debian, install community extensions
- **Status**: ✅ **Fixed** - Full extension support with OS detection

### **3. App Grid Organization**
- **Issue**: Ubuntu-specific apps referenced
- **Solution**: Cleaned up app folder references for Debian
- **Status**: ✅ **Fixed** - Debian-appropriate app organization

### **4. Package Differences**
- **Issue**: Some packages have different names
- **Solution**: OS detection and appropriate package selection
- **Status**: ✅ **Handled** - Automatic detection

## ❌ What Doesn't Work on Debian

### **Ubuntu-Specific Features Handled:**
- ✅ **Ubuntu extension disabling** - Safely skipped on Debian
- ❌ **Snap Store integration** - Debian doesn't include Snap by default
- ❌ **Update Manager references** - Different in Debian
- ❌ **Ubuntu PPAs** - Replaced with direct downloads where possible

### **Packages Not Available:**
- ❌ **software-properties-drivers** - Ubuntu-specific
- ❌ **firmware-updater** - Ubuntu-specific
- ❌ **gnome-language-selector** - Ubuntu-specific

## 🔧 Technical Implementation

### **OS Detection Logic:**
```bash
. /etc/os-release
if [ "$ID" = "debian" ]; then
  # Use Debian-specific scripts
elif [ "$ID" = "ubuntu" ]; then
  # Use original Ubuntu scripts
fi
```

### **Debian-Specific Scripts Created:**
- `install-debian.sh` - Main installer with OS detection
- `install/check-version-debian.sh` - Supports Debian 12+
- `install/terminal/app-fastfetch-debian.sh` - GitHub releases
- `install/terminal/docker-debian.sh` - Debian Docker repo
- `install/desktop/set-app-grid-debian.sh` - Clean app organization
- `install/desktop/set-gnome-extensions-debian.sh` - OS-aware extension handling
- `install/terminal-debian.sh` - Terminal tools with OS detection
- `install/desktop-debian.sh` - Desktop tools with OS detection

## 🎯 Debian vs Ubuntu Experience

| Feature | Ubuntu | Debian | Notes |
|---------|--------|--------|-------|
| Terminal Tools | ✅ Full | ✅ Full | Identical experience |
| Development Setup | ✅ Full | ✅ Full | All languages work |
| Docker | ✅ Full | ✅ Full | Uses Debian repo |
| Desktop Apps | ✅ Full | ✅ Full | Core apps work |
| GNOME Extensions | ✅ Full | ✅ Full | OS-aware installation |
| GNOME Customization | ✅ Full | ✅ Full | Complete theming |
| Proprietary Apps | ✅ Optional | ✅ Optional | Same privacy focus |

## 📋 Compatibility Summary

### **High Confidence (95%+ compatibility):**
- All terminal/CLI tools
- Development environments
- Docker and containers
- Core desktop applications
- **GNOME extensions and theming**

### **Medium Confidence (90%+ compatibility):**
- Advanced GNOME customizations
- Some third-party applications

### **Known Issues:**
- Some Ubuntu-specific apps unavailable (handled gracefully)
- Snap integration not included by default## 🚀 Recommendation

**For Debian users**: Both the **terminal and desktop experiences are excellent** and nearly identical to Ubuntu. You get the full Omakub FOSS experience with proper GNOME extensions, theming, and customization.

**Best for**: Any developer or desktop user who wants the complete Omakub FOSS experience on Debian stable.
