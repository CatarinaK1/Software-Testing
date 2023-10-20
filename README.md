# Software-Testing

This repository is a collection of exercises completed as part of my Software Testing course. 

We've used Python's built-in `unittest` library to demonstrate various unit testing scenarios. To run these tests, make sure you have Python installed. 

## Python Unit Testing:

Python: Ensure you have Python installed on your system. If not, download and install Python from the official website (https://www.python.org/).

unittest Module: Python's unittest module is the built-in testing framework. It does not require a separate installation because it comes with Python.

## Robot Framework:
    
You need to install Robot Framework, which is an open-source test automation framework. To install the Robot framework run the command:
`pip install robotframework`

### Robot Framework for the database testing:
`pip install –U robotframework-databaselibrary`
`pip install pymysql`

### SeleniumLibrary For Web Testing with Robot Framework:
Running this command installs the latest Selenium and Robot Framework versions, but you still need to install browser drivers separately. The --upgrade option can be omitted when installing the library for the first time.
`pip install --upgrade robotframework-seleniumlibrary`
`pip install webdrivermanager`

### Webdriver
Install browser and operating system specific browser drivers for the browser uses in the tests. More information about drivers can be found from Selenium documentation.

To install a browser driver is download the browser driver, these exercises were made utilizing Chrome so it is required to install  `chromedriver`, and place it into a directory that is in PATH. 
Drivers for different browsers can be found via Selenium documentation or by searching the term selenium chrome browser driver. 

You can also use the tool called WebdriverManager which findw the latest version of the webdrivers, then download and link/copy it into right location. 

`pip install webdrivermanager
webdrivermanager chrome --linkpath /usr/local/bin
#Or
webdrivermanager chrome`
  
