/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package produto.controle;

import produto.modelo.ProdutoDAO;
import produto.modelo.Produto;
import categoria.modelo.CategoriaDAO;
import categoria.modelo.Categoria;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetAlterarProdutoServlet extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ProdutoDAO produtoDao = new ProdutoDAO();
        CategoriaDAO categoriaDao = new CategoriaDAO();

        Produto produto = produtoDao.get(id);
        Categoria categoria = categoriaDao.get(produto.getCategoriaId());

        request.setAttribute("produto", produto);
        request.setAttribute("categoria", categoria);

        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/produto/alterar.jsp");
        dispatcher.forward(request, response);
    }

}
