@echo off
chcp 65001 >nul
title TekNerds C2PA
cd /d "%~dp0"
set "PYEXE="
where py >nul 2>nul && set "PYEXE=py -3"
if "%PYEXE%"=="" ( where python >nul 2>nul && set "PYEXE=python" )
if "%PYEXE%"=="" (
  echo Python 3 nicht gefunden / not found.
  echo Bitte installieren / please install: https://www.python.org/downloads/
  echo ^( "Add python.exe to PATH" anhaken / tick it ^)
  echo.
  pause
  goto :eof
)
echo Starte / Starting TekNerds C2PA ...
echo Fehlt c2patool, wird es automatisch geladen / will be downloaded if missing.
echo Beenden / Quit: Power-Knopf in der App / power button, oder / or Strg+C / Ctrl+C.
echo.
%PYEXE% "c2pa_signer.py"
pause
