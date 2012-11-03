@echo off
SET BATCHDIR=%~dp0

SET JAVABIN="%PROGRAMFILES%\Java\jre7\bin\java.exe"
IF NOT EXIST %JAVABIN% SET JAVABIN="%PROGRAMFILES% (x86)\Java\jre7\bin\java.exe"
IF EXIST %JAVABIN% GOTO YESJAVA
SET JAVABIN="%JAVA_HOME%\bin\java.exe"
IF EXIST %JAVABIN% GOTO YESJAVA
echo "Java non trovato"
GOTO END

:YESJAVA
%JAVABIN% -classpath "%BATCHDIR%\locc.jar;%BATCHDIR%\rules.jar" -Dlocc.rules="%BATCHDIR%/rules.lst" locc.Locc %*

:END