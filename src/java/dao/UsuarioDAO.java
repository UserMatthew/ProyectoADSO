package dao;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import models.Usuario;

public class UsuarioDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    /*Metodo para validar el ingreso al sistema */
    public Usuario validar(String email, String password) {
        Usuario us = new Usuario();
        String sql = "SELECT * FROM usuario WHERE email_usuario = ? AND contraseña = ?";

        try {
            con = cn.conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();

            while (rs.next()) {
                us.setNombre(rs.getString("nombre_usuario"));
                us.setId(rs.getInt("ID_usuario"));
                us.setEmail(rs.getString("email_usuario"));
                us.setTelefono(rs.getInt("telefono"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return us;
    }

    /*Metodo para registrar un usuario al sistema */
    public int registrar(Usuario us) {
        int resultado = 0;

        try {
            con = cn.conexion();
            String Usql = "INSERT INTO usuario (ID_usuario, nombre_usuario, email_usuario, ID_rol , contraseña , telefono)"
                    + "VALUE (? , ?, ? , ?, ?, ?)";
            ps = con.prepareStatement(Usql);
            ps.setInt(1, us.getId());
            ps.setString(2, us.getNombre());
            ps.setString(3, us.getEmail());
            ps.setInt(4, us.getIdRol());
            ps.setString(5, us.getPassword());
            ps.setInt(6, us.getTelefono());

            resultado = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return resultado;

    }

    /*Metodo para mostrar la lista de usuarios */
    public ArrayList<Usuario> MostrarUsuarios() {
        ArrayList<Usuario> lista = new ArrayList<>();

        try {
            con = cn.conexion();
            String Usql = "SELECT us.ID_usuario as id_usuario, us.nombre_usuario as nombre, us.email_usuario as email, us.telefono as telefono, rol.nombre_rol as rol FROM usuario as us INNER JOIN rol ON us.ID_rol = rol.ID_rol";
            ps = con.prepareStatement(Usql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Usuario us = new Usuario();
                us.setId(rs.getInt("id_usuario"));
                us.setNombre(rs.getString("nombre"));
                us.setEmail(rs.getString("email"));
                us.setTelefono(rs.getInt("telefono"));
                us.setRol(rs.getString("rol"));
                lista.add(us);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return lista;
    }

    /*Metodo para buscar usuario por id */
    public Usuario buscarPorID(int id) {
        Usuario us = null;

        try {
            con = cn.conexion();
            String Usql = "SELECT * FROM usuario WHERE ID_usuario = ?";
            ps = con.prepareStatement(Usql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                us = new Usuario();
                us.setId(rs.getInt("ID_usuario"));
                us.setNombre(rs.getString("nombre_usuario"));
                us.setEmail(rs.getString("email_usuario"));
                us.setTelefono(rs.getInt("telefono_usuario"));
                us.setRol(rs.getString("ID_rol"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return us;
    }

    // Método para editar un usuario
    public int editar(Usuario us) {
        int resultado = 0;

        try {
            con = cn.conexion();
            String sql = "UPDATE usuario SET nombre_usuario = ?, email_usuario = ?, ID_rol = ?, contraseña = ?, telefono = ? WHERE ID_usuario = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, us.getNombre());
            ps.setString(2, us.getEmail());
            ps.setInt(3, us.getIdRol());
            ps.setString(4, us.getPassword());
            ps.setInt(5, us.getTelefono());
            ps.setInt(6, us.getId());

            resultado = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return resultado;
    }

    // Método para eliminar un usuario
    public int eliminar(int id) {
        int resultado = 0;

        try {
            con = cn.conexion();
            String sql = "DELETE FROM usuario WHERE ID_usuario = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            resultado = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return resultado;
    }

}
