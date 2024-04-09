@echo off
pushd "%~dp0/.."

if [%1] == [] echo [ERROR] Must specify name of deploy channel
if [%1] == [] exit

echo ==================================================
echo Deploying Front-end as Custom Channel on Live Site
echo ==================================================

echo ===== Build Flutter for Web =====
pushd "frontend/centero"
call flutter build web --dart-define=mode=dev
popd

echo ===== Deploy to Firebase =====
pushd "frontend"
call firebase hosting:channel:deploy %1
popd

popd