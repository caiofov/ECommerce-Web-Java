/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package categoria.controle;

import javax.servlet.http.HttpServlet;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import categoria.modelo.CategoriaDAO;


/**
 *
 * @author xyux2
 */
public class AlterarCategoriaServlet  extends HttpServlet{
            protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");   
        int id = Integer.parseInt(request.getParameter("id"));   
        
        CategoriaDAO categoriaDAO = new CategoriaDAO();
        boolean sucesso = categoriaDAO.atualizar(nome,id);
        if (sucesso) {
            request.setAttribute("mensagem", "Dados alterados com sucesso");
        } else {
            request.setAttribute("mensagem", "Não foi possível alterar os dados");
        }
            RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/categoria/editar.jsp");//Path
        
        dispatcher.forward(request, response);
    }
}
