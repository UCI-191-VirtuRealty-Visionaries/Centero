@echo off
pushd "%~dp0/.."

echo Installing backend resources...
pushd "backend/functions"
call npm install
popd

echo Installing frontend resources...
pushd "frontend/centero"
call dart pub get
popd

echo Done.
popd