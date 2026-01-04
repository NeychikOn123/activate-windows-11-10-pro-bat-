@echo off
:: Simple Windows 11/10 Pro Activation Script

echo Windows 11/10 Pro Activation (Simple Version)
echo ============================================

:: Check for admin rights
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Please run this script as Administrator
    pause
    exit /b 1
)

:: Install Windows Pro KMS key
cscript //nologo slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX

:: Set KMS server
cscript //nologo slmgr.vbs /skms kms8.msguides.com

:: Activate Windows
cscript //nologo slmgr.vbs /ato

:: Show activation status
cscript //nologo slmgr.vbs /xpr

echo.
echo Activation process completed!
echo.
pause