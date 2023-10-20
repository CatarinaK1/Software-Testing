*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Test 1
    Open Browser    https://www.google.com    Chrome
    Maximize Browser Window
    Sleep    2s

*** Test Cases ***
Test 2
    Open Browser    https://www.google.com    Firefox    service_log_path=${{os.path.devnull}}
    Maximize Browser Window
    Sleep    2s


*** Test Cases ***
Open Google search bar to search word cat and count searched elements
    #Open google page and check that Cookie window comes

    Open Browser    https://www.google.com     Chrome    options=add_experimental_option("detach", True)   # make sure chrome wont close
    Maximize Browser Window
    Page Should Contain    Accept all


    #Accept cookies and check that search is available
    Click Element    id:L2AGLb
    Page Should Contain    Google search



    #Try to insert search text into search bar
    Click Element    name:q
    Input Text    name:q    cat

    # Try to click search button
    Click Button    xpath:/html/body/div[1]/div[3]/form/div[1]/div[3]/center/input[1]

    #Try to count results of search
    Wait Until Page Contains    People also search for
    ${count}=    Get element count    xpath:/html/body/div[8]/div/div[10]/div[1]/div[2]/div[2]/div/div/div[*]/div
    #${expected}=    Convert to integer    11
    #Should be Equal    ${count}    ${expected}
    Should Be Equal    ${count}    ${11}

    Close Browser