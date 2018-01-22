@echo off
setlocal EnableDelayedExpansion

GOTO:REM
---------------------------------------------------------------------------------------------------
Run all the procedure to install dependencies, build the module, and obfuscate it.
It relies on the NIAGARA_HOME environment property.
---------------------------------------------------------------------------------------------------
:REM

call :removeJars 2>&1

cd "%~dp0\.."

:: script based on /build.bat
pushd .lib
call npm install
IF %ERRORLEVEL% NEQ 0 ( 
   exit %ERRORLEVEL% 
)

popd
call node .lib/index.js create -n themeActive -d "Default theme for BTIB modules" -h %NIAGARA_HOME% -v BTIB
IF %ERRORLEVEL% NEQ 0 ( 
   exit %ERRORLEVEL% 
)

pushd .tmp 

pushd themeActive-ux

call npm install
IF %ERRORLEVEL% NEQ 0 ( 
   exit %ERRORLEVEL% 
)

call grunt less
IF %ERRORLEVEL% NEQ 0 ( 
   exit %ERRORLEVEL% 
)

popd

call "..\.lib\gradlew.bat" clean
IF %ERRORLEVEL% NEQ 0 ( 
   exit %ERRORLEVEL% 
)

call "..\.lib\gradlew.bat" build
IF %ERRORLEVEL% NEQ 0 ( 
   exit %ERRORLEVEL% 
)

call "..\.lib\gradlew.bat" --stop

exit %ERRORLEVEL% 

:removeJars
del %NIAGARA_HOME%\modules\themeActive-* || (
    echo no modules founded for themeActive
)
exit /b