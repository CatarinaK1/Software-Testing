*** Settings ***
Library  String
Library  Dialogs
Library  Telnet
Library  OperatingSystem
Library  Collections
Test Setup    Create Data For Tests


*** Variables ***
${one}  Donald
${two}  Duck
@{list}    1  2  3  4

#Change path to fit your personal user
${FilePath}    C:\\Users\\YOUR USER\\Documents\\RobotTest

*** Keywords ***
#by creating this keyword you can call them in any test case
Create Data For Tests
    @{names}=    Create List    Donald    Mickey    Goofy    Scrooge    Daisy
    Set Test Variable    ${names}

*** Test Cases ***

test1
    Should Be Equal  1  1

*** Test Cases ***
Check outcome
    ${three}=  Set Variable  Donald Duck
    Should Be Equal    ${three}    ${one} ${two}

*** Test Cases ***
Ask User Input
    ${user}=     Get Value From User  Please input your text
    Should Be Equal    ${user}    Hello World

*** Test Cases ***
Check value from list
    ${number}=    Set Variable    ${list}[2]
    Should Be Equal    ${number}    3

*** Test Cases ***
Add value to the list
    @{list}=    Copy List    ${list}
    ${addition}=    Set Variable    333
    Append To List   ${list}    ${addition}
    Log    ${list}
    Should Be Equal    ${list}[4]    ${addition}

*** Test Cases ***
   
Test list length
    ${length}=    Get Length    ${list}
    ${expectedResult}=    Convert To Integer    4
    # Should Be Equal    ${length}    4 this gives an error because the 4 was a String
    Should Be Equal    ${length}    ${expectedResult}

*** Test Cases ***
Put List in alphabetical order
    Log    ${names}
    Sort List    ${names}
    Log    ${names}
    Should Be Equal    ${names}[0]    Daisy
    
*** Test Cases ***
Remove from list Test
    Remove From List    ${names}    0
    Log    ${names}
    Should Be Equal    ${names}[0]    Mickey

*** Test Cases ***
Loop the list
    FOR    ${element}    IN    @{names}
        Log    ${element}
        ${new}=    Set Variable    ${element}
        
    END

*** Test Cases ***
Loop all the numbers
    FOR    ${counter}    IN RANGE    1    10    
        Log    ${counter}
        ${new}=    Set Variable    ${counter}
        
    END

*** Test Cases ***
Make a new directory
    Create Directory    ${FilePath}
    Directory Should Exist    ${FilePath}


*** Test Cases ***
Create a new text file
    ${path}=    Set Variable    ${FilePath}
    Create File    ${path}\\example.text    This is fun!
    File Should Exist    ${path}\\example.text
    File Should Not Be Empty    ${path}\\example.text
    Sleep    4

*** Test Cases ***
Clean files and directory
    ${path}=    Set Variable    ${FilePath}
    Remove File    ${path}\\example.text
    Directory Should Be Empty    ${path}
    Remove Directory    ${path}

*** Test Cases ***
PING web page and read ping time
    ${output}=    Run And Return Rc And Output    ping www.google.com
    Log    ${output}

*** Test Cases ***
Read text from file and find word student
        ${output}=    Get File    ${FilePath}\\example_text.txt
        Log    ${output}
        ${output}=    Remove String    ${output}    .    ,
        @{wordList}=    Split String    ${output}
        Log    ${wordList}
        ${index}=    Get Index From List    ${wordList}    students
        ${expectedResult}=    Convert To Integer    24
        Should Be Equal    ${index}    ${expectedResult}   
