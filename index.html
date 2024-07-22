<!DOCTYPE html>
<html>

<head>
  <title>Nuestro Repositorio</title>
</head>

<body>

  <h1>Bienvenidos a Nuestro Repositorio</h1>
  <h2>Integrantes:</h2>

  <p>Estefany Daniela Hernandez Rodriguez UTP0150453</p>
  <p>Alberto Perez Garcia UTP0153616</p>
  <p>Andrea Limon Perez UTP0147297</p>
  <p>Diego Arath Ramos Pérez UTP0145962</p>


  <a href= "Trabajo.html"> Trabajo Beto </a>
  <a href= "diego.html"> Trabajo Diego </a>



<?php
// Configuración de la conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "login2";

// Crear conexión utilizando consultas preparadas para evitar la inyección SQL
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Verificar si se ha enviado el formulario de inicio de sesión
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['login'])) {
    // Verificar reCAPTCHA
    $recaptcha_secret = "6LcNmnYpAAAAADSttd_AoPOvTgj_OLX2Pofw9JzH";
    $recaptcha_response = $_POST['g-recaptcha-response'];
    $recaptcha = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=$recaptcha_secret&response=$recaptcha_response");
    $recaptcha_result = json_decode($recaptcha);
    
    if ($recaptcha_result->success) {
        // Utilizar consultas preparadas para evitar la inyección SQL
        $usuario = $_POST['usuario'];
        $contraseña = $_POST['contraseña'];

        // Consulta SQL preparada para verificar las credenciales del usuario
        $sql = "SELECT * FROM usuarios WHERE usuario=?";

        // Preparar la consulta
        $stmt = $conn->prepare($sql);
        
        // Vincular los parámetros
        $stmt->bind_param("s", $usuario);
        
        // Ejecutar la consulta
        $stmt->execute();
        
        // Obtener el resultado de la consulta
        $result = $stmt->get_result();

        if ($result->num_rows == 1) {
            // Obtener la fila de resultados como un array asociativo
            $row = $result->fetch_assoc();

            // Verificar si la contraseña proporcionada coincide con alguna de las técnicas de hash almacenadas en la base de datos
            if (password_verify($contraseña, $row['contraseña']) || 
                md5($contraseña) == $row['contraseña'] ||
                hash('crc32', $contraseña) == $row['contraseña'] ||
                hash('ripemd160', $contraseña) == $row['contraseña'] ||
                sha1($contraseña) == $row['contraseña']) {
                // Iniciar sesión
                session_start();
                $_SESSION['usuario'] = $usuario;
                // Redirigir al usuario al sitio deseado después del inicio de sesión (en este caso, el sitio de la UTP)
                header("Location: catalogo.php");
                exit();
            } else {
                echo '<p class="error">Contraseña inválida. Por favor, inténtalo de nuevo.</p>';
            }
        } else {
            echo '<p class="error">Usuario no encontrado.</p>';
        }
    } else {
        // El reCAPTCHA ha fallado, muestra un mensaje de error
        echo '<p class="error">Por favor, complete el reCAPTCHA.</p>';
    }
}

// Verificar si se ha enviado el formulario de registro
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['registro'])) {
    // Utilizar consultas preparadas para evitar la inyección SQL
    $usuario = $_POST['usuario'];
    $contraseña = $_POST['contraseña'];

    // Aplicar técnicas de seguridad a la contraseña
    $contraseña_md5 = md5($contraseña);
    $contraseña_crs32 = hash('crc32', $contraseña);
    $contraseña_crip = hash('ripemd160', $contraseña);
    $contraseña_sha1 = sha1($contraseña);

    // Consulta SQL preparada para verificar si el usuario ya existe
    $sql_check_user = "SELECT * FROM usuarios WHERE usuario=?";
    $stmt_check_user = $conn->prepare($sql_check_user);
    $stmt_check_user->bind_param("s", $usuario);
    $stmt_check_user->execute();
    $result_check_user = $stmt_check_user->get_result();

    if ($result_check_user->num_rows > 0) {
        // Si el usuario ya existe, mostrar un mensaje de error
        echo '<p class="error">Error: ¡Cuenta existente! Por favor, elige otro nombre de usuario.</p>';
    } else {
        // Si el usuario no existe, proceder con la inserción del nuevo usuario
        // Seleccionar una de las técnicas de seguridad para almacenar la contraseña
        $hashed_password = $contraseña_md5; // Puedes cambiar a cualquiera de las otras técnicas si lo prefieres

        // Consulta SQL preparada para insertar el nuevo usuario en la base de datos
        $sql_insert_user = "INSERT INTO usuarios (usuario, contraseña) VALUES (?, ?)";
        $stmt_insert_user = $conn->prepare($sql_insert_user);
        $stmt_insert_user->bind_param("ss", $usuario, $hashed_password);

        // Ejecutar la consulta de inserción
        if ($stmt_insert_user->execute()) {
            echo '<p class="success">Usuario creado con éxito. Ahora puedes iniciar sesión.</p>';
        } else {
            echo '<p class="error">Error al crear el usuario: ' . $conn->error . '</p>';
        }
    }
}

// Cerrar la conexión a la base de datos
$conn->close();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesion</title>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <link rel="stylesheet" href="styles.css"> <!-- Enlace al archivo CSS externo -->
</head>
<body>
    <div class="login-container">
        <h2>Iniciar Sesion</h2>
        <!-- Formulario de inicio de sesión con reCAPTCHA -->
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST">
            <div class="input-group">
                <label for="usuario">Usuario:</label>
                <input type="text" id="usuario" name="usuario" required>
            </div>
            <div class="input-group">
                <label for="contraseña">Contraseña:</label>
                <input type="password" id="contraseña" name="contraseña" required>
            </div>
            <!-- Agregar reCAPTCHA -->
            <div class="g-recaptcha" data-sitekey="6LcNmnYpAAAAAJp3DtlVJvfbs8KzK6PlBg2wwQ6v"></div>
            <button type="submit" name="login">Iniciar Sesion</button>
            <button type="submit" name="registro">Registro</button>
        </form>
    </div>
</body>
</html>

  
</body>
</html>
