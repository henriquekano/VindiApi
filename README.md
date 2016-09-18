#Environment
db: Sqlite, os: windows 7, ruby: 2.2.4p230, rails: 4.2.5.1

#Tarefas:
1. Geração do projeto em modo api (rails new VindiApi)
2. Criação dos models (User e Endereços)
3. Teste dos models (validações)
4. Criação do ApiController
5. Criação do UserController
6. CRUD Rest apenas com o model User
7. Teste do CRUD de Users
8. Integração com Viacep
9. Integração do model de Enderecos no CRUD
10. Teste do controller com o CRUD finalizado (com Viacep e endereços)

#Uso
###Show
>GET /api/v1/users/:id

Response:
```javascript
{
  "id": 8,
  "nome": "nome!!!!!!!!",
  "email": "1243@123.123",
  "endereco": {
    "id": 11,
    "cep": "02443-040",
    "logradouro": "Avenida Lauzane Paulista",
    "complemento": "",
    "bairro": "Lauzane Paulista",
    "localidade": "São Paulo",
    "uf": "SP",
    "unidade": "",
    "ibge": "3550308",
    "gia": "1004",
    "created_at": "2016-09-18T19:14:15.375Z",
    "updated_at": "2016-09-18T19:14:15.375Z",
    "user_id": 8
  }
}
```

###Delete
>DELETE /api/v1/users/:id

###Create
>POST /api/v1/users

Request:
```javascript
{
	"user":{
		"nome": "nome!!!!!!!!", 
		"email": "123@123.123", 
		"cep": "06350270" 
	}
}
```

Response:
```javascript
{
    "id": 8,
    "nome": "nome!!!!!!!!",
    "email": "1243@123.123",
    "endereco": {
        "id": 11,
        "cep": "02443-040",
        "logradouro": "Avenida Lauzane Paulista",
        "complemento": "",
        "bairro": "Lauzane Paulista",
        "localidade": "São Paulo",
        "uf": "SP",
        "unidade": "",
        "ibge": "3550308",
        "gia": "1004",
        "created_at": "2016-09-18T19:14:15.375Z",
        "updated_at": "2016-09-18T19:14:15.375Z",
        "user_id": 8
    }
}
```

###Update
>PATCH /api/v1/users/:id

Request:
```javascript
{
	"user":{
		"nome": "nome!!!!!!!!", 
		"email": "123@123.123", 
		"cep": "06350270" 
	}
}
```

Response:
```javascript
{
    "id": 8,
    "nome": "nome!!!!!!!!",
    "email": "1243@123.123",
    "endereco": {
        "id": 11,
        "cep": "02443-040",
        "logradouro": "Avenida Lauzane Paulista",
        "complemento": "",
        "bairro": "Lauzane Paulista",
        "localidade": "São Paulo",
        "uf": "SP",
        "unidade": "",
        "ibge": "3550308",
        "gia": "1004",
        "created_at": "2016-09-18T19:14:15.375Z",
        "updated_at": "2016-09-18T19:14:15.375Z",
        "user_id": 8
    }
}
```
