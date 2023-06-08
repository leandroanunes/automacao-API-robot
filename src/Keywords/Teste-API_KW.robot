*** Settings ***
Library          requests
Library          String
Library          RequestsLibrary
Library          XML

*** Keywords ***

criar um ${email}
    ${palavra_aleatoria}    Generate Random String   length=4    chars=[letters]
    Set Test Variable    ${email}    ${palavra_aleatoria}@emailteste.com
    Log To Console    email aleatorio: ${email}

cadastrar o ${email} na API
    ${body}    Create Dictionary    
    ...    nome=Leandro Nunes    
    ...    email=${email}    
    ...    password=123senha   
    ...    administrador=${True}

criar sessao para a ServeRest    
    Create Session    alias=ServeRest    url