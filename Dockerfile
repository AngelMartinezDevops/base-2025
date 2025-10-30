# Dockerfile para imagen BASE
# Solo Ubuntu + Node.js + SteamCMD + Nginx
# Equivalente a: didstopia/base:nodejs-12-steamcmd-ubuntu-18.04

FROM ubuntu:24.04

LABEL maintainer="b3lerofonte <angel200391@gmail.com>"

# ============================================
# VARIABLES Y CONFIGURACIÓN INICIAL
# ============================================
ARG DEBIAN_FRONTEND=noninteractive

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV TERM=xterm
ENV TZ=Etc/UTC
ENV PGID=1001
ENV PUID=1001

# ============================================
# INSTALACIÓN BASE
# ============================================
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        software-properties-common \
        locales \
        wget \
        curl \
        git \
        sudo \
        libarchive-tools \
        gnupg2 \
        dirmngr \
        apt-transport-https \
        lsb-release && \
    apt-get upgrade -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/* && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

# Crear usuario (usa IDs diferentes ya que 1000 está ocupado en Ubuntu 24.04)
RUN groupadd --system --gid 1001 docker && \
    useradd \
        --create-home \
        --home /app \
        --uid 1001 \
        --gid 1001 \
        --groups users \
        --shell /bin/bash \
        docker && \
    mkdir -p /app

# ============================================
# INSTALACIÓN DE STEAMCMD
# ============================================
RUN dpkg --add-architecture i386 && \
    add-apt-repository multiverse && \
    echo steam steam/question select "I AGREE" | debconf-set-selections && \
    echo steam steam/license note '' | debconf-set-selections && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        steamcmd \
        lib32gcc-s1 \
        libstdc++6 \
        libstdc++6:i386 \
        libsdl2-2.0-0:i386 \
        libcurl4:i386 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /steamcmd && \
    curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz \
    | tar -v -C /steamcmd -zx && \
    chmod +x /steamcmd/steamcmd.sh && \
    chown -R docker:docker /steamcmd

# Inicializar SteamCMD
USER docker
RUN /steamcmd/steamcmd.sh +login anonymous +quit || true
USER root

# ============================================
# INSTALACIÓN DE NODE.JS 20 LTS
# ============================================
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        nodejs \
        python3 \
        python3-dev \
        build-essential \
        jq && \
    npm install -g npm@latest && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# ============================================
# INSTALACIÓN DE NGINX
# ============================================
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        nginx \
        expect \
        tcl \
        libgdiplus && \
    rm -rf /var/lib/apt/lists/*

# Limpiar configuración nginx
RUN rm -fr /usr/share/nginx/html/* && \
    rm -fr /etc/nginx/sites-available/* && \
    rm -fr /etc/nginx/sites-enabled/*

# Crear directorios necesarios
RUN mkdir -p /steamcmd/rust /usr/share/nginx/html /var/log/nginx

# Ajustar permisos
RUN chown -R docker:docker \
    /steamcmd \
    /app \
    /usr/share/nginx/html \
    /var/log/nginx

# Variables de entorno para directorios
ENV CHOWN_DIRS="/app,/steamcmd,/usr/share/nginx/html,/var/log/nginx"

# Exponer puertos
EXPOSE 8080
EXPOSE 28015
EXPOSE 28016
EXPOSE 28082

WORKDIR /app
USER docker

CMD ["/bin/bash"]

