*** Settings ***
Library            FakerLibrary
*** Keywords ***

get nome
    ${randomName}    FakerLibrary.Name  #Male or Female
    Set Suite Variable    ${randomName}
get email
    ${randomEmail}    FakerLibrary.Email
    Set Suite Variable    ${randomEmail}

get senha
    ${randomPassword}    FakerLibrary.Password
    Set Suite Variable    ${randomPassword}