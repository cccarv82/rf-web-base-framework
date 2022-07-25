*** Settings ***
Documentation                 Arquivo com as configurações base do projeto
...                           Todas as importações de bibliotecas e recursos devem ser feitas neste arquivo
...                           O arquivo Base.robot deve ser importado nos arquivos que precisarem de alguma biblioteca
...                           ou recurso adicional

# Importação de bibliotecas padrões
Library                       Browser
Library                       RequestsLibrary
Library                       factories/TestData.py
Library                       Utils.py
# Importação dos recursos (actions)
Resource                      actions/_SharedActions.resource
Resource                      actions/FunctionActions.resource
Resource                      Helpers.resource
Resource                      Services.resource


*** Variables ***
${BASE_URL}                   https://sistema.alvo.com


*** Keywords ***
Start Session
    [Documentation]    Implementação da inicialização do navegador utilizando a biblioteca Browser
    New Browser
    ...                                               ${BROWSER}
    ...                                               headless=${HEADLESS}
    ...                                               slowMo=00:00:00
    New Page                                          ${BASE_URL}
    Set Viewport Size                                 1280                                              768

After Test
    [Documentation]    Finalização do caso de teste capturando screenshot
    # Fix #3 para o relatório conter os screenshots quando executado em paralelo
    ${screenshot_name}                                Screenshot Name
    Take Screenshot
    ...                                               fullPage=True
    ...                                               filename=${screenshot_name}
