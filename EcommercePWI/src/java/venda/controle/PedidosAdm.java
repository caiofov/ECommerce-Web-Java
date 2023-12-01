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

public class PedidosAdm extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        VendaDAO dao = new VendaDAO();
        ArrayList<Pedido> pedidos = dao.getPedidosAdm();

        request.setAttribute("pedidos", pedidos);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/pedidosadm.jsp");
        dispatcher.forward(request, response);
    }

}
