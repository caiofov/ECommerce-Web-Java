package venda.controle;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pedido.modelo.Pedido;
import venda.modelo.VendaDAO;

public class RemoverPedidoServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        VendaDAO dao = new VendaDAO();
        boolean sucesso = dao.remover(id);

        if (sucesso) {
            request.setAttribute("mensagem", "Pedido removido com sucesso");
        } else {
            request.setAttribute("mensagem", "Ocorreu um erro");
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("PedidosAdm");
        dispatcher.forward(request, response);
    }

}
