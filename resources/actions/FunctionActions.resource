*** Settings ***
Documentation               Toda funcionalidade no sistema deve ter um arquivo de actions implementando as ações
...                         realizadas no cenário de teste.
...                         Este encapsulamento permite a reutilização de palavras chaves e aumenta a produtividade.
...                         Por exemplo, imagine uma suíte de testes para validar diferentes módulos apresentados de
...                         acordo com o perfil logado, digamos que tenhamos 3 perfis para testar
...                         O ato de acessar a página de login, preencher os campos e submeter o formulário de login
...                         é usado nos testes dos 3 perfis, logo, no arquivo de actions teremos as keywords pra
...                         realizar tais ações (acessar página, preencher form, submeter form), além das outras ações
...                         do cenário de testes, neste exemplo, as ações citadas serão reutilizadas entre os cenários
...                         Precisaríamos apenas chamar as Keywords criadas aqui para utilização na suíte de teste

Resource                    ${EXECDIR}/resources/Base.resource


*** Variables ***
${INPUT_EMAIL}              id=email
${INPUT_PASSWD}             id=password


*** Keywords ***
Go To Login Page
    [Documentation]                     Keyword que acessa a url e valida se o form de login foi apresentado
    Go To                               ${BASE_URL}
    Wait For Elements State             .login-form                 visible         5s

Fill Credentials
    [Documentation]                     Keyword que recebe como parâmetro os dados do usuário e preenche o form de login
    [Arguments]                         ${user}

    Fill Text                           ${INPUT_EMAIL}              ${user}[email]
    Fill Text                           ${INPUT_PASSWD}             ${user}[password]

Submit Credentials
    [Documentation]                     Keyword que realiza o envio do form de login
    Click                               .submit-button >> text=Login
