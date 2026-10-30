
@echo off
setlocal
title File Extension Scanner
color F0

set "OUTPUT=%~dp0scanned_file.txt"

echo Scanning directory...

(
    echo ========================================
    echo       AVAILABLE FILE EXTENSIONS
    echo ========================================
    echo Directory: %~dp0
    echo.
) > "%OUTPUT%"

for %%F in ("%~dp0*") do (
    if exist "%%~fF" if not exist "%%~fF\" (
        if /i not "%%~nxF"=="scanned_file.txt" (
            if not "%%~xF"=="" (
                echo %%~xF
            ) else (
                echo [NO EXTENSION]
            )
        )
    )
) >> "%OUTPUT%"

echo.
echo Scan completed!
echo Results saved to scanned_file.txt
pause
