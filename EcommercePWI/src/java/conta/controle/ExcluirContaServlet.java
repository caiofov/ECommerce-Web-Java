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

/**
 *
 * @author xyux2
 */
public class ExcluirContaServlet extends HttpServlet {
        @Override
        protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        boolean sucesso = usuarioDAO.excluir(id);
        if (sucesso) {
            request.setAttribute("mensagem", "Usuario excluído com sucesso");
        } else {
            request.setAttribute("mensagem", "Não foi possível excluir o usuario");
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("Logout");
        
        dispatcher.forward(request, response);
    }
}
