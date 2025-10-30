# Script para construir la imagen base en Windows

Write-Host "🏗️  Construyendo imagen base..." -ForegroundColor Cyan
Write-Host ""

# Información
$IMAGE_NAME = "b3lerofonte/base"
$TAG = "nodejs-20-steamcmd-ubuntu-24.04"

# Construir imagen
Write-Host "📦 Construyendo imagen: $IMAGE_NAME" -ForegroundColor Yellow
Write-Host ""

docker build `
  -t "${IMAGE_NAME}:${TAG}" `
  .

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ Imagen construida exitosamente!" -ForegroundColor Green
    Write-Host ""
    Write-Host "📋 Tag creado:" -ForegroundColor Yellow
    Write-Host "   - ${IMAGE_NAME}:${TAG}"
    Write-Host ""
    Write-Host "🐳 Para subir a Docker Hub:" -ForegroundColor Cyan
    Write-Host "   docker push ${IMAGE_NAME}:${TAG}"
    Write-Host ""
    Write-Host "🧪 Para probar:" -ForegroundColor Cyan
    Write-Host "   docker run -it ${IMAGE_NAME}:${TAG} bash"
} else {
    Write-Host ""
    Write-Host "❌ Error al construir la imagen" -ForegroundColor Red
    exit 1
}

