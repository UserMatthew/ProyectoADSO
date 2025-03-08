/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import models.Rol;

public class RolDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    /*Metodo para mostrar los roles*/
    public ArrayList<Rol> MostrarRol() {
        ArrayList<Rol> lista = new ArrayList<>();

        try {
            con = cn.conexion();
            String Usql = "SELECT * FROM rol ";
            ps = con.prepareStatement(Usql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Rol rol = new Rol();
                rol.setId(rs.getInt("ID_rol"));
                rol.setNombre(rs.getString("nombre_rol"));
                lista.add(rol);
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

    /*Metodo para registrar un roles */
    public int registrar(Rol rol) {
        int resultado = 0;

        try {
            con = cn.conexion();
            String Usql = "INSERT INTO rol (nombre_rol)"
                    + "VALUE (?)";
            ps = con.prepareStatement(Usql);
            ps.setString(1, rol.getNombre());

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

    /*Metodo para buscar usuario por id */
    public Rol buscarPorID(int id) {
        Rol rol = null;

        try {
            con = cn.conexion();
            String Usql = "SELECT * FROM rol WHERE ID_rol = ?";
            ps = con.prepareStatement(Usql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                rol = new Rol();
                rol.setId(rs.getInt("ID_rol"));
                rol.setNombre(rs.getString("nombre_rol"));

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
        return rol;
    }

    // Método para editar un usuario
    public int editar(Rol rol) {
        int resultado = 0;

        try {
            con = cn.conexion();
            String sql = "UPDATE rol SET nombre_rol= ? WHERE ID_rol = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, rol.getNombre());
            ps.setInt(2, rol.getId());

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
            String sql = "DELETE FROM rol WHERE ID_rol = ?";
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
