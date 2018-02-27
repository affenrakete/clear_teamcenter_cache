@echo off

CLS

title Teamcenter cache leeren

echo.
echo Achtung:  Dieses Script beendet Teamcenter und NX!
echo.
echo Zudem werden die Prozesse java.exe und javaw.exe beendet.
echo Speichere deine Daten bevor du weiter machst.
echo.
echo 1 - Prozesse killen und Cache leeren.
echo 2 - Prozesse killen.

set /p u=Auswahl:

IF %u% EQU 1 GOTO :Prozesse
IF %u% EQU 2 GOTO :Prozesse

GOTO :Ende

:Prozesse

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

IF %u% EQU 2 GOTO :Ende

timeout /T 5
echo.
echo Cache leeren
rmdir /s /q %appdata%\Siemens\FCCCache

:Ende

echo.
pause
