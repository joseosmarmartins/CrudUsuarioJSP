package com.jose;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/CadastroUsuario")
public class CadastroUsuario extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("action").equals("deletar")) {
            Usuario usuario = UsuarioDAO.porId(Integer.parseInt(request.getParameter("id")));

            UsuarioDAO.deletaUsuario(usuario);

            response.sendRedirect("index.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("action").equals("adicionar")) {
            Usuario usuario = new Usuario();
            usuario.setNome(request.getParameter("nome"));
            usuario.setCpf(request.getParameter("cpf"));
            usuario.setEmail(request.getParameter("email"));

            UsuarioDAO.adicionarUsuario(usuario);

            response.sendRedirect("index.jsp");
        }

        if (request.getParameter("action").equals("editar")) {
            Usuario usuario = new Usuario();
            usuario.setId(Integer.valueOf(request.getParameter("id")));
            usuario.setNome(request.getParameter("nome"));
            usuario.setCpf(request.getParameter("cpf"));
            usuario.setEmail(request.getParameter("email"));

            UsuarioDAO.editaUsuario(usuario);

            response.sendRedirect("index.jsp");
        }
    }
}
