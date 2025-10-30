# Script para construir la imagen base en Windows

Write-Host "🏗️  Construyendo imagen base..." -ForegroundColor Cyan
Write-Host ""

# Información
$IMAGE_NAME = "angelmartinezdevops/base"
$TAG_MAIN = "nodejs-20-steamcmd-ubuntu-24.04"
$TAG_LATEST = "latest"

# Construir con múltiples tags
Write-Host "📦 Construyendo imagen: $IMAGE_NAME" -ForegroundColor Yellow
Write-Host ""

docker build `
  -t "${IMAGE_NAME}:${TAG_MAIN}" `
  -t "${IMAGE_NAME}:${TAG_LATEST}" `
  .

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ Imagen construida exitosamente!" -ForegroundColor Green
    Write-Host ""
    Write-Host "📋 Tags creados:" -ForegroundColor Yellow
    Write-Host "   - ${IMAGE_NAME}:${TAG_MAIN}"
    Write-Host "   - ${IMAGE_NAME}:${TAG_LATEST}"
    Write-Host ""
    Write-Host "🐳 Para subir a Docker Hub:" -ForegroundColor Cyan
    Write-Host "   docker push ${IMAGE_NAME}:${TAG_MAIN}"
    Write-Host "   docker push ${IMAGE_NAME}:${TAG_LATEST}"
    Write-Host ""
    Write-Host "🧪 Para probar:" -ForegroundColor Cyan
    Write-Host "   docker run -it ${IMAGE_NAME}:latest bash"
} else {
    Write-Host ""
    Write-Host "❌ Error al construir la imagen" -ForegroundColor Red
    exit 1
}

