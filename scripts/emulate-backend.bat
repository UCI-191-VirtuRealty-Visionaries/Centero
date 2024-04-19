@echo off
pushd "%~dp0/.."

echo ==================================
echo Emulating Back-end as Local Server
echo ==================================

pushd "backend/functions"
call npm run emulate
start cmd /k npm run build:watch
popd

popd