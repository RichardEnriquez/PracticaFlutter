![logo](https://github.com/RichardEnriquez/PracticaFlutter/blob/master/imagenes/logo.png)

Se tuvo que usar la siguiente librería

```
http: ^0.12.0+4
```

```
import 'package:flutter/material.dart';

import 'package:flutterappapimarvel/model/Characteres.dart';
import 'package:http/http.dart' as http;
```

A continuación explicare brevemente las partes mas importantes del código.

Este es el modelo que se uso para poder parsear el json que nos brinda la api marvel, si uno se quiere ahorrarse la generación de clases adaptados a un json podremos usar la siguiente pagina [Aqui](https://javiercbk.github.io/json_to_dart/)

![image-20200503170435252](https://github.com/RichardEnriquez/PracticaFlutter/blob/master/imagenes/image-20200503170435252.png)

Gracias a la documentación de  [Flutter](https://flutter.dev/docs/cookbook/networking/fetch-data) uno puede saber como funcionan las peticiones http 

![image-20200503171123498](https://github.com/RichardEnriquez/PracticaFlutter/blob/master/imagenes/image-20200503171123498.png)

Y con FutureBuilder uno puede recoger los datos de la solicitud http y saber si esta correcto el parseo de datos.

en snapshot comprobaremos si realmente esta todo correcto

![image-20200503171206495](https://github.com/RichardEnriquez/PracticaFlutter/blob/master/imagenes/image-20200503171206495.png)

![movil1](https://github.com/RichardEnriquez/PracticaFlutter/blob/master/imagenes/movil1.png)

![movil2](https://github.com/RichardEnriquez/PracticaFlutter/blob/master/imagenes/movil2.png)

Para poder lograr una nueva pantalla tuve que averiguar como crear Widget Personalizado:

![image-20200503171959050](https://github.com/RichardEnriquez/PracticaFlutter/blob/master/imagenes/image-20200503171959050.png)

![image-20200503171832319](https://github.com/RichardEnriquez/PracticaFlutter/blob/master/imagenes/image-20200503171832319.png)

![image-20200503171852126](https://github.com/RichardEnriquez/PracticaFlutter/blob/master/imagenes/image-20200503171852126.png)

