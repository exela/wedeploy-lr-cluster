@echo off

pushd "%~dp0"

path %PATH%;%JAVA_HOME%\bin\
set "PT_OPTS="

for /f tokens^=2-3^ delims^=.-_^" %%j in ('java -fullversion 2^>^&1') do (
	set /a "JAVA_VERSION=%%j%%k"
)
if %JAVA_VERSION% LSS 18 (
	set "PT_OPTS=-XX:MaxPermSize=512m -XX:PermSize=256m"
)

set "PT_OPTS=%PT_OPTS% -Xmx1024m -Xms512m -Dfile.encoding=UTF8"

java %PT_OPTS% -jar lib\patching-tool.jar %*

popd

@echo on