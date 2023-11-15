package categoria.controle;

import categoria.modelo.CategoriaDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ExcluirCategoriaServlet extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        CategoriaDAO categoriaDAO = new CategoriaDAO();
        boolean sucesso = categoriaDAO.excluir(id);
        if (sucesso) {
            request.setAttribute("mensagem", "Categoria excluída com sucesso");
        } else {
            request.setAttribute("mensagem", "Não foi possível excluir a categoria");
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("ListarCategoria");
        dispatcher.forward(request, response);
    }

}
