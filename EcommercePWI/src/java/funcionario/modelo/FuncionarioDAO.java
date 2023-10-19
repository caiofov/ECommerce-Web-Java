package funcionario.modelo;

import static config.Config.*;
import java.sql.*;

/**
 * Classe que implementa o padrão DAO para a entidade funcionario
 */
public class FuncionarioDAO {

    /**
     * Método utilizado para verificar se o login e senha do funcionario são válidos
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
            PreparedStatement ps = c.prepareStatement("SELECT * FROM funcionario WHERE login = ? AND senha = ?");
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
     * Método utilizado para inserir um novo funcionario
     *
     * @param nome
     * @param login
     * @param senha
     * @param dataNascimento
     * @param cargo
     * 
     * @return
     */
    public boolean inserirFuncionario(String nome, String login, String senha, String dataNascimento, String cargo) {
        boolean sucesso = false;
        try {
            Class.forName(JDBC_DRIVER);
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement ps = c.prepareStatement("INSERT INTO cliente (nome, login, senha, dataNascimento, cargo) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, nome);
            ps.setString(2, login);
            ps.setString(3, senha);
            ps.setString(4, dataNascimento);
            ps.setString(5, cargo);
            sucesso = (ps.executeUpdate() == 1);
            ps.close();
            c.close();
        } catch (ClassNotFoundException | SQLException ex) {
            return false;
        }
        return sucesso;
    }

}
