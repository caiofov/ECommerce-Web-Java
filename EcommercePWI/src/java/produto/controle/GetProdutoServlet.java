/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package produto.controle;

import produto.modelo.ProdutoDAO;
import produto.modelo.Produto;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetProdutoServlet extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ProdutoDAO dao = new ProdutoDAO();
        Produto produto = dao.getProduto(id);

        request.setAttribute("produto", produto);

        RequestDispatcher dispatcher = request.getRequestDispatcher("produto/produto.jsp");
        dispatcher.forward(request, response);
    }

}
