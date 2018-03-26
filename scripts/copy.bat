@echo off
setlocal EnableDelayedExpansion

GOTO:REM
---------------------------------------------------------------------------------------------------
Copy all modules created with the current build command, the destination folder will be 
given as first argument.
---------------------------------------------------------------------------------------------------
:REM

xcopy "%NIAGARA_HOME%\modules\themeActive-*.jar" %1 /Y