== README

#Tarefas:
1. Geração do projeto em modo api (rails new VindiApi --api)
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
GET: /api/v1/:id
Request:
	Headers: -
	Body: -
Response:
	Headers:
	Body:
	```json
		{
		  "id": 3,
		  "nome": "nome updated!!!!!!!!",
		  "email": "123@123.123",
		  "endereco": {
		    "id": 6,
		    "cep": "02443-040",
		    "logradouro": "Avenida Lauzane Paulista",
		    "complemento": "",
		    "bairro": "Lauzane Paulista",
		    "localidade": "São Paulo",
		    "uf": "SP",
		    "unidade": "",
		    "ibge": "3550308",
		    "gia": "1004",
		    "created_at": "2016-09-18T14:47:37.676Z",
		    "updated_at": "2016-09-18T14:47:37.676Z",
		    "user_id": 3
		  }
		}
	```

###Update
PATCH /api/v1/:id
Request:
	Headers: -
	Body:
	```json
		{
			"user":{
				"nome": "nome updated!!!!!!!!", 
				"email": "123@123.123", 
				"cep": "02443040" 
			}
		}
	```
Response:
	Headers:
	Body:
	```json
		{
		  "id": 3,
		  "nome": "nome updated!!!!!!!!",
		  "email": "123@123.123",
		  "endereco": {
		    "id": 6,
		    "cep": "02443-040",
		    "logradouro": "Avenida Lauzane Paulista",
		    "complemento": "",
		    "bairro": "Lauzane Paulista",
		    "localidade": "São Paulo",
		    "uf": "SP",
		    "unidade": "",
		    "ibge": "3550308",
		    "gia": "1004",
		    "created_at": "2016-09-18T14:47:37.676Z",
		    "updated_at": "2016-09-18T14:47:37.676Z",
		    "user_id": 3
		  }
		}
	```

###Delete
Delete /api/v1/:id
Request:
	Headers: -
	Body: -
Response: 
	Status: OK
	Body: -

###Create
POST /api/v1/
Request:
	Headers: -
	Body: -
Response: 
	Status: OK
	Body:
	```json
		{
			"user":{
				"nome": "nome updated!!!!!!!!", 
				"email": "123@123.123", 
				"cep": "02443040" 
			}
		}
	```