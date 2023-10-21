*** Settings ***
Library    DatabaseLibrary
Library    String
Library    Collections
Library    OperatingSystem

*** Variables ***
${dbname}    robodb
${dbuser}    USER
${dbpass}    password
${dbhost}    localhost
${dbport}    6033
${path}    C:\\Users\\YOUR USER\\Documents\\Python\\robot

*** Keywords ***
Make a connection
    [Arguments]    ${dbtoconnect}
    Connect To Database    pymysql    ${dbtoconnect}    ${dbuser}    ${dbpass}    ${dbhost}    ${dbport}

*** Test Cases ***
Create test Database
    Make a connection    mysql
    Execute Sql String    drop database if exists ${dbname};
    Execute Sql String    create database ${dbname};
    Execute Sql String    use ${dbname};

    ${getCommands}=    Get File    ${path}\\create_clauses.txt

    @{CreateCommands}=    Split String    ${getCommands}    ;
    Log    ${CreateCommands}
    ${TableCount}=    Get Length    ${CreateCommands}
    ${IndexToBeRemoved}=    Evaluate    ${TableCount}-1
    Remove From List    ${CreateCommands}    ${IndexToBeRemoved}
    ${TableCount}=    Get Length    ${CreateCommands}

    FOR    ${index}     IN RANGE    ${TableCount}
        Log    ${index} 
        Execute Sql String    ${CreateCommands}[${index}]
        
    END
    Set Global Variable    ${TableCount}


Insert Data into Database
    Make a connection    ${dbname}

    ${getCommands}=    Get File    ${path}\\insert_data_clauses.txt

    @{InsertCommands}=    Split String    ${getCommands}    ;
    Log    ${InsertCommands}

    ${InsertCount}=    Get Length    ${InsertCommands}
    ${IndexToBeRemoved}=    Evaluate    ${InsertCount}-1
    Remove From List    ${InsertCommands}    ${IndexToBeRemoved}
    ${InsertCount}=    Get Length    ${InsertCommands}

    FOR    ${index}     IN RANGE    ${InsertCount}
        Log    ${index} 
        Execute Sql String    ${InsertCommands}[${index}]
        
    END

*** Test Cases ***
Check Tables
    Make a connection    ${dbname}
    ${databaseTables}=    Query    show tables;
    ${countOfTables}=    Get Length    ${databaseTables}

    Should Be Equal    ${countOfTables}    ${TableCount}

    FOR    ${index}    IN RANGE    ${countOfTables}
        Log    ${index}
        ${table}=    Set Variable        ${databaseTables}[${index}]
        ${table}=    Convert To String    ${table}
        ${table}=    Remove String    ${table}    ,    '    (    )
        Log    ${table}
        Table Must Exist    ${table}

        Table Must Exist    ${table}

    END
