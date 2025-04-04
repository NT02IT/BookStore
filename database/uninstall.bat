@echo off
setlocal

set DB_NAME=bookstore
set DB_USER=root

echo Drop database %DB_NAME%...
mysql -u %DB_USER% -p -e "DROP DATABASE IF EXISTS %DB_NAME%;"

echo Uninstall successful!
pause
