@echo off
pushd "%~dp0/.."

echo ==========================
echo Starting Front-end Locally
echo ==========================

pushd "frontend/centero"
call flutter run -d chrome
popd

popd