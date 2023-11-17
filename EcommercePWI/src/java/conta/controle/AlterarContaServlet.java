/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package conta.controle;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import usuario.modelo.UsuarioDAO;
import usuario.modelo.Usuario;

/**
 *
 * @author xyux2
 */
public class AlterarContaServlet extends HttpServlet{
            @Override
            protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        
        Usuario perfilUsuario = null;
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        perfilUsuario = usuarioDAO.getPerfil(id);
        if (perfilUsuario != null) {
            request.setAttribute("perfil", perfilUsuario);
        } else {
            request.setAttribute("mensagem", "Não foi possível recuperar os dados");
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("alterarUsuario.jsp");
        
        dispatcher.forward(request, response);
    }
}
