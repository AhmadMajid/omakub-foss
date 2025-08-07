# Omakub FOSS 🐧

A FOSS-focused variant of [Omakub](https://github.com/basecamp/omakub) with minimal defaults and no subscription apps.

**Now supports both Ubuntu 24.04+ and Debian 12+ with automatic OS detection!**

## 🚀 Quick Install

### Make sure you have git installed first:
```bash
sudo apt update && sudo apt install -y git
```

### One-Line Install (Auto-detects Ubuntu/Debian):
```bash
wget -qO- https://raw.githubusercontent.com/AhmadMajid/omakub-foss/master/boot.sh | bash
```

> **✨ Smart installer** - Automatically detects your OS (Ubuntu 24.04+ or Debian 12+) and uses the optimal installation method for your system.

### What You Get:
- **Ubuntu users**: Full Omakub FOSS experience with Ubuntu-optimized components
- **Debian users**: Complete Omakub FOSS experience with Debian-compatible alternatives
- **Both**: Same privacy-focused, minimal defaults with no subscription apps

> **Debian users**: See [DEBIAN-COMPATIBILITY.md](DEBIAN-COMPATIBILITY.md) for detailed compatibility information.

## ✨ Key Differences from Upstream Omakub

### 🔐 Privacy & Freedom First
- **No forced proprietary software** - All subscription and closed-source apps are optional
- **No default selections** - You choose exactly what gets installed
- **Minimal by default** - Clean installation without bloat

### 📱 Apps Made Optional
The following apps are now **optional** instead of being forced or pre-selected:

#### Moved to Optional (not pre-selected):
- **1Password** - Password manager (subscription)
- **Spotify** - Music streaming (freemium/subscription)
- **Zoom** - Video conferencing (freemium)
- **Typora** - Markdown editor (paid)
- **Basecamp** - Project management (subscription)
- **HEY** - Email service (subscription)

#### Still Available as Optional:
- Dropbox, Cursor, Windsurf, RubyMine, Minecraft, Steam, and more

### 🛠️ What You Still Get by Default

**Core Development Tools** (all open-source):
- Terminal: Alacritty, Zellij, btop, fastfetch
- Development: Neovim, Git tools (lazygit), Docker, mise
- CLI utilities: fzf, ripgrep, bat, eza, zoxide
- Programming languages: Your choice (Ruby, Node.js, Go, PHP, Python, etc.)
- Databases: Your choice (MySQL, Redis, PostgreSQL in Docker)

**Desktop Apps** (open-source):
- LibreOffice, VLC, Signal, Flameshot, Pinta
- GNOME tweaks and extensions

## 🎯 Perfect For

- **Privacy-conscious users** who want control over proprietary software
- **Developers** who prefer minimal, open-source setups
- **Users** who don't want subscription services forced on them
- **Anyone** who wants the core Omakub experience without the commercial apps

## 🔧 Customization

All original Omakub apps are still available! During installation, you'll be prompted to select optional applications. Simply choose what you want - nothing is pre-selected.

## 📖 Original Omakub

This fork maintains full compatibility with the original [Omakub](https://github.com/basecamp/omakub) while respecting user choice about proprietary software. All credit for the excellent Ubuntu setup framework goes to the Basecamp team.

## 🤝 Contributing

Improvements welcome! This fork focuses on:
- Maintaining privacy and user choice
- Keeping installations minimal by default
- Adding more open-source alternatives
- Improving the optional app selection system
- **Expanding Debian/Ubuntu compatibility**

## 🐧 OS Support

- ✅ **Ubuntu 24.04+** - Full compatibility
- ✅ **Debian 12+** - High compatibility (see [DEBIAN-COMPATIBILITY.md](DEBIAN-COMPATIBILITY.md))

## License

Omakub FOSS is released under the [MIT License](https://opensource.org/licenses/MIT).
