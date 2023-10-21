package cliente;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cliente.modelo.ClienteDAO;

/**
 * Classe que representa a ação de inserir um novo cliente
 */
public class InserirClienteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        String dataNascimento = request.getParameter("dataNascimento");
        String endereco = request.getParameter("endereco");
        String complemento = request.getParameter("complemento");
        int numero = request.getParameter("numero");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String uf = request.getParameter("uf");
        String cep = request.getParameter("cep");
        String ddd = request.getParameter("endereco");
        String telefone = request.getParameter("endereco");

        ClienteDAO clienteDAO = new ClienteDAO();
        boolean sucesso = clienteDAO.inserirCliente(nome, login, senha, dataNascimento);
        // ---------------------------------------------------------------
        // BUSCAR NO BANCO cliente O ID DO CLIENTE........
        // ---------------------------------------------------------------
        boolean sucesso2 = clienteDAO.inserirEnderecoCliente(endereco, complemento, numero, bairro, cidade, uf, cep, 1, cliente);
        boolean sucesso3 = clienteDAO.inserirTelefoneCliente(ddd, telefone, 1, cliente);

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            if (sucesso && sucesso2 && sucesso3) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>smd e-commerce</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>" + ((sucesso) ? "Cliente cadastrado com sucesso!" : "Não foi possível cadastrar este cliente") + "</h1>");
                out.println("</body>");
                out.println("</html>");
            } else {
                response.sendRedirect("index.jsp");
            }
        }
    }

}
