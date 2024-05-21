<?php
class cconexion {

    public static function conecciondb(){
        $hostname = "localhost";
        $dbname = "cinema_film_v2";
        $username = "openpg";
        $password = "openpgpwd";
        $port = "5432";
            
        try { 
            $conn = new PDO ("pgsql:host=$hostname;port=$port;dbname=$dbname", $username, $password);
            print ("se conecto exitosamente a la base de datos");
        }
        catch (PDOException $exp) {
            print ("no se pudo conectar a la base de datos, $exp");
        }

        return $conn;
    }
}

// cunado yo la vi
// Obtener la conexión a la base de datos
$conn = cconexion::conecciondb();

try {
    // Verificar la conexión
    if ($conn) {
        // Ejecutar la consulta SQL
        $stmt = $conn->query('SELECT * FROM Usuario');
        
        // Imprimir los resultados
        while ($row = $stmt->fetch()) {
            print_r($row);
        }
    } else {
        echo "No se pudo establecer conexión a la base de datos.";
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
} finally {
    // Cerrar la conexión
    if ($conn) {
        $conn = null;
    }
}

?>