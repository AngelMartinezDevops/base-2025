# 🐳 Base Docker Image - Ubuntu 22.04 + Node.js 20 + SteamCMD

> 🌍 [Versión en español disponible](README.md)

Modern base image for game servers, specifically optimized for Rust Server.

## 📦 Included Components

### Operating System
- **Ubuntu 22.04 LTS** - Support until 2027, SteamCMD compatible

### Runtime and Tools
- **Node.js 20 LTS** - Latest long-term support version
- **npm** - Updated package manager
- **Python 3** - With python3-dev and build-essential
- **Git, curl, wget** - Essential tools

### Gaming
- **SteamCMD** - Steam command-line client
- **32-bit Libraries** - lib32gcc-s1, libstdc++6:i386, libsdl2-2.0-0:i386

### Web Server
- **Nginx** - Web server for WebRCON
- **expect, tcl** - For automation

## 🏷️ Available Tags

```bash
# Tag with specific versions
docker pull b3lerofonte/base:nodejs-20-steamcmd-ubuntu-22.04

# Latest tag (points to Ubuntu 22.04)
docker pull b3lerofonte/base:latest
```

## 🚀 Usage

### As Base Image for Your Dockerfile

```dockerfile
FROM b3lerofonte/base:nodejs-20-steamcmd-ubuntu-22.04

# Your configuration here
COPY my-app /app/
WORKDIR /app
RUN npm install

CMD ["node", "server.js"]
```

### Local Build

```bash
git clone https://github.com/AngelMartinezDevops/base-2025.git
cd base-2025
docker build -t b3lerofonte/base:nodejs-20-steamcmd-ubuntu-22.04 .
```

## 📊 Specifications

| Component | Version | Notes |
|-----------|---------|-------|
| Ubuntu | 22.04 LTS | Jammy Jellyfish |
| Node.js | 20.x LTS | Iron |
| Python | 3.10 | Ubuntu 22.04 native |
| SteamCMD | Latest | Auto-updatable, compatible |
| Nginx | 1.18+ | Included in Ubuntu 22.04 |

## 🔧 Configuration

### Users and Permissions
- **User**: `docker` (UID: 1000, GID: 1000)
- **Home directory**: `/app`
- **Shell**: `/bin/bash`

### Exposed Ports
- `8080` - Rust+ / Web applications
- `28015` - Main game port
- `28016` - RCON port
- `28082` - Application port

### Directories
- `/app` - Application directory
- `/steamcmd` - SteamCMD installation
- `/steamcmd/rust` - Rust server data
- `/usr/share/nginx/html` - WebRCON
- `/var/log/nginx` - Nginx logs

## 🌐 Environment Variables

```bash
LANG=en_US.UTF-8
LANGUAGE=en_US.UTF-8
TERM=xterm
TZ=Etc/UTC
PGID=1000
PUID=1000
CHOWN_DIRS="/app,/steamcmd,/usr/share/nginx/html,/var/log/nginx"
```

## 📋 Differences from Original Image

| Original (didstopia/base) | Modernized (base-2025) |
|--------------------------|-------------------------|
| Ubuntu 18.04 | **Ubuntu 22.04 LTS** |
| Node.js 12 | **Node.js 20 LTS** |
| Python 2 (python-dev) | **Python 3.10** |
| lib32gcc1 | **lib32gcc-s1** |
| bsdtar | **libarchive-tools** |
| UID/GID 1000:1000 | **UID/GID 1000:1000** (no changes) |

## 🔄 Use with rust-server-2025

This base image is designed to be used with:
- [rust-server-2025](https://github.com/AngelMartinezDevops/rust-server-2025)

```dockerfile
FROM b3lerofonte/base:nodejs-20-steamcmd-ubuntu-22.04

# Rust server specific configuration
COPY apps/ /app/
COPY scripts/ /app/
# ... rest of configuration
```

## 💾 Image Size

- **Compressed**: ~600 MB
- **Uncompressed**: ~1.5 GB

## 🔗 Useful Links

- **Docker Hub**: https://hub.docker.com/r/b3lerofonte/base
- **GitHub**: https://github.com/AngelMartinezDevops/base-2025
- **Rust Server**: https://github.com/AngelMartinezDevops/rust-server-2025

## 📝 License

MIT License - See LICENSE.md

## 👨‍💻 Author

**b3lerofonte**
- GitHub: [@AngelMartinezDevops](https://github.com/AngelMartinezDevops)
- Docker Hub: [b3lerofonte](https://hub.docker.com/u/b3lerofonte)
- Email: angel200391@gmail.com

## 🙏 Credits

Based on the excellent work of:
- [Didstopia/docker-rust-server](https://github.com/Didstopia/docker-rust-server)

Modernized and updated for 2025 with the latest software versions.

