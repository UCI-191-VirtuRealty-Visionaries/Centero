@echo off
pushd "%~dp0/.."

echo =========================
echo Starting Back-end Locally
echo =========================

pushd "backend/functions"
call npm run serve
popd

popd