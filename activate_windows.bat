@echo off
:: Windows 11/10 Pro Activation Script
:: This script will attempt to activate Windows 10/11 Pro using KMS client key
:: Run this script as Administrator for best results

echo ===============================================
echo Windows 11/10 Pro Activation Script
echo ===============================================
echo.
echo This script will attempt to activate Windows Pro
echo Please run this script as Administrator
echo.
echo Press any key to continue or Ctrl+C to cancel...
pause >nul

:: Check if running as administrator
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: This script must be run as Administrator
    echo Right-click on this file and select "Run as administrator"
    pause
    exit /b 1
)

echo.
echo Step 1: Setting KMS client key for Windows Pro...
cscript //nologo slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
if %errorlevel% equ 0 (
    echo Success: Product key installed
) else (
    echo Error: Failed to install product key
    pause
    exit /b 1
)

echo.
echo Step 2: Setting KMS host (using default Microsoft KMS)...
cscript //nologo slmgr.vbs /skms kms8.msguides.com
if %errorlevel% equ 0 (
    echo Success: KMS host configured
) else (
    echo Warning: Could not set KMS host
)

echo.
echo Step 3: Activating Windows...
cscript //nologo slmgr.vbs /ato
if %errorlevel% equ 0 (
    echo Success: Windows activated successfully
) else (
    echo Error: Activation failed
    echo Trying alternative activation method...
    
    :: Alternative activation method
    slmgr /skms kms.core.bz
    if %errorlevel% equ 0 (
        echo Alternative KMS host configured
        cscript //nologo slmgr.vbs /ato
        if %errorlevel% equ 0 (
            echo Success: Windows activated with alternative method
        ) else (
            echo Error: All activation methods failed
            pause
            exit /b 1
        )
    ) else (
        echo Error: All activation methods failed
        pause
        exit /b 1
    )
)

echo.
echo Step 4: Checking activation status...
cscript //nologo slmgr.vbs /xpr

echo.
echo ===============================================
echo Windows activation process completed
echo ===============================================
echo.
echo Your Windows should now be activated.
echo If you encounter any issues, check your internet connection
echo and make sure Windows Firewall is not blocking the activation.
echo.
pause