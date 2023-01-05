*** Settings ***
Library  DatabaseLibrary
Suite Setup       Connect To Database    pymysql    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
Suite Teardown  Disconnect From Database
Library  ../../demo_app/db.py

*** Variables ***
${DBName}=     store
${DBUser}=     root
${DBPass}=       adobe@321$
${DBHost}=      127.0.0.1
${DBPort}=   3306

*** Keywords ***


*** Test Cases ***
Tc-db-test
#    ${results}=     Execute Sql Script      show tables;
#    EXECUTE SQL SCRIPT
#    Table Must Exist        customers
#    log     ${results}

