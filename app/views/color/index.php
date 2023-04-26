<?php 

if(isset($_GET["url"])){

    $rutas = explode("/", $_GET["url"]);
    print_r($rutas);

}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Color panel</title>
</head>
<body>
    <h1>PARKING</h1>
    <h2>Color</h2>
    <form id="color-form" action="color/create" method="POST">
        <label for="color">Color:</label>
        <input type="text" id="color" name="color">
        <button type="submit">Agregar usuario</button>
    </form>

    <script>

        let colorForm = document.getElementById('color-form');

        colorForm.addEventListener('submit', async function(e){
            // e.preventDefault();
            // console.log('form');
            // let formData = new FormData();
            // let color = document.getElementById('color').value;

            // formData.append('color', color);

            // // Crear una instancia del objeto XMLHttpRequest
            // var xhr = new XMLHttpRequest();

            // // Configurar la solicitud
            // xhr.open('POST', '/color/create');
            // xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

            // // Enviar la solicitud
            // xhr.send('color=' + encodeURIComponent(color));
            // xhr.onload = function() {

            // }
 

        });
    </script>
</body>
</html>