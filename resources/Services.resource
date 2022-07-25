*** Settings ***
Documentation                 Arquivo contendo keywords que conversam com API para utilizar qualquer função disponível
...                           Ex: Caso o sistema disponibilize uma API para cadastro de usuários
...                           Devemos consumir este serviço para cadastrar usuários que sejam necessários aos testes
...                           O objetivo não é validar a API, apenas utilizar o serviço para suportar os testes web

Resource                      Base.resource


*** Variables ***
${API_GATEWAY}                https://api-gateway.sistema.alvo.com


*** Keywords ***
Create User Service
    [Documentation]    Keyword que utiliza a API na rota /user para criar um usuário recuperado da massa de dados
    ${user}                                           Set Variable                                      Factory User
    ${payload}                                        Create Dictionary
    ...                                               email=${user}[email]
    ...                                               password=${user}[password]
    ${response}                                       POST
    ...                                               ${API_GATEWAY}/user
    ...                                               json=${payload}
    RETURN                                          ${response}
