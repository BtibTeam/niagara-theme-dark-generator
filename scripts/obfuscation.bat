@echo off
setlocal EnableDelayedExpansion

GOTO:REM
---------------------------------------------------------------------------------------------------
Allows to offuscate java classes of Niagara modules
Works with Bamboo on JenkinsVM which is a Windows VM
Executed from the bamboo working directory (C:\Users\administrateur.BTIB\bamboo-agent-home\xml-data\build-dir\...)

1. Create a config.xml with some informations about modules
	- <jars> : modules to offuscate
	- <classpath> : the dependencies required by the modules. They are stored in a file called "module.xml" in each module
	- <ignore-classes> : the libraries to ignore during obfuscation. Especially used for external libraries
	
2. Launch allatori.jar
---------------------------------------------------------------------------------------------------
:REM

echo Creating xml file for Allatori...
echo ^<?xml version="1.0" encoding="UTF-8" standalone="no" ?^> > config.xml
echo ^<config^> >> config.xml

echo ^<jars basedir="%NIAGARA_HOME%\modules"^> >> config.xml
for /d %%a in (%1-*) do (
	echo ^<jar in="%%a.jar" out="%NIAGARA_HOME%\modules\%%a.jar" /^> >> config.xml
	echo Module %%a.jar detected
)
echo ^</jars^> >> config.xml

echo ^<classpath basedir="%NIAGARA_HOME%"^> >> config.xml
for /d %%a in (%1-*) do (
	echo Dependencies for %%a :
	for /f tokens^=2^ delims^=^" %%l in ('findstr /i /r /c:"compile" %%~fa\%%a.gradle') do (
		for /f "tokens=2 delims=:" %%s in ("%%l") do (
			echo ^<jar name="modules/%%s.jar" /^> >> config.xml
			echo %%s.jar
		)
	) 
)
echo ^</classpath^> >> config.xml
if exist "tmp.txt" del "tmp.txt"

echo ^<keep-names^> >> config.xml
echo ^<class access="protected+"^> >> config.xml
echo ^<field access="protected+" /^> >> config.xml
echo ^<method access="protected+" /^> >> config.xml
echo ^</class^> >> config.xml
echo ^</keep-names^> >> config.xml

echo ^<ignore-classes^> >> config.xml
echo ^<class template="class javax.servlet.*" /^> >> config.xml
echo ^<class template="class com.google.gson.*" /^> >> config.xml
echo ^<class template="class it.sauronsoftware.ftp4j.*" /^> >> config.xml
echo ^</ignore-classes^> >> config.xml

echo ^<property name="control-flow-obfuscation" value="enable" /^> >> config.xml
echo ^<property name="member-reorder" value="disable" /^> >> config.xml
echo ^<property name="line-numbers" value="keep" /^> >> config.xml
echo ^<property name="string-encryption" value="enable" /^> >> config.xml
echo ^<property name="string-encryption-ignored-strings" value="%~dp0\patterns.txt"/^> >> config.xml
echo ^<property name="finalize" value="disable" /^> >> config.xml
echo ^<property name="output-jar-comment" value="disable" /^> >> config.xml

echo ^<watermark key="BtibSecurityKey2002-2014" value="Customer: Btib; Date: %date%" /^> >> config.xml

echo ^</config^> >> config.xml

java -Xms256m -Xmx1024m -jar %~dp0\Allatori-5.9\lib\allatori.jar "config.xml"

del "config.xml"
