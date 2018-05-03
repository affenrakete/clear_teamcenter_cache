:: clear teamcenter cache
:: Copyright (C) 2018  Peter Siemer
:: 
:: This program is free software: you can redistribute it and/or modify
:: it under the terms of the GNU General Public License as published by
:: the Free Software Foundation, either version 3 of the License, or
:: (at your option) any later version.
::
:: This program is distributed in the hope that it will be useful,
:: but WITHOUT ANY WARRANTY; without even the implied warranty of
:: MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
:: GNU General Public License for more details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program. If not, see <http://www.gnu.org/licenses/>.

@echo off

CLS

title Teamcenter cache leeren

echo.
echo Achtung:  Dieses Script beendet Teamcenter und NX!
echo.
echo Zudem werden weitere Prozesse beendet. (z.B. java.exe und javaw.exe)
echo.
echo Speichere deine Daten bevor du weiter machst.
echo.
echo.
echo 1 - Prozesse killen.
echo 2 - Prozesse killen und Cache leeren. (Normal)
echo 3 - Prozesse killen und Cache leeren. (Intensiv)
echo.
set /p u=Auswahl: 

:: Rest überspringen wenn ungültig ausgewählt
IF %u% EQU 1 GOTO :Prozesse
IF %u% EQU 2 GOTO :Prozesse
IF %u% EQU 3 GOTO :Prozesse

GOTO :Ende

:Prozesse

echo.
echo Prozesse killen
echo.

:: Eine Reihe von Prozessen killen
echo java.exe
taskkill /IM java.exe /T /F >nul 2>&1

echo javaw.exe
taskkill /IM javaw.exe /T /F >nul 2>&1

echo PLM_StartCenter.exe
taskkill /IM PLM_StartCenter.exe /T /F >nul 2>&1

echo ugraf.exe
taskkill /IM ugraf.exe /F >nul 2>&1

echo ugs_router.exe
taskkill /IM ugs_router.exe /F >nul 2>&1

echo teamcenter.exe
taskkill /IM Teamcenter.exe /F >nul 2>&1

echo visview.exe
taskkill /IM visview.exe /F >nul 2>&1

echo visview_NG.exe
taskkill /IM visview_NG.exe /F >nul 2>&1

echo.
echo.

:: Rest überspringen wenn nur 1 ausgewählt
IF %u% EQU 1 GOTO :Ende

echo Warten um Prozesse sicher zu beenden...
timeout /T 5 /NOBREAK
echo.
echo Cache leeren (Normal)
echo.

:: Löschen vom TC Cache
echo Ordner: %appdata%\Siemens\FCCCache
rd /s /q %appdata%\Siemens\FCCCache

echo.
echo ... erledigt.

:: Rest überspringen wenn nur 2 ausgewählt
IF %u% EQU 2 GOTO :Ende

echo.
echo.
echo Cache leeren (Intensiv)
echo.
echo Achtung:  Einstellungen aus TC werden auf Standard gesetzt.
echo.
echo.
echo 1 - Weiter
echo 2 - Beenden

set /p u=Auswahl:

:: Nachfragen ob wirklich alles zurückgesetzt werden soll.
:: Ansonsten überspingen. 
IF %u% EQU 1 GOTO :Intensiv

GOTO :Ende

:Intensiv

echo.
echo.
:: Löschen von allen TC und NX Ordnern mit Zwischenspeicher
echo Ordner: C:\Users\%username%\Siemens  
rd C:\Users\%username%\Siemens /S /Q && md C:\Users\%username%\Siemens
echo.
echo Ordner: C:\Users\%username%\FCCCache\%username%
rd C:\Users\%username%\FCCCache\%username% /S /Q && md C:\Users\%username%\FCCCache\%username%
echo.
echo Ordner: C:\Users\%username%\Teamcenter
rd C:\Users\%username%\Teamcenter /S /Q && md C:\Users\%username%\Teamcenter
echo.
echo Ordner: C:\Users\%username%\AppData\Local\Temp\nx
rd C:\Users\%username%\AppData\Local\Temp\nx /S /Q && md C:\Users\%username%\AppData\Local\Temp\nx
echo.
:: Ordner unten enthält RAC FCCC usw.
echo Ordner: C:\Users\%username%\AppData\Roaming\Siemens
rd C:\Users\%username%\AppData\Roaming\Siemens /S /Q && md C:\Users\%username%\AppData\Roaming\Siemens
echo.
echo Ordner: C:\Users\%username%\AppData\Roaming\teamcenter\sso
rd C:\Users\%username%\AppData\Roaming\teamcenter\sso /S /Q && md C:\Users\%username%\AppData\Roaming\teamcenter\sso
echo.
echo Ordner: C:\ProgramData\plm\temp\nx
rd C:\ProgramData\plm\temp\nx /S /Q && md C:\ProgramData\plm\temp\nx

echo.
echo ... erledigt.

:Ende

echo.
pause
