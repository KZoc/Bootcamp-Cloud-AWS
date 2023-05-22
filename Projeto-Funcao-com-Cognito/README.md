# Projeto Prático - Utilizando os serviços Amazon Cognito, DynamoDB, API Gateway e AWS Lambda

## Minhas etapas de criação:

- Criei uma tabela no DynamoDB chamada "Tabela_Cognito_Manual", com dois campos um "id" e "price", apenas para teste.
- Depois criei minha Função Lambda em Python, para inserir itens na tabela. Para isso atribuí a ela, através de uma permissão inline, o acesso a tabela ("Tabela_Cognito_Manual").
- Depois criei uma REST API no API Gateway, dentro dessa API, criei um Recurso. Com o diretório do recurso selecionado fui em Criar Método, e criei um método POST. Integrei o método POST à função lambda criada, sendo importante que, nas etapas de configuração o box "Use Lambda Proxy integration" deve ser selecionado, assim como, a região deve ser a mesma da que a função foi criada.
-  Fiz o deploy do método da API Gateway.
-  Agora, abri o POSTMAN e testei a API utilizando a URL invoke (endpoint) que foi gerada na etapa anterior.

## Configurando o Cognito:

-  Entrei no Cognito e criei uma User Pool, onde os parâmetros de login seriam os mais básicos (para fins de teste).
-  Configurei meu App Client e alguns dos parâmetros são importantes ativar para depois testar no POSTMAN, que são:

Tipos de concessão do OAuth:

  - Concessão de código de autorização
  - Concessão implícita
  
Escopos de conexão OpenID:
  - email
  - openid
 
- Uma vez criado o App Client, copiei e guardei seu id de acesso, a URL de Callback e a URL de login criada ao criar a User Pool.

## Agora no POSTMAN:

- Criei uma request do tipo GET, para obter o token de acesso.
- Em "Authorization", selecionei o tipo como "OAuth 2.0".
- Em "Configure New Token" preenchi os campos da seguinte forma:
  - Token Name: TokenTeste1
  - Grant Type: Implicit
  - Callback URL: Colei a URL criada
  - Auth URL: Colei a URL criada e ao final acrescentei "/login"
  - Client ID: Colei o client id que salvei antes
  - Scope: Digitei "email openid"
  - Client Authentication: "Send client credentials in body"
  - Ao fim da página cliquei no botão "Get New Access Token"

- Abrirá uma página de login, onde primeiro, fiz o cadastro com um email válido, e tive de autenticar o email com o código que o Cognito enviou para o meu email.

- Novamente cliquei no botão  "Get New Access Token" e preenchi com os dados para login.
- Como retorno abriu uma janela com o token de acesso para o usuário.
- Para usar o token criei outra request no POSTMAN, sendo esta do tipo POST.
- Em "Authorization" selecionei "Bearer Token" e colei o token que foi gerado.
- Em "Body" -> "raw" -> "JSON": Digitei o que era para ser inserido na tabela:
  - {"id":"021", "price":21000}

- Abaixo apareceu o texto: "Item inserido com sucesso!"
- Para confirmar foi no DynamoDB, entrei na tabela que deveria receber o item e cliquei para listar itens, e lá estava o item inserido.
