@echo off
pushd "%~dp0/.."

echo =============================================
echo Emulating Front-end for use with Local Server
echo =============================================

pushd "frontend/centero"
call flutter run -d chrome --dart-define=mode=dev
popd

popd