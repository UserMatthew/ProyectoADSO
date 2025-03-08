package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

public class Conexion {
    // Datos de conexión a la base de datos
    Connection con;
    String URL = "jdbc:mysql://localhost:3306/mydb";
    String USER = "root";  
    String PASSWORD = "";    
    public static final String BASE_URL = "http://localhost:8080/adso/";


    // Método para establecer una conexión con la base de datos.
    public Connection conexion() {  
        try { 
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("✅ Conexión exitosa a la base de datos");
        } catch (ClassNotFoundException e) {
            System.err.println("❌ Error: No se encontró el driver de MySQL: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("❌ Error en la conexión a la base de datos: " + e.getMessage());
        }
        return con;
    }
}
