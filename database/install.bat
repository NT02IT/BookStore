@echo off
setlocal

set DB_NAME=bookstore
set DB_USER=root

echo Creating database %DB_NAME%...
mysql -u %DB_USER% -p < .\database\create-database.sql

echo Inserting data into %DB_NAME%...
mysql -u %DB_USER% -p %DB_NAME% < .\database\insert-defaultdata.sql
mysql -u %DB_USER% -p %DB_NAME% < .\database\insert-mockdata.sql

echo Importing all stored procedure in .\database\procedures...

for %%f in (.\database\procedures\*.sql) do (
    echo Importing %%f ...
    mysql -u %DB_USER% -p %DB_NAME% < %%f
)

echo Done!
pause
