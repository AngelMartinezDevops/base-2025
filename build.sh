#!/bin/bash
# Script para construir la imagen base

echo "🏗️  Construyendo imagen base..."
echo ""

# Información
IMAGE_NAME="b3lerofonte/base"
TAG="nodejs-20-steamcmd-ubuntu-24.04"

# Construir con múltiples tags
echo "📦 Construyendo imagen: ${IMAGE_NAME}"
echo ""

docker build \
  -t "${IMAGE_NAME}:${TAG}" \
  .

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Imagen construida exitosamente!"
    echo ""
    echo "📋 Tag creado:"
    echo "   - ${IMAGE_NAME}:${TAG}"
    echo ""
    echo "🐳 Para subir a Docker Hub:"
    echo "   docker push ${IMAGE_NAME}:${TAG}"
    echo ""
    echo "🧪 Para probar:"
    echo "   docker run -it ${IMAGE_NAME}:${TAG} bash"
else
    echo ""
    echo "❌ Error al construir la imagen"
    exit 1
fi

