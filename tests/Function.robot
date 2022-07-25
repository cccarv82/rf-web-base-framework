*** Settings ***
Documentation                 Test Suite da funcionalidade X
...                           Este é o arquivo executado pelo RF e é onde temos os steps executados
...                           Neste arquivo chamamos as keywords criadas no arquivo de actions para
...                           realização das ações necessárias

Resource                      ${EXECDIR}/resources/Base.resource

Suite Setup                   Start Session
Test Setup                    Go To Login Page
Test Teardown                 After Test


*** Test Cases ***
User Login
    [Documentation]    Test Case para validar a funcionalidade de login no sistema utilizando as
    ...    keywords criadas no arquivo de actions e nos outros arquivos
    ...    de suporte aos testes
    [Tags]                                            positive                                          smoke
    ${user}                                           Factory User                                      login

    Go To Login Page
    Fill Credentials                                  ${user}
    Submit Credentials
    # A validação abaixo realiza uma verificação se o login foi realizado com sucesso
    # Essa ação não está implementada ainda. Aonde deveríamos implementar tal ação ?
    User Should Be Logged In                          ${user}
    Logout

Required Form Fields
    [Documentation]    Este caso de teste realiza duas verificações e utiliza keywords
    ...    que estão implementadas em dois arquivos de Actions diferentes
    [Tags]                                            negative
    @{expected_alerts}                                Create List
    ...                                               E-mail obrigatório
    ...                                               Senha obrigatória

    Go To Login Page
    Submit Credentials
    Alert Spans Should Be                             ${expected_alerts}
