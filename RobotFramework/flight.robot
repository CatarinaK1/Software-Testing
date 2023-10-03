*** Settings ***
Library    SeleniumLibrary
Library    String
## CREATED BY Catarina
*** Variables ***
${departure}=    Boston
${destination}=    Cairo



*** Test Cases ***
Testing flight selection website
    #1 .Go to http://blazedemo.com/
    Open Browser    http://blazedemo.com
    ...    Chrome    options=add_experimental_option("detach", True)   # make sure chrome wont close
     
    Maximize Browser Window
    #2. Test that the page says "Welcome to the Simple Travel Agency!"
    Page Should Contain    Welcome to the Simple Travel Agency!

    #3. Select "Boston" as the starting city 
    Click Element    xpath:/html/body/div[3]/form/select[1] 
    Select From List By Label    name:fromPort    ${departure}
    Log    Departure flight ${departure}    


    #4.Select "Cairo" as the destination 
    Click Element    xpath:/html/body/div[3]/form/select[2]
    Select From List By Label    name:toPort    ${destination}

    
    #5. Check that the Find Flights button is selectable
    Element Should Be Enabled    xpath:/html/body/div[3]/form/div/input
   
    #6. Press the Find Flights button
    Click Element    xpath:/html/body/div[3]/form/div/input



*** Test Cases ***
Test Flight reservation list
   #7. Check that the page says Flights from Boston to Cairo: (check the city names with the variables you created)
   Page Should Contain    Flights from ${departure} to ${destination}:

    
    #8.Check that you have at least one flight choice visible
    ${flights}=  SeleniumLibrary.Get Element Count    xpath: /html/body/div[2]/table
    Should Be True     ${flights} > 0

    
    #9. Select one of the flights -> store the price, number and airline of that flight in separate variables
    ${prices}=    Get Text    xpath:/html/body/div[2]/table/tbody/tr[5]/td[6]
    ${flightNumber}=    Get Text    xpath:/html/body/div[2]/table/tbody/tr[5]/td[2]
    ${airline}=    Get Text    xpath:/html/body/div[2]/table/tbody/tr[5]/td[3]


    #Making them Global variables
    Set Global Variable    \${prices}
    Set Global Variable    ${flightNumber}
    Set Global Variable    ${airline}

    #Access flight purchase page
    Click Element    xpath:/html/body/div[2]/table/tbody/tr[5]/td[1]/input


*** Test Cases ***
Test Flight Purchase Page

    Page Should Contain    Your flight from TLV to SFO has been reserved.

    #10.On the page that opens, check that the price, airline, and flight number of the trip you stored 
    # in the variables can be found on the page 
    # (note that here you need to slightly change the information you export to the variable (String library (?))
   
    ${updatedPrice}=    Get Text    xpath:/html/body/div[2]/p[3]
    ${updateAirline}=    Get Text    xpath:/html/body/div[2]/p[1]
    ${updateNumber}=    Get Text    xpath:/html/body/div[2]/p[2]

    #Remove String
    ${updatedPrice}=    Remove String    ${updatedPrice}    Price:
    ${updateNumber}=    Remove String    ${updateNumber}    Flight Number:
    ${updateAirline}=    Remove String    ${updateAirline}    Airline


    Run Keyword And Continue On Failure    Should Be Equal    ${airline}    ${updateAirline}
    Run Keyword And Continue On Failure    Should Be Equal    ${prices}    ${updatedPrice}
    Run Keyword And Continue On Failure    Should Be Equal    ${flightNumber}    ${updateNumber}

    
    #11.Store the total price of the flight in a new variable
    ${totalPrice}=    Get Text    xpath:/html/body/div[2]/p[5]/em
    Set Global Variable     \${totalPrice}

Test if you can fill information
    #12. Fill in the passenger information on the form 
    Click Element    xpath://*[@id="inputName"]
    Input Text    id:inputName    Cat

    Click Element    xpath://*[@id="address"]
    Input Text    id:address    Kissakatu

    Click Element    xpath://*[@id="city"]
    Input Text    id:city    Hämeenlinna

    Click Element    xpath://*[@id="state"]
    Input Text    id:state    Kantahäme

    Click Element    xpath://*[@id="zipCode"]
    Input Text    id:zipCode    13100
    
    #13. Choose Diner's Club as your credit card
    Click Element    xpath://*[@id="cardType"]
    Select From List By Label    id:cardType    Diner's Club

    Click Element    xpath://*[@id="creditCardNumber"]
    Input Text    id:creditCardNumber    3305566

    #(set the month and year of the card as global variables)
    Click Element    xpath://*[@id="creditCardMonth"]
    Input Text    id:creditCardMonth    11
    ${creditCardMonth}=    Set Variable    11
    Set Global variable    ${creditCardMonth}

    Click Element    xpath://*[@id="creditCardYear"]
    Input Text    id:creditCardYear    2017
    ${creditCardYear}=    Set Variable    2017
    Set Global variable    ${creditCardYear}

    Click Element    xpath://*[@id="nameOnCard"]
    Input Text    id:nameOnCard    Cat MeowMeow

    #14. Click "Remember me"
    Click Element    xpath://*[@id="rememberMe"]

    #15. Click "Purchase Flight"
    Click Element    xpath:/html/body/div[2]/form/div[11]/div/input


Test If Purchase Page was successful
    #16. Check that the page that opens says "Thank you for your purchase today!"
    Page Should Contain    Thank you for your purchase today!

    #17. Check that the expiration time is correct
    ${updateExpiration}=    Get Text    xpath:/html/body/div[2]/div/table/tbody/tr[5]/td[2]

    ${creditCartDate}=    Set Variable    ${creditCardMonth} /${creditCardYear}

    Run Keyword And Continue On Failure    Should Be Equal    ${creditCartDate}  ${updateExpiration}  


    #18. Check that the total price is correct (should be equal with the variable you stored in previous step)
    ${NewTotal}=    Get Text    xpath:/html/body/div[2]/div/table/tbody/tr[3]/td[2]
    ${NewTotal}=    Remove String    ${NewTotal}    USD

    Run Keyword And Continue On Failure    Should Be Equal    ${totalPrice}  ${NewTotal}  


    #19. Close the browser
    Close Browser
