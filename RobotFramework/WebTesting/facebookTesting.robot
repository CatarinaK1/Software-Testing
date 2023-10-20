*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Facebook register
    Open Browser    https://www.facebook.com/r.php    
    ...    Chrome    options=add_experimental_option("detach", True)   # make sure chrome wont close
        

    Maximize Browser Window
    

    Click Element    xpath://button[@title='Allow all cookies']
       
    Page Should Contain    Create a new account

    Click Element    name:firstname
    Input Text    name:firstname    Cat

    Click Element    name:lastname    
    Input Text    name:lastname    Meow

    Click Element    name:reg_email__
    Input Text    name:reg_email__    cat@gmail.com

    Click Element    name:reg_email_confirmation__
    Input Text    name:reg_email_confirmation__    cat@gmail.com

    Click Element    name:reg_passwd__    
    Input Password    name:reg_passwd__    Meow

    #dropdown input
    Click Element    id:month
    Select From List By Label    id:month    Apr

    Click Element    id:day
    Select From List By Label    id:day    27

    
    Click Element    id:year
    Select From List By Label    id:year    1999

    #radio buttons
    Select Radio Button    sex    1

    #screenshow
    Set Screenshot Directory    C:\\Python_excercise\\robot_framework      
    Capture Page Screenshot    screen.png

    Close Browser



*** Test Cases ***
NYTimes
    Open Browser    https://www.nytimes.com   
    ...        Chrome     options=add_experimental_option("detach", True)
    Maximize Browser Window
    Click Button    xpath:/html/body/div[3]/div/button
    Click Button    xpath://button[@data-testid='GDPR-accept']


 #counting elements in the webpage's header navigation menu.
    ${count} =     Get Element Count    
    ...     /html/body/div[1]/div[2]/div/header/div[4]/ul/li[*]/a
    ${referencePosition} =     Get Vertical Position    
    ...    xpath:/html/body/div[1]/div[2]/div/header/div[4]/ul/li[1]/a
    
    
    FOR    ${index}    IN RANGE    2    ${count}
        Log    ${index}
        ${testPosition} =     Get Vertical Position    
    ...    xpath:/html/body/div[1]/div[2]/div/header/div[4]/ul/li[${index}]/a
    Should Be Equal    ${referencePosition}    ${testPosition}    
    END

  Close Browser
