## Classification Kata

En esta kata hay un [servicio externo](https://classification-kata.herokuapp.com/) que devuelve un JSON:

```
{
   "classification":[
      {
         "name":"Madrid",
         "points":5
      },
      {
         "name":"Valencia",
         "points":10
      },
      {
         "name":"Barcelona",
         "points":7
      },
      {
         "name":"Zaragoza",
         "points":8
      },
      {
         "name":"Bilbao",
         "points":9
      }
   ]
}
```

La kata consiste en hacer un programa que imprima la clasificacion de esas ciudades tal que:

```
indice | ciudad | puntos
1 | Valencia | 10
2 | Bilbao | 9
3 | Zaragoza | 8
4 | Barcelona | 7
5 | Madrid | 5
```

### Endpoints

`/` -> el servicio responde correctamente
`/timeout` -> el servicio responde con un tiempo de respuesta variable
`/failure` -> el servicio responde una de cada tres peticiones con error
