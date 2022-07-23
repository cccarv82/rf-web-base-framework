*** Settings ***
Documentation               Qualquer Keyword que seja criada para servir de helper aos casos de testes
...                         deve ser criada neste arquivo

Resource                    Base.resource


*** Keywords ***
Do Login
    [Documentation]             Exemplo de funcionalidade que serve como helper para outros casos de teste
    ...                         Em um sistema que precisamos realizar login pra fazer diversas tarefas
    ...                         podemos implementar o login no Helper e utilizar nos cenários que precisam
    ...                         desta funcionalidade
    ...                         ATENÇÃO: não é o objetivo aqui testar o login, apenas utilizar tal funcionalidade
    [Arguments]                 ${user}

    Go To Login Page
    Fill Credentials            ${user}
    Submit Credentials
    User Should Be Logged In    ${user}
