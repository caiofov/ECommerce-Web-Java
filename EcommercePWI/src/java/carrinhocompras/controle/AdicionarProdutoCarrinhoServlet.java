package carrinhocompras.controle;

import carrinhocompras.modelo.CarrinhoCompras;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdicionarProdutoCarrinhoServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int produtoId = Integer.parseInt(request.getParameter("produtoId"));
        String irPara = request.getParameter("irPara"); //diz para onde o servlet deve redirecionar (opcional)
        Cookie cookie = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("smdecommerce.carrinho")) {
                    cookie = c;
                    break;
                }
            }
        }
        if (cookie == null) {
            cookie = new Cookie("smdecommerce.carrinho", "");
        }
        String novoCookieString = CarrinhoCompras.adicionar(cookie.getValue(), produtoId);
        cookie.setValue(novoCookieString);
        cookie.setMaxAge(Integer.MAX_VALUE);
        response.addCookie(cookie);
        request.setAttribute("mensagem", "Produto adicionado com sucesso. <a href='Carrinho'>Ver</a>");
        RequestDispatcher dispatcher = request.getRequestDispatcher(irPara != null ? "/" + irPara : "/Inicio");
        dispatcher.forward(request, response);
    }

}
