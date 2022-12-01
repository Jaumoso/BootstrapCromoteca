# TheDeckMerchant
Repositorio para el portal web de cromos TheDeckMerchant. Proyecto de TFG de Jaume Civera.


Paquetes necesarios:
-------------------------------------------------------
npm install bootstrap@4 --save

Incluir las librerías al inicio del index.html, detro de la etiqueta HEAD

 <!-- Required meta tags always come first -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css">
-------------------------------------------------------
npm install lite-server --save

En package.json:

  "scripts": {
    "start": "npm run lite",
    "test": "echo \"Error: no test specified\" && exit 1",
    "lite": "lite-server"
  },
-------------------------------------------------------
npm install popper.js --save
npm install jquery --save

Al final del body:

    <!-- jQuery first, then Popper.js, then Bootstrap JS. -->
    <script src="node_modules/jquery/dist/jquery.slim.min.js"></script>
    <script src="node_modules/popper.js/dist/umd/popper.min.js"></script>
    <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>

-------------------------------------------------------
npm install font-awesome --save

    <link rel="stylesheet" href="node_modules/font-awesome/css/font-awesome.min.css">
--------------------------------------------------------
npm install bootstrap-social --save

 <link rel="stylesheet" href="node_modules/bootstrap-social/bootstrap-social.css">
 ---------------------------------------------------------
 
 npm install less --> For LESS to CSS transformation


