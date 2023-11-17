package acesso.controle;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import produto.modelo.Produto;
import produto.modelo.ProdutoDAO;

/**
 * Classe que representa a ação de montar a página inicial da aplicação
 */
public class InicioServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProdutoDAO produtoDAO = new ProdutoDAO();
        List<Produto> produtos = produtoDAO.listarProdutosEmEstoque();
        request.setAttribute("produtosEmEstoque", produtos);
        SimpleDateFormat dateFormat = new SimpleDateFormat("ddMMyyyyhhmmss");
        Cookie cookie = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("smdecommerce.time")) {
                    cookie = c;
                    break;
                }
            }
        }
        if (cookie == null) {
            cookie = new Cookie("smdecommerce.time", dateFormat.format(new Date()));
        } else {
            cookie.setValue(dateFormat.format(new Date()));
        }
        cookie.setMaxAge(Integer.MAX_VALUE);
        response.addCookie(cookie);

        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }

}
