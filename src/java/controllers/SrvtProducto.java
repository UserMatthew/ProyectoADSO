/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.CategoriaDAO;
import dao.ProductosDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import models.Categoria;
import models.Producto;

public class SrvtProducto extends HttpServlet {

    private ProductosDAO pdao = new ProductosDAO();
    Producto product = new Producto();
    private CategoriaDAO cdao = new CategoriaDAO();
    Categoria cat = new Categoria();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action.toLowerCase()) {
            case "mostrar" ->
                mostrar(request, response);
            case "formulario" ->
                formulario(request, response);
            case "update" ->
                formulario(request, response);
            case "eliminar" ->
                eliminarProducto(request, response);
            default ->
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no válida");
        }
    }

    private void mostrar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("producto", pdao.MostrarProductos());
        request.getRequestDispatcher("/view/productos/index.jsp").forward(request, response);

    }

    // Metodo registrar lista de usuarios  roles
    private void formulario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("formulario".equalsIgnoreCase(action)) {
            request.setAttribute("categoria", cdao.MostrarCategoria());
            request.getRequestDispatcher("/view/productos/create.jsp").forward(request, response);
        } else if ("update".equalsIgnoreCase(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            product = pdao.buscarPorID(id);
            if (product != null) {
                request.setAttribute("producto", product);
                request.setAttribute("categoria", cdao.MostrarCategoria());
                request.getRequestDispatcher("view/productos/update.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/SrvtProduto?action=mostrar");
            }
        }
    }

    private void eliminarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int resultado = pdao.eliminar(id);
        if (resultado > 0) {
            response.sendRedirect(request.getContextPath() + "/SrvtProducto?action=mostrar");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect(request.getContextPath() + "/view/login/index.jsp");
            return;
        }
        switch (action.toLowerCase()) {
            case "registrar" ->
                registrar(request, response);
            case "editar" ->
                editar(request, response);
            default ->
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no válida");
        }
    }

    // Metodo registrar producto    
    private void registrar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        product.setId(Integer.parseInt(request.getParameter("id_producto")));
        product.setNombre(request.getParameter("nombre_producto"));
        product.setDescripcion(request.getParameter("descripcion_producto"));
        product.setIdCategoria(Integer.parseInt(request.getParameter("categoria")));
        product.setStock(Integer.parseInt(request.getParameter("inventario")));
        product.setPrecio_venta(Double.parseDouble(request.getParameter("pventa")));
        int resultado = pdao.registrar(product);
        if (resultado > 0) {
            response.sendRedirect(request.getContextPath() + "/SrvtProducto?action=mostrar");
        } else {
            request.setAttribute("producto", product);
            request.getRequestDispatcher("view/productos/create.jsp").forward(request, response);

        }
    }

    private void editar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        product.setId(Integer.parseInt(request.getParameter("id_producto")));
        product.setNombre(request.getParameter("nombre_producto"));
        product.setDescripcion(request.getParameter("descripcion_producto"));
        product.setIdCategoria(Integer.parseInt(request.getParameter("categoria")));
        product.setStock(Integer.parseInt(request.getParameter("inventario")));
        product.setPrecio_venta(Double.parseDouble(request.getParameter("pventa")));
        int resultado = pdao.editar(product);
        if (resultado > 0) {
            response.sendRedirect(request.getContextPath() + "/SrvtProducto?action=mostrar");
        } else {
            request.setAttribute("producto", product);
            request.getRequestDispatcher("view/productos/update.jsp").forward(request, response);

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    /*   private void mostrarInventario(HttpServletRequest request, HttpServletResponse response)
     *   throws ServletException, IOException {
     *   int totalInventario = pdao.obtenerTotalInventario(); 
     *   request.setAttribute("totalInventario", totalInventario); 
     *   request.getRequestDispatcher("/index.jsp").forward(request, response);
     *
     *       }
     */

}
