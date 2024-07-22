<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Compra</title>
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
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }
        input[type=text], input[type=tel], input[type=email] {
            width: calc(100% - 20px);
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #444;
            border-radius: 4px;
            font-size: 14px;
            background-color: #333;
            color: #fff;
        }
        input[type=submit] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            display: block;
            width: 100%;
            margin-top: 20px;
        }
        input[type=submit]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Formulario de Compra</h2>
        <form action="eleccion.php" method="post">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required>

            <label for="apellido">Apellido:</label>
            <input type="text" id="apellido" name="apellido" required>

            <label for="telefono">Teléfono:</label>
            <input type="tel" id="telefono" name="telefono" pattern="[0-9]{10}" required>

            <label for="email">Correo Electrónico:</label>
            <input type="email" id="email" name="email" required>

            <label for="numero_cuenta">Número de Cuenta Bancaria:</label>
            <input type="text" id="numero_cuenta" name="numero_cuenta" required>

            <label for="tenis">Tenis a elegir:</label>
            <select id="tenis" name="tenis">
                <option value="Nike Air Max">Nike Air Max</option>
                <option value="Nike React Infinity Run">Nike React Infinity Run</option>
                <option value="Nike Air Force 1">Nike Air Force 1</option>
                <option value="Nike Zoom Pegasus">Nike Zoom Pegasus</option>
                <option value="Nike Joyride Run Flyknit">Nike Joyride Run Flyknit</option>
            </select>

            <input type="submit" value="Confirmar Compra">
        </form>
    </div>
</body>
</html>
