@echo off
setlocal EnableDelayedExpansion

GOTO:REM
---------------------------------------------------------------------------------------------------
Write the package.json file in the .lib folder.
The version number must be passed as first argument and will be printed as is.
---------------------------------------------------------------------------------------------------
:REM

cd "%~dp0\..\.lib"

echo { > package.json
echo  "name": "btib-theme-generator", >> package.json
echo  "version": "%1", >> package.json
echo  "description": "build niagara theme automatically", >> package.json
echo  "main": "index.js", >> package.json
echo  "scripts": { >> package.json
echo    "test": "echo \"Error: no test specified\" && exit 1" >> package.json
echo  }, >> package.json
echo  "author": "developpeurs@btib.fr", >> package.json
echo  "license": "ISC", >> package.json
echo  "dependencies": { >> package.json
echo    "async": "^2.3.0", >> package.json
echo    "fs-extra": "^2.1.2", >> package.json
echo    "handlebars": "^4.0.6", >> package.json
echo    "semver": "^5.3.0", >> package.json
echo    "vorpal": "^1.12.0" >> package.json
echo  } >> package.json
echo } >> package.json
