/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package produto.controle;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import produto.modelo.ProdutoDAO;
import usuario.modelo.UsuarioDAO;

/**
 *
 * @author xyux2
 */
public class AlterarProdutoServlet extends HttpServlet{
            protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String descricao = request.getParameter("descricao");
        double preco = Double.parseDouble(request.getParameter("preco"));
        String foto = request.getParameter("foto");
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));
        int categoria = Integer.parseInt(request.getParameter("categoria"));    
        int id = Integer.parseInt(request.getParameter("id"));   
        
        ProdutoDAO produtoDAO = new ProdutoDAO();
        boolean sucesso = produtoDAO.atualizar(descricao,preco,foto,quantidade,categoria,id);
        if (sucesso) {
            request.setAttribute("mensagem", "Dados alterados com sucesso");
        } else {
            request.setAttribute("mensagem", "Não foi possível alterar os dados");
        }
            RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/produto/alterar.jsp");//Path
        
        dispatcher.forward(request, response);
    }
    
}
