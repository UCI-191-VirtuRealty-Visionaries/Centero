@echo off
cd ..

echo Installing backend resources...
cd ./backend/functions
call npm install
cd ../..

echo Installing frontend resources...
cd ./frontend/centero
call dart pub get
cd ../..

echo Done.
