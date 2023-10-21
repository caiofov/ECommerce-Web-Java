package acesso.controle;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import usuario.modelo.UsuarioDAO;

/**
 *
 * @author Leonardo Oliveira Moreira
 *
 * Classe que representa a ação de efetuar a identficação do usuário na
 * aplicação
 */
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        boolean sucesso = usuarioDAO.validarAcesso(login, senha);
        if (sucesso) {
            HttpSession sessao = request.getSession(true);
            sessao.setAttribute("usuario", usuarioDAO.getUsuario(login));
            RequestDispatcher dispatcher = request.getRequestDispatcher("Inicio");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("mensagem", "Login ou senha incorreta");
            RequestDispatcher dispatcher = request.getRequestDispatcher("Inicio");
            dispatcher.forward(request, response);
        }
    }

}
