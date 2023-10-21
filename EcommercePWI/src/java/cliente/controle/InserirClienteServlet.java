package cliente.controle;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import usuario.modelo.UsuarioDAO;

/**
 * Classe que representa a ação de inserir um novo cliente
 */
public class InserirClienteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String endereco = request.getParameter("endereco");
        String email = request.getParameter("email");
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        boolean sucesso = usuarioDAO.inserirCliente(nome, endereco, email, login, senha);

        if (sucesso) {
            request.setAttribute("mensagem", "Cliente cadastrado com sucesso");
            RequestDispatcher dispatcher = request.getRequestDispatcher("Inicio");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("mensagem", "Não foi possível cadastrar o cliente");
            RequestDispatcher dispatcher = request.getRequestDispatcher("novoCliente.jsp");
            dispatcher.forward(request, response);
        }
    }

}
