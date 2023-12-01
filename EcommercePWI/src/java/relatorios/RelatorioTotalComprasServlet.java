package relatorios;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import venda.modelo.VendaDAO;

/**
 * Classe que exporta um relatório dos produtos que estão faltando em estoque
 */
public class RelatorioTotalComprasServlet extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try (PrintWriter relatorio = new PrintWriter(byteArrayOutputStream)) {
            VendaDAO vendaDAO = new VendaDAO();
            ArrayList<ArrayList> pedidosPorCliente = vendaDAO.listarTotalPedidosPorClienteAno();
            relatorio.print("ID ----- NOME ----- NÚMERO DE PEDIDOS \n");
            for (int i = 0; i < pedidosPorCliente.size(); i++) {
                relatorio.print(pedidosPorCliente.get(i).get(0) + "\t " + pedidosPorCliente.get(i).get(1) + "\t" + pedidosPorCliente.get(i).get(2) + "\n");
            }
            relatorio.flush();
        }
        response.setContentType("text/plain;charset=UTF-8");
        response.setContentLength((int) byteArrayOutputStream.size());
        String key = "Content-Disposition";
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy_mm_dd_hh_mmss");
        String fileName = "relatorio_total" + dateFormat.format(new Date()) + ".txt";
        String value = String.format("attachment; filename=\"%s\"",
                fileName);
        response.setHeader(key, value);
        OutputStream out = response.getOutputStream();
        out.write(byteArrayOutputStream.toByteArray());
        out.close();
    }

}
