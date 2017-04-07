@echo off
set /p Input=Dossier du module a compiler ? (ex: themeBtib-ux) :

:: change directory or exit
pushd "%Input%" || goto :END

:: install dev dependencies
call %~dp0.lib/npm.cmd install
:: compile less files
call %~dp0.lib/node.exe -e "require('grunt').tasks('less');"
popd
:: build script
call %~dp0.lib/gradlew.bat build
goto :END


:END
pause
