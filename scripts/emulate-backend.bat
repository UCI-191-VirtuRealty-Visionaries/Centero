@echo off
pushd "%~dp0/.."

echo ==================================
echo Emulating Back-end as Local Server
echo ==================================

pushd "backend/functions"
call npm run serve
popd

popd