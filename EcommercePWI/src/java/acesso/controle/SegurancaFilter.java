package acesso.controle;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import usuario.modelo.Usuario;

/**
 *
 * Classe que implementa um filtro que intercepta todas as requisições que visam
 * recursos adminstrativos
 */
public class SegurancaFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        String uri = req.getRequestURI();
        HttpSession session = req.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        if (usuario != null && usuario.isAdministrador()) {
            chain.doFilter(request, response);
        } else {
            request.setAttribute("mensagem", "Você não tem permissão de administrador");
            request.getRequestDispatcher("/Inicio").forward(request, response);
        }
    }

}
