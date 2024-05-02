@echo off
pushd "%~dp0/.."

echo ==============================
echo Deploying Back-end as Live API
echo ==============================

echo ===== Run Serve Script =====
pushd "backend/functions"
call npm run deploy
popd

popd