package relatorios;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import static java.lang.System.in;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import produto.modelo.Produto;
import produto.modelo.ProdutoDAO;

/**
 * Classe que exporta um relatório dos produtos que estão faltando em estoque
 */
public class RelatorioProdutosFaltandoServlet extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try (PrintWriter relatorio = new PrintWriter(byteArrayOutputStream)) {
            ProdutoDAO produtoDAO = new ProdutoDAO();
            List<Produto> produtos = produtoDAO.listarProdutosFaltando();
            for (Produto p : produtos) {
                relatorio.print(p.getId() + "\t" + p.getDescricao() + "\t" + p.getPreco() + "\n");
            }
            relatorio.flush();
        }
        response.setContentType("text/plain;charset=UTF-8");
        response.setContentLength((int) byteArrayOutputStream.size());
        String key = "Content-Disposition";
        String value = String.format("attachment; filename=\"%s\"",
                "relatorio1.txt");
        response.setHeader(key, value);
        OutputStream out = response.getOutputStream();
        out.write(byteArrayOutputStream.toByteArray());
        out.close();
    }

}
