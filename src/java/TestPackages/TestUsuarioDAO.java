/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package TestPackages;

import dao.UsuarioDAO;
import models.Usuario;

public class TestUsuarioDAO {
    public static void main(String[] args) {
        UsuarioDAO udao = new UsuarioDAO();
        Usuario us = udao.validar("matthew@hotmail.es", "1234");

        if (us != null) {
            System.out.println("Usuario encontrado: " + us.getNombre());
        } else {
            System.out.println("Usuario no encontrado.");
        }
    }
}
