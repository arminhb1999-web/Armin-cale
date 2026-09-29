@echo off
setlocal
set GRADLE_VERSION=8.2.1
where gradle >nul 2>nul
if %ERRORLEVEL% EQU 0 (
  gradle %*
  exit /b %ERRORLEVEL%
)
set DIST_DIR=%USERPROFILE%\.gradle\wrapper\dists\gradle-%GRADLE_VERSION%-bin
if exist "%DIST_DIR%\gradle-%GRADLE_VERSION%\bin\gradle.bat" (
  call "%DIST_DIR%\gradle-%GRADLE_VERSION%\bin\gradle.bat" %*
  exit /b %ERRORLEVEL%
)
echo Gradle %GRADLE_VERSION% is not installed. Please open AndroidIDE/Android Studio and run Gradle Sync, or install Gradle %GRADLE_VERSION%.
exit /b 1
