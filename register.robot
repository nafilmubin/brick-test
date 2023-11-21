*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${baseUrl}      https://qademo.onebrick.io/


*** Test Cases ***
Failed Register due to invalid email
    Open Browser    ${baseUrl}    chrome
    Input Text    id=firstName    aaaaa
    Input Text    id=lastName    Jony
    Input Text    id=email    aaaaa@mail
    Input Text    id=phoneNumber    82222627612
    Input Password    id=password    123123
    Input Password    id=confirm_password    123123
    Click Button    name=register
    Element Text Should Be    id=email-error    Please enter a valid email address.
    Close Browser

Failed Register due to minimum password
    Open Browser    ${baseUrl}    chrome
    Input Text    id=firstName    aaaaa
    Input Text    id=lastName    Jony
    Input Text    id=email    aaaaa@mail.com
    Input Text    id=phoneNumber    82222627612
    Input Password    id=password    123
    Input Password    id=confirm_password    123
    Click Button    name=register
    Element Text Should Be    id=password-error    Please enter at least 6 characters.
    Close Browser

Failed Register due to password not match
    Open Browser    ${baseUrl}    chrome
    Input Text    id=firstName    aaaaa
    Input Text    id=lastName    Jony
    Input Text    id=email    aaaaa@mail.com
    Input Text    id=phoneNumber    82222627612
    Input Password    id=password    123123
    Input Password    id=confirm_password    123
    Click Button    name=register
    Element Text Should Be    id=confirm_password-error    Password need to match
    Close Browser

Failed Register due to required form
    Open Browser    ${baseUrl}    chrome
    Click Button    name=register
    Element Text Should Be    id=firstName-error    Please enter a firstname
    Element Text Should Be    id=lastName-error    Please enter a lastname
    Element Text Should Be    id=email-error    Please provide an email
    Element Text Should Be    id=password-error    Please enter a password
    Element Text Should Be    id=confirm_password-error    Please enter a password
    Close Browser

Failed Register due to email already taken
    Open Browser    ${baseUrl}    chrome
     Input Text    id=firstName    aaaaa
    Input Text    id=lastName    Jony
    Input Text    id=email    aaaaa@gmail.com
    Input Text    id=phoneNumber    82222627612
    Input Password    id=password    123123
    Input Password    id=confirm_password    123123
    Click Button    name=register
    Element Text Should Be   id=swal2-title             Error   
    Element Text Should Be   id=swal2-content           Email has been taken!
      Close Browser

Success Register
    Open Browser    ${baseUrl}    chrome
    Input Text    id=firstName    aaaaa
    Input Text    id=lastName    Jony
    Input Text    id=email    aaaaa@gmail.com
    Input Text    id=phoneNumber    82222627612
    Input Password    id=password    123123
    Input Password    id=confirm_password    123123
    Click Button    name=register
    Element Text Should Be   id=swal2-title             Success    
    Element Text Should Be   id=swal2-content           Check your email to confirm your registration
    Close Browser
