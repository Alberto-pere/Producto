<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Elección de Tenis</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #000;
            color: #fff;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 100%;
            max-width: 500px;
            background-color: #222;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        h2 {
            margin-bottom: 20px;
        }
        p {
            font-size: 18px;
            margin-bottom: 30px;
        }
        .tenis-img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            margin-top: 15px;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
        }
        .back-link a {
            color: #fff;
            text-decoration: none;
            border-bottom: 1px solid #fff;
            transition: border-color 0.3s ease;
        }
        .back-link a:hover {
            border-color: transparent;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Elección de Tenis</h2>
        <?php
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $nombre = $_POST['nombre'];
            $apellido = $_POST['apellido'];
            $telefono = $_POST['telefono'];
            $email = $_POST['email'];
            $numero_cuenta = $_POST['numero_cuenta'];
            $tenis_elegido = $_POST['tenis'];
            $imagen_tenis = '';

            switch ($tenis_elegido) {
                case 'Nike Air Max':
                    $imagen_tenis = 'img/img_1.jpg';
                    break;
                case 'Nike React Infinity Run':
                    $imagen_tenis = 'img/img_2.jpg';
                    break;
                case 'Nike Air Force 1':
                    $imagen_tenis = 'img/img_3.jpg';
                    break;
                case 'Nike Zoom Pegasus':
                    $imagen_tenis = 'img/img_4.jpg';
                    break;
                case 'Nike Joyride Run Flyknit':
                    $imagen_tenis = 'img/img_5.jpg';
                    break;
                default:
                    $imagen_tenis = '';
                    break;
            }

            if (!empty($imagen_tenis)) {
                echo "<img src='$imagen_tenis' class='tenis-img' alt='Imagen de Tenis'>";
            }

            echo "<p>Su par de tenis ha sido elegido: <strong>$tenis_elegido</strong></p>";
            echo "<p>Usted, $nombre $apellido, HIZO UNA MUY BUENA COMPRA.</p>";
        } else {
            echo "<p>No se recibieron datos del formulario. Por favor, complete el formulario.</p>";
        }
        ?>
        <div class="back-link">
            <a href="index.php">Volver al Formulario</a>
        </div>
    </div>
</body>
</html>
