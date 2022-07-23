# Dentro da pasta data teremos toda e qualquer função que gere massa de dados para ser utilizada nos testes
# Como exemplo, abaixo temos uma função que gera um usuário para ser usado como massa de dados a ser consumida
# pelo arquivo Services.resource

from faker import Faker
fake = Faker(['pt_BR'])


def factory_user():
    return {
        'name': fake.first_name(),
        'lastname': fake.last_name(),
        'email': fake.free_email(),
        'password': 'abc123'
    }
