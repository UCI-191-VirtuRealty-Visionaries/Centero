@echo off
pushd "%~dp0/.."

echo ============================================================
echo Running Front-end as Local App attached to Production Server
echo ============================================================

pushd "frontend/centero"
call flutter run -d chrome
popd

popd