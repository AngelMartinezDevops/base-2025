#!/bin/bash
# Script para construir la imagen base

echo "🏗️  Construyendo imagen base..."
echo ""

# Información
IMAGE_NAME="angelmartinezdevops/base"
TAG_MAIN="nodejs-20-steamcmd-ubuntu-24.04"
TAG_LATEST="latest"

# Construir con múltiples tags
echo "📦 Construyendo imagen: ${IMAGE_NAME}"
echo ""

docker build \
  -t "${IMAGE_NAME}:${TAG_MAIN}" \
  -t "${IMAGE_NAME}:${TAG_LATEST}" \
  .

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Imagen construida exitosamente!"
    echo ""
    echo "📋 Tags creados:"
    echo "   - ${IMAGE_NAME}:${TAG_MAIN}"
    echo "   - ${IMAGE_NAME}:${TAG_LATEST}"
    echo ""
    echo "🐳 Para subir a Docker Hub:"
    echo "   docker push ${IMAGE_NAME}:${TAG_MAIN}"
    echo "   docker push ${IMAGE_NAME}:${TAG_LATEST}"
    echo ""
    echo "🧪 Para probar:"
    echo "   docker run -it ${IMAGE_NAME}:latest bash"
else
    echo ""
    echo "❌ Error al construir la imagen"
    exit 1
fi

