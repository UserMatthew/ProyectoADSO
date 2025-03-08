package dao;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import models.Categoria;

public class CategoriaDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    /*Metodo para mostrar los categorias*/
    public ArrayList<Categoria> MostrarCategoria() {
        ArrayList<Categoria> lista = new ArrayList<>();

        try {
            con = cn.conexion();
            String Usql = "SELECT * FROM categoria ";
            ps = con.prepareStatement(Usql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Categoria cat = new Categoria();
                cat.setId(rs.getInt("ID_categoria"));
                cat.setNombre(rs.getString("nombre_categoria"));
                cat.setDescripcion(rs.getString("descripcion_categoria"));

                lista.add(cat);
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
    public int registrar(Categoria cat) {
        int resultado = 0;

        try {
            con = cn.conexion();
            String Usql = "INSERT INTO categoria (ID_categoria, nombre_categoria, descripcion_categoria)"
                    + "VALUE (?, ?, ?)";
            ps = con.prepareStatement(Usql);
            ps.setInt(1, cat.getId());
            ps.setString(2, cat.getNombre());
            ps.setString(3, cat.getDescripcion());

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
    public Categoria buscarPorID(int id) {
        Categoria cat = null;

        try {
            con = cn.conexion();
            String Usql = "SELECT * FROM categoria WHERE ID_categoria = ?";
            ps = con.prepareStatement(Usql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                cat = new Categoria();
                cat.setId(rs.getInt("ID_categoria"));
                cat.setNombre(rs.getString("nombre_categoria"));
                cat.setDescripcion(rs.getString("descripcion_categoria"));

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
        return cat;
    }

    // Método para editar un usuario
    public int editar(Categoria cat) {
        int resultado = 0;

        try {
            con = cn.conexion();
            String sql = "UPDATE categoria SET nombre_categoria = ?, descripcion_categoria = ? WHERE ID_categoria = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, cat.getNombre());
            ps.setString(2, cat.getDescripcion());
            ps.setInt(3, cat.getId());

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
    
     // Método para eliminar un categoria
    public int eliminar(int id) {
        int resultado = 0;

        try {
            con = cn.conexion();
            String sql = "DELETE FROM categoria WHERE ID_categoria = ?";
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
