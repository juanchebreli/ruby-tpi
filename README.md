# README

La aplicacion y test se levantan como cualquier aplicacion rails, no tienen agregados

Link de heroku:

  https://salty-beyond-86734.herokuapp.com/

Para realizar los metodos que piden autenticacion es necesario agregar una key Authorization con el value del token de la sesion en los headers


Cuerpos para los post con ejemplos:

  post '/usuarios' y  post '/sesiones'

    {"u":"nombre de usuario", "p":"contraseña"}

    ejemplo:

    {"u":"juanch123", "p":"juanch123"}
  
  post '/cliente'

      {"cuild":"cuild de la persona", "nombre":"nombre","iva":numero del iva,"mail":"mail"}

    ejemplo:

    {"cuild":"20401881445", "nombre":"juan","iva":1,"mail":"juanchebreli@gmail.com"}


  post '/productos'

    {"codigo":"codigo del producto","montoU":"precio unitario del producto", "detalle":"detalle del profucto", "descripcion":"descripcion del producto"}

    ejemplo:

    {"codigo":"4","montoU":"4", "detalle":"guaymallen triple fruta", "descripcion":"alfajor economico triple de fruta"}


  post '/productos/:codigo/items'

      {"cant":cantidad de items a crear}

      ejemplo:

      {"cant":4}

  post '/reservas' y post '/ventas'

      {
        "productos": {
          "codigo del producto": "cantidad de items",
          "codigo del producto": "cantidad de items"
        },
        "cliente_id":"id del cliente"
      }
      {
        "productos": {
          "1": "3",
          "2": "2",
          "3": "1",
        },
        "cliente_id":"1"
      }



sudo git push ruby-tpi master
