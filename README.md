# 🐳 Base Docker Image - Ubuntu 24.04 + Node.js 20 + SteamCMD

Imagen base modernizada para servidores de juegos, específicamente optimizada para Rust Server.

## 📦 Componentes Incluidos

### Sistema Operativo
- **Ubuntu 24.04 LTS** - Soporte hasta 2029

### Runtime y Herramientas
- **Node.js 20 LTS** - Última versión de largo soporte
- **npm** - Gestor de paquetes actualizado
- **Python 3** - Con python3-dev y build-essential
- **Git, curl, wget** - Herramientas esenciales

### Gaming
- **SteamCMD** - Cliente de línea de comandos de Steam
- **Librerías 32-bit** - lib32gcc-s1, libstdc++6:i386, libsdl2-2.0-0:i386

### Web Server
- **Nginx** - Servidor web para WebRCON
- **expect, tcl** - Para automatización

## 🏷️ Tags Disponibles

```bash
# Última versión
docker pull angelmartinezdevops/base:latest

# Tag específico
docker pull angelmartinezdevops/base:nodejs-20-steamcmd-ubuntu-24.04
```

## 🚀 Uso

### Como Imagen Base para tu Dockerfile

```dockerfile
FROM angelmartinezdevops/base:nodejs-20-steamcmd-ubuntu-24.04

# Tu configuración aquí
COPY mi-app /app/
WORKDIR /app
RUN npm install

CMD ["node", "server.js"]
```

### Construcción Local

```bash
git clone https://github.com/AngelMartinezDevops/base-2025.git
cd base-2025
docker build -t angelmartinezdevops/base:latest .
```

## 📊 Especificaciones

| Componente | Versión | Notas |
|-----------|---------|-------|
| Ubuntu | 24.04 LTS | Noble Numbat |
| Node.js | 20.x LTS | Iron |
| Python | 3.12 | Nativo de Ubuntu 24.04 |
| SteamCMD | Latest | Auto-actualizable |
| Nginx | 1.24+ | Incluido en Ubuntu 24.04 |

## 🔧 Configuración

### Usuarios y Permisos
- **Usuario**: `docker` (UID: 1001, GID: 1001)
- **Directorio home**: `/app`
- **Shell**: `/bin/bash`

### Puertos Expuestos
- `8080` - Rust+ / Aplicaciones web
- `28015` - Puerto de juego principal
- `28016` - Puerto RCON
- `28082` - Puerto de aplicación

### Directorios
- `/app` - Directorio de aplicación
- `/steamcmd` - Instalación de SteamCMD
- `/steamcmd/rust` - Datos del servidor Rust
- `/usr/share/nginx/html` - WebRCON
- `/var/log/nginx` - Logs de Nginx

## 🌐 Variables de Entorno

```bash
LANG=en_US.UTF-8
LANGUAGE=en_US.UTF-8
TERM=xterm
TZ=Etc/UTC
PGID=1001
PUID=1001
CHOWN_DIRS="/app,/steamcmd,/usr/share/nginx/html,/var/log/nginx"
```

## 📋 Diferencias con Imagen Original

| Original (didstopia/base) | Modernizada (base-2025) |
|--------------------------|-------------------------|
| Ubuntu 18.04 | **Ubuntu 24.04 LTS** |
| Node.js 12 | **Node.js 20 LTS** |
| Python 2 (python-dev) | **Python 3.12** |
| lib32gcc1 | **lib32gcc-s1** |
| bsdtar | **libarchive-tools** |
| UID/GID 1000:1000 | **UID/GID 1001:1001** |

## 🔄 Uso con rust-server-2025

Esta imagen base está diseñada para ser usada con:
- [rust-server-2025](https://github.com/AngelMartinezDevops/rust-server-2025)

```dockerfile
FROM angelmartinezdevops/base:nodejs-20-steamcmd-ubuntu-24.04

# Configuración específica del servidor Rust
COPY apps/ /app/
COPY scripts/ /app/
# ... resto de configuración
```

## 💾 Tamaño de Imagen

- **Comprimida**: ~600 MB
- **Descomprimida**: ~1.5 GB

## 🔗 Enlaces Útiles

- **Docker Hub**: https://hub.docker.com/r/angelmartinezdevops/base
- **GitHub**: https://github.com/AngelMartinezDevops/base-2025
- **Rust Server**: https://github.com/AngelMartinezDevops/rust-server-2025

## 📝 Licencia

MIT License - Ver LICENSE.md

## 👨‍💻 Autor

**AngelMartinezDevops**
- GitHub: [@AngelMartinezDevops](https://github.com/AngelMartinezDevops)
- Email: angel200391@gmail.com

## 🙏 Créditos

Basado en el excelente trabajo de:
- [Didstopia/docker-rust-server](https://github.com/Didstopia/docker-rust-server)

Modernizado y actualizado para 2025 con las últimas versiones de software.

