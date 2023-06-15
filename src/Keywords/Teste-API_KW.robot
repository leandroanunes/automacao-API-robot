*** Settings ***
Library          Collections
Library          String
Library          RequestsLibrary
Library          FakerLibrary
Resource         ../SharedKW_API.robot
Resource         ../Variable.robot

*** Keywords ***
Criar um email, nome e senha aleatorios
    [Documentation]    Apenas cria um email, nome e senha aleatorios em variaveis globais
    get email
    get nome
    get senha
Criar sessao para a ServeRest    
    [Documentation]    Cria o header
    ...                Cria a sessao com o link da API
    
    &{headers}    Create Dictionary    accept=application/json    Content-Type=application/json
    Create Session                     alias=ServeRest            url=https://serverest.dev           headers=${headers}
    Set Suite Variable    ${headers}


Cadastrar o email na API
    [Arguments]    ${code_desejado}
    [Documentation]    Adiciona o dicionario do Body
    ...                Chama a keyword de Criar sessao
    ...                E busca a resposta que aparece no final
    ...    
    ${body}    Create Dictionary       nome=${randomName}         email=${randomEmail}        password=${randomPassword}    administrador=true
    criar sessao para a ServeRest
    ${resposta}    POST On Session     alias=ServeRest            url=/usuarios               json=${body}                  headers=${headers}    expected_status=${code_desejado}
    Log    ${resposta.json()}
    Set Global Variable    ${conferirResposta}    ${resposta.json()}

Conferir se o usuario foi cadastrado corretamente
    Dictionary Should Contain Item    ${conferirResposta}    message    Cadastro realizado com sucesso
    Dictionary Should Contain Key     ${conferirResposta}    _id

Repetir o email cadastrado
    Cadastrar o email na API       code_desejado=400

Verificar se ele da erro
    Dictionary Should Contain Item    ${conferirResposta}    message    Este email já está sendo usado