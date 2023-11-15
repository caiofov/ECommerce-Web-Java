/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package conta.controle;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import usuario.modelo.UsuarioDAO;

/**
 *
 * @author xyux2
 */
public class AlterarContaServlet {
                protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nome = (request.getParameter("nome"));
        String endereco = (request.getParameter("endereco"));
        String email = (request.getParameter("email"));       
        String login = (request.getParameter("login"));
        String senha = (request.getParameter("senha"));
        
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        boolean sucesso = usuarioDAO.atualizar(nome,endereco,email,login,senha,id);
        if (sucesso) {
            request.setAttribute("mensagem", "Usuario excluído com sucesso");
        } else {
            request.setAttribute("mensagem", "Não foi possível excluir o usuario");
        }
            RequestDispatcher dispatcher = request.getRequestDispatcher("Inicio");//Path
        
        dispatcher.forward(request, response);
    }

    
}
