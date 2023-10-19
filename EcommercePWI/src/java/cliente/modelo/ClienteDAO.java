package cliente.modelo;

import static config.Config.*;
import java.sql.*;

/**
 * Classe que implementa o padrão DAO para a entidade usuário
 */
public class ClienteDAO {

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
            PreparedStatement ps = c.prepareStatement("SELECT * FROM cliente WHERE login = ? AND senha = ?");
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
     * @param login
     * @param senha
     * @param data_nascimento
     * 
     * @return
     */
    public boolean inserirCliente(String nome, String login, String senha, String data_nascimento) {
        boolean sucesso = false;
        try {
            Class.forName(JDBC_DRIVER);
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement ps = c.prepareStatement("INSERT INTO cliente (nome, login, senha, dataNascimento) VALUES (?, ?, ?, ?)");
            ps.setString(1, nome);
            ps.setString(2, login);
            ps.setString(3, senha);
            ps.setString(4, data_nascimento);
            sucesso = (ps.executeUpdate() == 1);
            ps.close();
            c.close();
        } catch (ClassNotFoundException | SQLException ex) {
            return false;
        }
        return sucesso;
    }

}
