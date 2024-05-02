@echo off
pushd "%~dp0/.."

echo ================================
echo Deploying Front-end as Live Site
echo ================================

echo ===== Build Flutter for Web =====
pushd "frontend/centero"
call flutter build web
popd

echo ===== Deploy to Firebase =====
pushd "frontend"
call firebase deploy --only hosting
popd

popd