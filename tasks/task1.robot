*** Settings ***
Documentation           Tarefas que geralmente são executadas antes da execução dos testes são implementadas aqui
...                     Um exemplo comum é quando podemos realizar a limpeza do banco de dados
...                     antes da execução dos testes
...                     Para execução de tasks geralmente executamos o script sem geração de report
...                     visto que não faremos qualquer validação
...                     robot -l NONE -o NONE -r NONE tasks/task1.robot

Resource                ${EXECDIR}/resources/Base.resource


*** Tasks ***
Database Preparation
    Connect to Base
    Remove Users
    Disconnect from Database
