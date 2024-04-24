@echo off
pushd "%~dp0/.."

echo ====================================
echo Saving Firebase Emulator Sample Data
echo ====================================

pushd "backend/functions"
call firebase emulators:export new-export
popd

popd