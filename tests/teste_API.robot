*** Settings ***
Library             SeleniumLibrary    
Resource            ../src/Keywords/Teste-API_KW.robot
Resource            ../src/Data/API_Variables.robot



*** Test Cases ***
CT001 - Cadastrar um usuario novo com sucesso na ServeRest
    criar um ${emailAleatorio}
    cadastrar o ${emailAleatorio} na API
    # conferir se o ${usuarioValido} foi cadastrado corretamente