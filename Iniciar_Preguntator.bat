@echo off
chcp 65001 >nul
cd /d "%~dp0"
py servidor_preguntator.py
if errorlevel 1 (
  echo.
  echo No se pudo iniciar Preguntator. Comprueba que Python este instalado.
  pause
)
