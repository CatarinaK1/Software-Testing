*** Settings ***
Library    String
Library    Collections
Library    OperatingSystem

*** Variables ***

#Set the path. Change the user to suit your needs
${path}=   C:\\Users\\YOUR USER \\Documents\\Python\\robot\\word.txt 

*** Keywords ***
First Word from text
    [Arguments]    ${text}    ${index}
    @{list}=    Split String    ${text}
    ${word}=    Set Variable    ${list}[${index}]
    [Return]    ${word}


*** Test Cases ***
New Text Test
    ${text}=    Set Variable    Red Roses and Blue Sky
    ${word}=    First Word from text    ${text}    0
    Should Be Equal    ${word}    Red 
    Create File    ${path}    ${word}\n

*** Test Cases ***

AnothernText Test
    ${text}=    Set Variable    Red Roses and Blue Sky
    ${word}=    First Word from text    ${text}    3
    Should Be Equal    ${word}    Blue 
    Append To File    ${path}    ${word}\n


*** Test Cases ***
GET IP address
    ${output}=    Run And Return Rc And Output    ipconfig
    @{wordList}=    Split String    ${output}[1]
    Log    ${wordList}
    
    ${index}=    Get Index From List    ${wordList}    Subnet
    ${index}=    Evaluate    ${index}-1
    ${IPAddress}=    Set Variable    ${wordList}[${index}]
    Log    ${IPAddress}