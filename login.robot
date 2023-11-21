*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${baseUrl}   https://qademo.onebrick.io/login


*** Test Cases ***
Success Login
    Open Browser    ${baseUrl}                          chrome
    Input Text      id=your_email                       aaaaa@email.com
    Input Password  id=password                         123123
    Click Button    name=login
    Element Text Should Be   id=swal2-title             Success
    Element Text Should Be   id=swal2-content           Welcome Back, Green Bane Spirit!
    Close Browser

Failed Login due to Email not registered
    Open Browser    ${baseUrl}                          chrome
    Input Text      id=your_email                       aaaaa
    Input Password  id=password                         123123
    Click Button    name=login
    Element Text Should Be   id=swal2-title             Error
    Element Text Should Be   id=swal2-content           Wrong email or password
    Close Browser

Failed Login due to invalid Password
    Open Browser    ${baseUrl}                          chrome
    Input Text      id=your_email                       aaaaa@email.com
    Input Password  id=password                         123
    Click Button    name=login
    Element Text Should Be   id=swal2-title             Error
    Element Text Should Be   id=swal2-content           Wrong email or password
    Close Browser