# Cromoteca
> Repositorio para el portal web de cromos Cromoteca. Proyecto de TFG de Jaume Civera.


## Paquetes necesarios y preparación de entorno de trabajo:
-------------------------------------------------------
### Bootstrap 4
```
npm install bootstrap@4 --save
```

Incluir las librerías al inicio del index.html, detro de la etiqueta **HEAD**:

```
    <!-- Required meta tags always come first -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css">
```
-------------------------------------------------------
### Lite Server
```
npm install lite-server --save
```

En package.json:
```
  "scripts": {
    "start": "npm run lite",
    "test": "echo \"Error: no test specified\" && exit 1",
    "lite": "lite-server"
  },
```
Se puede comprobar que el servidor local funciona utilizando el comando **_npm start_**

-------------------------------------------------------
### Componentes extra para Bootstrap
```
npm install popper.js --save
npm install jquery --save
```

Al final de la etiqueta _**BODY**_ añadir:
```
    <!-- jQuery first, then Popper.js, then Bootstrap JS. -->
    <script src="node_modules/jquery/dist/jquery.slim.min.js"></script>
    <script src="node_modules/popper.js/dist/umd/popper.min.js"></script>
    <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
```
-------------------------------------------------------
### Iconos Font Awesome para decoración
```
npm install font-awesome --save
```

Añadir _link_ en la etiqueta _**HEAD**_:
```
<link rel="stylesheet" href="node_modules/font-awesome/css/font-awesome.min.css">
```
--------------------------------------------------------
### Iconos sociales de Bootstrap
```
npm install bootstrap-social --save
```
Añadir _link_ en la etiqueta _**HEAD**_:
```
 <link rel="stylesheet" href="node_modules/bootstrap-social/bootstrap-social.css">
 ```
 ---------------------------------------------------------
 ### Añadir módulo SCSS de preprocesado de CSS
```
npm install node-sass --save-dev    --> For LESS to CSS transformation
```

Crear nuevo script en package.json:
```
  "scripts": {
    "start": "npm run lite",
    "test": "echo \"Error: no test specified\" && exit 1",
    "lite": "lite-server",
    "scss": "node-sass -o css/ css/"
  },
```
  ----------------------------------------------------------
### Módulos para compilar SCSS y actualizar la página automáticamente
```
npm install --save-dev onchange@3.3.0
npm install --save-dev parallelshell@3.0.1 
```

Añadir y cambiar los scripts en package.json:
```
  "scripts": {
    "start": "npm run watch:all",
    "test": "echo \"Error: no test specified\" && exit 1",
    "lite": "lite-server",
    "scss": "node-sass -o css/ css/",
    "watch:scss": "onchange \"css/*scss\" -- npm run scss",
    "watch:all": "paralellshell \"npm run watch:scss\" \"npm run lite\""
  },
```

Ahora al ejecutar el comando _**npm run watch:all**_ se ejecutará el servidor _lite server_
y se actuaizará automaticamente el CSS cada vez que se modifique la hoja de estilos SCSS.

------------------------------------------------------------ 
  ##DEPLOYMENT
--------------------------------------------------------------
### Módulo para limpiar carpetas

Para limpiar la carpeta de distribución _dist_:
```
npm install rimraf@2.6.2 --save-dev
```
Actualizamos los scripts en package.json:
```
  "scripts": {
    "start": "npm run watch:all",
    "test": "echo \"Error: no test specified\" && exit 1",
    "lite": "lite-server",
    "scss": "node-sass -o css/ css/",
    "watch:scss": "onchange \"css/*scss\" -- npm run scss",
    "watch:all": "parallelshell \"npm run watch:scss\" \"npm run lite\" ",
    "clean": "rimraf dist"
  },
  ```
-----------------------------------
### Módulo para copiar archivos

Módulo para copiar archivos de una carpeta a otra. Se utilizará para copiar las _fonts_ a la carpeta _dist_.

