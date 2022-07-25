*** Settings ***
Documentation                 Keywords que servem para utilizar algo no sistema que se repete em diversas funcionalidades
...                           Ex: Imagine um sistema onde diversas ações gerem modals de alerta com mensagens de
...                           sucesso, erro, alerta e etc
...                           Criamos neste arquivo as validações destas modals e utilizamos nos casos de testes

Resource                      ${EXECDIR}/resources/Base.resource


*** Keywords ***
Alert Spans Should Be
    [Documentation]    Imagine um módulo de span que o desenvolvedor reutilizou pra apresentar
    ...    mensagens de validação no sistema. Com o código de exemplo abaixo
    ...    podemos validar por exemplo, mensagens de um formulário que sejam customizadas
    ...    para cada campo. Ex: Campo de nome obrigatório e campo de telefone obrigatório
    ...    cada um com sua mensagem.
    ...    Na validação do campo de nome chamamos a keyword passando a mensagem de validação
    ...    do campo nome e na validação do campo telefone é a mesma ideia mudando a mensagem.
    [Arguments]                                       ${expected_alerts}
    @{got_alerts}                                     Create List
    ${spans}                                          Get Elements
    ...                                               span[class=error]

    FOR    ${span}    IN    @{spans}
        ${text}                                           Get Text                                          ${span}
        Append To List                                    ${got_alerts}                                     ${text}
    END

    Lists Should Be Equal                             ${expected_alerts}                                ${got_alerts}
