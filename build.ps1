Write-Host "Script started"

# Очистити dist
Write-Host "Cleaning dist/"
Remove-Item -Recurse -Force dist -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path dist | Out-Null

# Запуск модульних тестів
Write-Host "Start module tests"
npm test

if ($LASTEXITCODE -ne 0) {
    Write-Host "tests -> Failed" -ForegroundColor Red
    exit 1
}
Write-Host "tests -> Done"

# Копіювання index.html
Write-Host "Copying index.html"
Copy-Item index.html dist\

# Копіювання script.js
if (Test-Path script.js) {
    Write-Host "Copying script.js"
    Copy-Item script.js dist\
} else {
    Write-Host "script.js not found"
}

Write-Host "Done"
