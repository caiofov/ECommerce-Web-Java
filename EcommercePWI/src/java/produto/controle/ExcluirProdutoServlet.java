/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package produto.controle;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import produto.modelo.ProdutoDAO;

/**
 *
 * @author xyux2
 */
public class ExcluirProdutoServlet {
        protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ProdutoDAO produtoDAO = new ProdutoDAO();
        boolean sucesso = produtoDAO.excluir(id);
        if (sucesso) {
            request.setAttribute("mensagem", "Produto excluída com sucesso");
        } else {
            request.setAttribute("mensagem", "Não foi possível excluir a produto");
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("ListarProduto");//Path
        
        dispatcher.forward(request, response);
    }
}
