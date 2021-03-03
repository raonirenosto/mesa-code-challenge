# Mesa Code Challenge

Implementar API REST que mostre os locais mais próximos do usuário.

## Endpoints

### Criar Usuário
endpoint: POST /api/v1/users

payload request:
```JSON
{
  "email": "seu email aqui",
  "password": "sua senha aqui"
}
```

payload response:
```JSON
{
  "id": 1,
  "email": "email@email.com",
}
```

### Atualizar Usuário
endpoint: PATCH /api/v1/users

payload request:
```JSON
{
  "email": "novo email aqui",
  "password": "nova senha aqui"
}
```
payload response:
```JSON
{
  "id": 1,
  "email": "email@email.com",
}
```

### Logar Usuário
endpoint: POST /api/v1/logins

payload request:
```JSON
{
  "email": "seu email aqui",
  "password": "sua senha aqui"
}
```
payload response:
```JSON
{
  "token": "token_string"
}
```

### Criar Local
endpoint: POST /api/v1/places

payload request:
```JSON
{
  "name": "Burguer King Pato Branco",
  "city": "Pato Branco",
  "country": "Brasil",
  "street": "Rua Caramuru"
}
```
payload response:
```JSON
{
  "id":964681288,
  "name":"Burguer King Pato Branco",
  "country":"Brasil",
  "city":"Pato Branco",
  "street":"Rua Caramuru",
  "latitude":-26.2305449,
  "longitude":-52.6727459
}
```

### Listar Locais
endpoint: GET /api/v1/places

<b>By List</b><br>
/api/v1/places?type=list<br><br>
<b>By Map</b><br>
/api/v1/places?type=map&latitude=-26.233176&longitude=-52.665019
<br>

payload response:
```JSON
[
  {
    "id":213408102,
    "name":"Patão Supermercados",
    "country":"Brasil",
    "city":"Pato Branco",
    "street":"Avenida Tupi",
    "latitude":-26.234552,
    "longitude":-52.671463
    }
    ...
]
```

### Avaliar Local 
endpoint: POST /api/v1/places/[place_id]/reviews

payload request:
```JSON
{
  "rating": 5,
  "comment": "Awesome place"
}
```
payload response:
```JSON
{
  "id":964681288,
  "rating": 5,
  "comment": "Awesome place"
}
```

### Listar Avaliações
endpoint: GET /api/v1/places/[place_id]/reviews

payload response:
```JSON
[
  {
    "id":27797222,
    "rating":1,
    "comment":"Too expensive"
  }
  ...
]
```

## URL Heroku

https://mesa-challenge.herokuapp.com/
