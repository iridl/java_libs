@echo off

set JAVA_HOME
if ERRORLEVEL = 1 (
  set JAVA_HOME=C:\Program Files\Java\jdk1.6.0
) else (
  echo %JAVA_HOME% | findstr ^\"
  if ERRORLEVEL=1 set JAVA_HOME="%JAVA_HOME%"
)

goto :continue2
if exist %JAVA_HOME%\bin\java.exe goto :continue2

echo ERROR: java.exe does not exist at this location: %JAVA_HOME%\bin\
echo Aborting... Please, set a valid path in JAVA_HOME environment variable, in the SETVARS script or elsewhere.
goto :end

:continue2

set CP_TESTS=
for %%j in (ext\*.jar lib\*.jar) do call :addjar %%j

goto :end

:addjar
set CP_TESTS=%CP_TESTS%"%cd%\%1";
goto :end

:end
