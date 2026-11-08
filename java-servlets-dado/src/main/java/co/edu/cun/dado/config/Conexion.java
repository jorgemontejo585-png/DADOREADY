package co.edu.cun.dado.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Clase Conexion: Gestiona la conexion a la base de datos MySQL (BoxesYa.sql).
 */
public class Conexion {
    // Configuracion para PostgreSQL (puerto estandar 5432)
    private static final String DRIVER = "org.postgresql.Driver";
    private static final String URL = "jdbc:postgresql://localhost:5432/dado_db";
    private static final String USER = "postgres";
    private static final String PASSWORD = "admin"; // Cambiar por tu contraseña de PostgreSQL/pgAdmin

    public static Connection getConexion() {
        Connection con = null;
        try {
            Class.forName(DRIVER);
            con = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.err.println("Error: Driver PostgreSQL no encontrado -> " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Error al conectar a la base de datos PostgreSQL -> " + e.getMessage());
        }
        return con;
    }
}
