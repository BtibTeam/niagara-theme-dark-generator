@echo off
setlocal EnableDelayedExpansion

jarsigner.exe -keystore %~dp0\certs\btibModulesCertificate.jks -storepass %2 %NIAGARA_HOME%\modules\%1.jar btibModulesCertificate