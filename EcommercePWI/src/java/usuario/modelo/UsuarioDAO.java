package usuario.modelo;

import static config.Config.*;
import java.sql.*;

/**
 * Classe que implementa o padrão DAO para a entidade usuário
 */
public class UsuarioDAO {

    /**
     * Método utilizado para recuperar um usuário pelo login
     *
     * @param login
     * @return
     */
    public Usuario getUsuario(String login) {
        Usuario usuario = null;
        try {
            Class.forName(JDBC_DRIVER);
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement ps = c.prepareStatement("SELECT id, nome, endereco, email, login, senha, administrador FROM usuario WHERE login = ?");
            ps.setString(1, login);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setEndereco(rs.getString("endereco"));
                usuario.setEmail(rs.getString("email"));
                usuario.setLogin(rs.getString("login"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setAdministrador(rs.getBoolean("administrador"));
            }
            rs.close();
            ps.close();
            c.close();
        } catch (ClassNotFoundException | SQLException ex) {
            return null;
        }
        return usuario;
    }

    /**
     * Método utilizado para verificar se o login e senha do usuário são válidos
     *
     * @param login
     * @param senha
     * @return
     */
    public boolean validarAcesso(String login, String senha) {
        boolean sucesso = false;
        try {
            Class.forName(JDBC_DRIVER);
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement ps = c.prepareStatement("SELECT id, nome, endereco, email, login, senha, administrador FROM usuario WHERE login = ? AND senha = ?");
            ps.setString(1, login);
            ps.setString(2, senha);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                sucesso = true;
            }
            rs.close();
            ps.close();
            c.close();
        } catch (ClassNotFoundException | SQLException ex) {
            return false;
        }
        return sucesso;
    }

    /**
     * Método utilizado para inserir um novo usuário cliente
     *
     * @param nome
     * @param endereco
     * @param email
     * @param login
     * @param senha
     * @return
     */
    public boolean inserirCliente(String nome, String endereco, String email, String login, String senha) {
        boolean sucesso = false;
        try {
            Class.forName(JDBC_DRIVER);
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement ps = c.prepareStatement("INSERT INTO usuario (nome, endereco, email, login, senha, administrador) VALUES (?, ?, ?, ?, ?, false)");
            ps.setString(1, nome);
            ps.setString(2, endereco);
            ps.setString(3, email);
            ps.setString(4, login);
            ps.setString(5, senha);
            sucesso = (ps.executeUpdate() == 1);
            ps.close();
            c.close();
        } catch (ClassNotFoundException | SQLException ex) {
            return false;
        }
        return sucesso;
    }

}
