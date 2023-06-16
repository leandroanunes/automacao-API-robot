*** Settings ***
Library             SeleniumLibrary    
Resource            ../src/Keywords/Teste-API_KW.robot



*** Test Cases ***
CT001 - GET/usuario/id
    Criar um email, nome e senha aleatorios
    Cadastrar o email na API    code_desejado=201
    # Consultar os dados do novo usuario