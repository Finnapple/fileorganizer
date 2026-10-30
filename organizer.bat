
@echo off
setlocal
title File Extension Organizer
color F0

set "DIR=%~dp0"

echo ========================================
echo        FILE EXTENSION ORGANIZER
echo ========================================
echo.
echo Target directory: %DIR%
echo.

for %%F in ("%DIR%*") do (
    if exist "%%~fF" if not exist "%%~fF\" (
        if /i not "%%~fF"=="%~f0" (

            if "%%~xF"=="" (
                set "EXT=NO_EXTENSION"
                call :movefile "%%~fF" "NO_EXTENSION"
            ) else (
                call :movefile "%%~fF" "%%~xF"
            )

        )
    )
)

echo.
echo ========================================
echo       ORGANIZATION COMPLETED!
echo ========================================
pause
exit /b

:movefile
if not exist "%DIR%%~2\" mkdir "%DIR%%~2"
echo Moving: %~nx1
move "%~1" "%DIR%%~2\"
exit /b
