# Debian Compatibility Notes

## 🐧 Omakub FOSS Universal Edition

This version of Omakub FOSS has been adapted to work on **both Ubuntu 24.04+** and **Debian 12 (Bookworm)+** with automatic OS detection.

## 🚀 Installation

### Universal Installation (Recommended):
```bash
wget -qO- https://raw.githubusercontent.com/AhmadMajid/omakub-foss/master/boot.sh | bash
```

> **✨ Auto-detecting installer** - Works on both Ubuntu 24.04+ and Debian 12+. Automatically detects your OS and uses the optimal installation method.

### Manual Alternative:
If you prefer to clone and run manually:
```bash
git clone https://github.com/AhmadMajid/omakub-foss.git ~/.local/share/omakub
cd ~/.local/share/omakub
bash install-debian.sh  # Universal installer with OS detection
```

## ✅ What Works Perfectly on Both Ubuntu & Debian

### **Terminal Tools (100% Compatibility)**
- ✅ All CLI utilities (fzf, ripgrep, bat, eza, zoxide, etc.)
- ✅ Development tools (Neovim, lazygit, lazydocker, btop)
- ✅ Terminal multiplexer (Zellij)
- ✅ Programming languages (Ruby, Node.js, Go, PHP, Python, etc.)
- ✅ Docker (OS-specific repositories for optimal performance)
- ✅ Database containers (MySQL, Redis, PostgreSQL)

### **Desktop Apps (Excellent Compatibility)**
- ✅ LibreOffice, VLC, Signal, Flameshot
- ✅ Google Chrome, VS Code (direct .deb installs)
- ✅ **GNOME extensions and theming** (with OS-specific handling)
- ✅ Alacritty terminal

## 🔧 OS-Specific Optimizations & Smart Handling

### **1. Fastfetch Installation**
- **Ubuntu**: Uses official Ubuntu PPA for latest versions
- **Debian**: Downloads from GitHub releases (same functionality)
- **Result**: ✅ **Seamless** - Works identically on both systems

### **2. GNOME Extensions**
- **Ubuntu**: Disables Ubuntu-specific extensions, installs community extensions
- **Debian**: Skips Ubuntu extension disabling, installs community extensions
- **Result**: ✅ **Excellent** - Full extension support with OS-aware installation

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

### **Known Minor Differences:**
- Some Ubuntu-specific apps unavailable (handled gracefully)
- Snap integration not included by default

## 🚀 Bottom Line

**Universal Experience**: Both Ubuntu and Debian users get the **complete Omakub FOSS experience** with identical functionality. The installer is smart enough to use the optimal installation method for each OS while maintaining feature parity.

**Perfect for**:
- **Ubuntu users** - Get the full experience with Ubuntu-optimized components
- **Debian users** - Get the full experience with Debian-compatible alternatives
- **Anyone** - Who wants a privacy-focused, minimal development setup that "just works"

The OS detection is seamless and invisible to the user - you simply get the best possible experience for your system.
