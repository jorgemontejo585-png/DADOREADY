@echo off
cd /d "%~dp0"

:: Si no existe la carpeta node_modules, la instala automaticamente
if not exist "node_modules\" (
    echo [1/2] Instalando librerias por primera vez, espera unos segundos...
    call npm install
)

echo [2/2] Iniciando tienda DADO...
start /b cmd /c "timeout /t 3 /nobreak >nul && start http://localhost:3000"
call npm run dev
pause
