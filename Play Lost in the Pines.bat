@echo off
cd /d "%~dp0"
set PORT=8765
set PY=
where py >nul 2>&1 && set PY=py
if not defined PY where python >nul 2>&1 && set PY=python

if not defined PY (
  start "" "%~dp0index.html"
  echo Opened index.html in your browser.
  echo Install and offline save work best with a local server — install Python and run this file again.
  pause
  exit /b 0
)

start "" "http://127.0.0.1:%PORT%/"
echo Lost in the Pines — http://127.0.0.1:%PORT%/
echo Close this window to stop the test server.
%PY% -m http.server %PORT%