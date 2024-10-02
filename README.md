# Autentica-o-de-Dois-Fatores-em-Delphi

Desenvolvi uma tela de login utilizando a tecnologia de autenticação em duas etapas (2FA) e um dashboard em Delphi Usando o conceito MVC (View, Model, Controller). O dashboard apresenta um grid com os usuários cadastrados e os dispositivos conectados. As informações são armazenadas e validadas em um banco de dados PostgreSQL, garantindo segurança e integridade dos dados.

## Estrutura do MVC

- **Model**: Representa os dados e as regras de negócio.
- **View**: A interface do usuário, onde as informações são apresentadas.
- **Controller**: A lógica que intermedia a comunicação entre o Model e a View.

## Configurações

### 1. Configuração do Banco de Dados

Para que o sistema funcione corretamente, é necessário configurar a conexão com o banco de dados. Recomenda-se o uso do PostgreSQL.

**Passos para configurar a conexão:**

# 1. Acesse `agendamento.dao.Connection` no seu projeto

# 2. Clique com o botão direito no componente `tfdConnection` (Connection)

# 3. Selecione "Connection Editor"

# 4. Preencha os campos conforme necessário

- **Database**: Nome do banco de dados.
- **User_name**: Nome de usuário para acessar o banco.
- **Password**: Senha do usuário.
- **Server**: Endereço do servidor (use `localhost` se estiver rodando localmente).
- **Port**: Por padrão, utilize `5432`.
**Exemplo de configuração**: No meu exemplo, utilizei `localhost` como servidor, mas você pode especificar outro servidor, se necessário.

# Tables a serem criadas no banco Postgres

# Table Login

```Bash
CREATE TABLE login (
    id SERIAL PRIMARY KEY,
    login VARCHAR(50) NOT NULL,
    senha VARCHAR(255) NOT NULL
);
```

# Table dispositivosconnected

```Bash
CREATE TABLE dispositivosconnected (
    id SERIAL PRIMARY KEY,
    hostname VARCHAR(255) NOT NULL,
    sistema_operacional VARCHAR(255),
    iduser INTEGER,
    email VARCHAR(255)
);
```

# Agora o codigo para criar a Trigger no banco Postgres para alterar o email na table dispositivo quando o email na table login for alterado

```Bash
CREATE OR REPLACE FUNCTION update_email_dispositivos()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE dispositivosconnected
    SET email = NEW.email
    WHERE iduser = NEW.id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
```

```Bash
CREATE TRIGGER trg_update_email
AFTER UPDATE OF email ON login
FOR EACH ROW0
EXECUTE PROCEDURE update_email_dispositivos();
```

## Executando o Projeto
Após configurar a conexão com o banco de dados, você pode executar o sistema de agendamento e começar a utilizá-lo.

## Contribuições
Sinta-se à vontade para contribuir com melhorias ou relatar problemas. Pull requests são bem-vindos!

## Licença
Este projeto está licenciado sob a MIT License. Consulte o arquivo `LICENSE` para mais detalhes.

