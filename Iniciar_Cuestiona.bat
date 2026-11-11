@echo off
chcp 65001 >nul
cd /d "%~dp0"
py servidor_cuestiona.py
if errorlevel 1 (
  echo.
  echo No se pudo iniciar Cuestiona 2.0. Comprueba que Python este instalado.
  pause
)