```
npm install copyfiles@2.0.0 --global
```

Actualizamos package.json:
```
  "scripts": {
    "start": "npm run watch:all",
    "test": "echo \"Error: no test specified\" && exit 1",
    "lite": "lite-server",
    "scss": "node-sass -o css/ css/",
    "watch:scss": "onchange \"css/*scss\" -- npm run scss",
    "watch:all": "parallelshell \"npm run watch:scss\" \"npm run lite\" ",
    "clean": "rimraf dist",
    "copyfonts": "copyfiles -f node_modules/font-awesome/fonts/* dist/fonts" 
  },
  ```
  ---------------------------------------------------
  ### Módulo de compresión de imagenes
```
npm install imagemin-cli@3.0.0 --global
```

Actualizamos package.json:
```
  "scripts": {
    "start": "npm run watch:all",
    "test": "echo \"Error: no test specified\" && exit 1",
    "lite": "lite-server",
    "scss": "node-sass -o css/ css/",
    "watch:scss": "onchange \"css/*scss\" -- npm run scss",
    "watch:all": "parallelshell \"npm run watch:scss\" \"npm run lite\" ",
    "clean": "rimraf dist",
    "copyfonts": "copyfiles -f node_modules/font-awesome/fonts/* dist/fonts",
    "imagemin": "imagemin img/* -o dist/img"
  },
  ```
 -----------------------------------------------------------------
### Módulo para juntar todos archivos a la hora de crear el paquete de despliegue
```
npm install usemin-cli@0.5.1 --save-dev
```
Y sus dependencias:
```
npm install cssmin@0.4.3 --save-dev
npm install uglifyjs@2.4.11 --save-dev
npm install htmlmin@0.0.7 --save-dev
```

Para que los archivos se junten en uno solo, hay que añadir declaraciones rodeando el código. 

Para el CSS, añadir en **todos** los archivos _**HTML**_, en la etiqueta **HEAD**:
```
<!-- build:css css/main.css -->

... links

<!-- endbuild -->
```

Quedando tal que así:
```
    <!-- Bootstrap CSS -->
    <!-- build:css css/main.css -->
    <link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="node_modules/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="node_modules/bootstrap-social/bootstrap-social.css">
    <link rel="stylesheet" href="css/styles.css">
    <!-- endbuild -->
```

Para JavaScript, añadir en **todos** los archivos _**HTML**_:
```
<!-- build:js js/main.js -->

... scripts

<!-- endbuild -->
```

Quedando tal que así:
```
    <!-- jQuery first, then Popper.js, then Bootstrap JS. -->
    <!-- build:js js/main.js -->
    <script src="node_modules/jquery/dist/jquery.slim.min.js"></script>
    <script src="node_modules/popper.js/dist/umd/popper.min.js"></script>
    <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="./js/scripts.js"></script>
    <!-- endbuild -->
```

Creamos los scripts que faltan: _usemin_ y _build_.
```
  "scripts": {
    "start": "npm run watch:all",
    "test": "echo \"Error: no test specified\" && exit 1",
    "lite": "lite-server",
    "scss": "node-sass -o css/ css/",
    "watch:scss": "onchange \"css/*scss\" -- npm run scss",
    "watch:all": "parallelshell \"npm run watch:scss\" \"npm run lite\" ",
    "clean": "rimraf dist",
    "copyfonts": "copyfiles -f node_modules/font-awesome/fonts/* dist/fonts",
    "imagemin": "imagemin img/* -o dist/img",
    "usemin": "usemin contactus.html -d dist --htmlmin -o dist/contactus.html && usemin aboutus.html -d dist --htmlmin -o dist/aboutus.html && usemin index.html -d dist --htmlmin -o dist/index.html",
    "build": "npm run clean && npm run copyfonts && npm run imagemin && npm run usemin"
  },
  ```
  
  Con el comando _**npm run build**_, se creará la carpeta _dist_ con todo lo necesario para desplegar la página web en un servidor.

