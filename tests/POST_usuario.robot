*** Settings ***
Library             SeleniumLibrary    
Resource            ../src/Keywords/Teste-API_KW.robot


*** Test Cases ***
CT001 - Cadastrar um usuario novo com sucesso 
    
    Criar um email, nome e senha aleatorios    
    Cadastrar o email na API     code_desejado=201
    Conferir se o usuario foi cadastrado corretamente

CT002 - Cadastrar um usuario ja existente
    Criar um email, nome e senha aleatorios
    Cadastrar o email na API    code_desejado=201
    Repetir o email cadastrado   
    Verificar se ele da erro