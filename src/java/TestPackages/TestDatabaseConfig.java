package TestPackages;

import config.Conexion;
import java.sql.Connection;

public class TestDatabaseConfig {
    public static void main(String[] args) {
        Conexion db = new Conexion();
        Connection conn = db.conexion();

        
        if (conn != null) {
            System.out.println("✅ Conexión establecida correctamente.");   
        } else {
            System.out.println("❌ No se pudo conectar a la base de datos.");
        }
    }
}
