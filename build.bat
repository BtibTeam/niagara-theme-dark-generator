@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------
:: set the environment variable
IF defined NIAGARA_HOME goto CONTINUE

set /p niagara_home=Dossier d'installation de Niagara ? (ex: C:\Niagara\Niagara-4.3.58.4) :
setx NIAGARA_HOME "%niagara_home%" /m || goto END


:CONTINUE
:: change directory or exit
pushd "%Input%" || goto :END

:: install global dependencies
call npm install -g phantomjs grunt-cli

:: install dev dependencies
call npm install
:: compile less files
call grunt less
popd
:: build script
if "%1" == "--skip" goto :DONE
call %~dp0.lib/gradlew.bat build

:END
pause

:DONE
