@echo off
setlocal EnableDelayedExpansion

GOTO:REM
---------------------------------------------------------------------------------------------------
Write the vendor.gradle file at the root of the repository.
The version number must be passed as first argument and will be printed as is.
---------------------------------------------------------------------------------------------------
:REM

cd "%~dp0\.."

echo // Vendor name applied to all modules > vendor.gradle
echo group = "BTIB" >> vendor.gradle
echo. >> vendor.gradle
echo // Major, minor, and build version >> vendor.gradle
echo def moduleVersion = "%1" >> vendor.gradle
echo. >> vendor.gradle
echo // Patch version can be declared >> vendor.gradle
echo // For example, to patch envCtrlDriver module as 5.0.1.1 >> vendor.gradle
echo // moduleVersionPatch.'envCtrlDriver' = ".1" >> vendor.gradle
echo def moduleVersionPatch = [:] >> vendor.gradle
echo. >> vendor.gradle
echo // Final version property applied to all modules >> vendor.gradle
echo version = "${moduleVersion}${moduleVersionPatch.get(project.name, '')}" >> vendor.gradle
