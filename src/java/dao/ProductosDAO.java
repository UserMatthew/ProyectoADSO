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
import models.Producto;

public class ProductosDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    /*Metodo para mostrar la lista de productos */
    public ArrayList<Producto> MostrarProductos() {
        ArrayList<Producto> lista = new ArrayList<>();

        try {

            con = cn.conexion();
            String Usql = "SELECT pro.ID_productos as id_producto, pro.nombre_producto as nombre, pro.descripcion_producto as descripcion , pro.inventario_producto as inventario, pro.precio_venta as pventa , categoria.nombre_categoria as categoria FROM productos as pro INNER JOIN categoria ON pro.ID_categoria = categoria.ID_categoria";
            ps = con.prepareStatement(Usql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Producto product = new Producto();
                product.setId(rs.getInt("id_producto"));
                product.setNombre(rs.getString("nombre"));
                product.setDescripcion(rs.getString("descripcion"));
                product.setStock(rs.getInt("inventario"));
                product.setPrecio_venta(rs.getDouble("pventa"));
                product.setCategoria(rs.getString("categoria"));
                

                lista.add(product);
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

     /*Metodo para registrar un producto al sistema */
    public int registrar(Producto pro) {
        int resultado = 0;

        try {
            con = cn.conexion();
            String Usql = "INSERT INTO productos (ID_productos, nombre_producto, descripcion_producto, inventario_producto, precio_venta,  ID_categoria)"
                    + "VALUE (? , ?, ? , ?, ?, ?)";
            ps = con.prepareStatement(Usql);
            ps.setInt(1, pro.getId());
            ps.setString(2, pro.getNombre());
            ps.setString(3, pro.getDescripcion());
            ps.setInt(4, pro.getStock());
            ps.setDouble(5, pro.getPrecio_venta());
            ps.setInt(6, pro.getIdCategoria());

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
    
    
        /*Metodo para buscar producto por id */
    public Producto buscarPorID(int id) {
        Producto product = null;

        try {
            con = cn.conexion();
            String Usql = "SELECT * FROM productos WHERE ID_productos = ?";
            ps = con.prepareStatement(Usql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                product = new Producto();
                product.setId(rs.getInt("ID_productos"));
                product.setNombre(rs.getString("nombre_producto"));
                product.setDescripcion(rs.getString("descripcion_producto"));
                product.setStock(rs.getInt("inventario_producto"));
                product.setPrecio_venta(rs.getDouble("precio_venta"));
                product.setCategoria(rs.getString("ID_categoria"));
                
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
        return product;
    }

    
    // Método para editar un usuario
    public int editar(Producto pro) {
        int resultado = 0;

        try {
            con = cn.conexion();
            String sql = "UPDATE productos SET nombre_productos = ?, descripcion_producto = ?, inventario_producto = ? , precio_venta = ?, ID_categoria = ? WHERE ID_productos = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, pro.getNombre());
            ps.setString(2, pro.getDescripcion());
            ps.setInt(3, pro.getStock());
            ps.setDouble(4, pro.getPrecio_venta());
            ps.setInt(5, pro.getIdCategoria());
            ps.setInt(6, pro.getId());

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
    
   
    
    // Método para eliminar un producto
    public int eliminar(int id) {
        int resultado = 0;

        try {
            con = cn.conexion();
            String sql = "DELETE FROM productos WHERE ID_productos = ?";
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
    // Metodo para sumar todo el inventario
    public int obtenerTotalInventario() {
    int totalInventario = 0;
    String sql = "SELECT SUM(inventario_producto) AS total FROM productos";

    try {
        con = cn.conexion();
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();

        if (rs.next()) {
            totalInventario = rs.getInt("total");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    return totalInventario;
}

    
    
    
    
}
