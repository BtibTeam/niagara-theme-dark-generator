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
call npm install || EXIT /b %ERRORLEVEL%
popd
call node .lib/index.js create -n themeActive -d "Default theme for BTIB modules" -h %NIAGARA_HOME% -v BTIB || EXIT /b %ERRORLEVEL%

pushd .tmp 

pushd themeActive-ux

call npm install || EXIT /b %ERRORLEVEL%
call grunt less || EXIT /b %ERRORLEVEL%

popd

call "..\.lib\gradlew.bat" clean || EXIT /b %ERRORLEVEL%
call "..\.lib\gradlew.bat" build || EXIT /b %ERRORLEVEL%
call "..\.lib\gradlew.bat" --stop || EXIT /b %ERRORLEVEL%

exit /b

:removeJars
del %NIAGARA_HOME%\modules\themeActive-* || (
    echo no modules founded for themeActive
)
exit /b