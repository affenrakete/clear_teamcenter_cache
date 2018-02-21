@echo off

CLS

title Teamcenter cache leeren

echo.
echo Achtung:  Dieses Script beendet Teamcenter und NX!
echo.
echo Zudem werden die Prozesse java.exe und javaw.exe beendet.
echo Speichere deine Daten bevor du weiter machst.
echo.
echo Weiter mit 1.

set /p u=Auswahl:

IF %u% NEQ 1 GOTO :Ende

echo.
echo Prozesse killen
echo.

echo java.exe
taskkill /IM java.exe /T /F >nul 2>&1

echo javaw.exe
taskkill /IM javaw.exe /T /F >nul 2>&1

echo ugraf.exe
taskkill /IM ugraf.exe /F >nul 2>&1

echo teamcenter.exe
taskkill /IM Teamcenter.exe /F >nul 2>&1

echo visview.exe
taskkill /IM visview.exe /F >nul 2>&1

echo visview_NG.exe
taskkill /IM visview_NG.exe /F >nul 2>&1

echo.
echo.
timeout /T 5
echo.
echo Cache leeren
rmdir /s /q %appdata%\Siemens\FCCCache

:Ende

echo.
pause
