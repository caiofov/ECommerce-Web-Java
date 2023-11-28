package venda.controle;

import carrinhocompras.modelo.CarrinhoCompraItem;
import carrinhocompras.modelo.CarrinhoCompras;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import usuario.modelo.Usuario;
import venda.modelo.VendaDAO;

/**
 * Classe que implementa a ação de efetivar um venda
 */
public class VendaInserirServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuario");
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
        List<CarrinhoCompraItem> itens = CarrinhoCompras.obterCarrinho(cookie.getValue());
        VendaDAO vendaDAO = new VendaDAO();
        boolean sucesso = vendaDAO.inserir(usuario.getId(), itens);
        if (sucesso) {
            request.setAttribute("mensagem", "Venda efetuada com sucesso");
            cookie.setValue("");
            response.addCookie(cookie);
        } else {
            request.setAttribute("mensagem", "Não foi possível realizar esta venda");
        }

        request.getRequestDispatcher("/Inicio").forward(request, response);
    }

}
