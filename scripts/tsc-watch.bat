@echo off
pushd "%~dp0/.."

echo =========================
echo Compile Backend on Change
echo =========================

pushd "backend/functions"
call npm run build:watch
popd

popd