*** Settings ***
Library    String
Library    Collections
Library    OperatingSystem
Library    Process
Library    Dialogs

## MADE BY : Catarina Kaucher

##TASK
#1. Read the webpages.txt information using Robot Framework 
# into a variable.


*** Test Cases ***
Read the file into a variable
    #Get file
    ${webpage}    Get File     C:\\Users\\catit\\Documents\\Python\\robot\\webpages.txt

    #Create list
    @{address}=    Split String    ${webpage}

    Log    ${address}
    Log    ${webpage}


    #Set Global variables
    Set Global Variable    ${webpage}
    Set Global Variable    ${address}


#2. Ping each address found in the text file. 4

#3. Use RF to capture the IP and ping time of each pinged site. 
# Test that the time taken for Ping is less than 50ms.

#4. Create a new txt-file in which you enter the IP address of 
# the pinged site and the average ping- time for the site.

*** Test Cases ***
Ping each address found in the text file
    #Create empty file
    ${TestFile}=    Set Variable    C:\\Users\\catit\\Documents\\Python\\robot
    Create File    ${TestFile}\\testPing.txt
    
    # Get the number of addresses in the list
    ${length}=    Get Length    ${address}

    # Loop through each address index
    FOR    ${index}    IN RANGE  ${length}

        ${output}=    Run And Return Rc And Output    ping ${address}[${index}] -n 4
       
        # Split the ping output into a list
        @{pingList}=    Split String    ${output}[1]
        
        Log    ${pingList}
        # Get the index of the line where we find IP Address and Average Location  
        ${pingIndex}=    Get Index From List    ${pingList}    Pinging 
        ${averageIndex}=    Get Index From List    ${pingList}    Average
        
        #Get the values we are looking for 
        ${averageIndex}=    Evaluate    ${averageIndex}+2
        ${pingIndex}=     Evaluate    ${pingIndex}+2

        #Save them into a variable
        ${IpAddressList}=    Set Variable    ${pingList}[${pingIndex}]
        ${AverageList}=    Set Variable    ${pingList}[${averageIndex}]
        
        #Debugging
        Log    ${averageIndex}
        Log    ${pingIndex}

        # Test that the time taken for Ping is less than 50ms.
        #Convert Value to int for comparison
        ${AverageNumber}=    Convert To Number    ${AverageList}[:-2]
        
        #Compare values
        Should Be True    ${AverageNumber}< 50.0
        
        #Debug
        Log    ${AverageNumber}

        Append To File    ${TestFile}\\testPing.txt    IP Address: ${IpAddressList}, Average Time: ${AverageList}\n
    END

   
    