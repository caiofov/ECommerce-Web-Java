package acesso;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cliente.modelo.ClienteDAO;

/**
 * Classe que representa a ação de efetuar a identficação do usuário na
 * aplicação
 */
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");

        ClienteDAO usuarioDAO = new ClienteDAO();
        boolean sucesso = usuarioDAO.validarAcesso(login, senha);

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            if (sucesso) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>smd e-commerce</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Olá " + login + "</h1>");
                out.println("<h3>Sua senha é " + senha + "</h3>");
                out.println("</body>");
                out.println("</html>");
            } else {
                response.sendRedirect("index.jsp");
            }
        }
    }

}
