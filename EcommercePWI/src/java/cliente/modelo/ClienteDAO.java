package cliente.modelo;

import static config.Config.*;
import java.sql.*;

/**
 * Classe que implementa o padrão DAO para a entidade cliente
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
     * @param dataNascimento
     * 
     * @return
     */
    public boolean inserirCliente(String nome, String login, String senha, String dataNascimento) {
        boolean sucesso = false;
        try {
            Class.forName(JDBC_DRIVER);
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement ps = c.prepareStatement("INSERT INTO cliente (nome, login, senha, dataNascimento) VALUES (?, ?, ?, ?)");
            ps.setString(1, nome);
            ps.setString(2, login);
            ps.setString(3, senha);
            ps.setString(4, dataNascimento);
            sucesso = (ps.executeUpdate() == 1);
            ps.close();
            c.close();
        } catch (ClassNotFoundException | SQLException ex) {
            return false;
        }
        return sucesso;
    }

    /**
     * Método utilizado para inserir o telefone do novo cliente
     *
     * @param endereco
     * @param complemento
     * @param numero
     * @param bairro
     * @param cidade
     * @param uf
     * @param cep
     * @param principal
     * @param cliente
     * 
     * @return
     */
    public boolean inserirEnderecoCliente(String endereco, String complemento, int numero, String bairro, String cidade, String uf, String cep, int principal, int cliente) {
        boolean sucesso = false;
        try {
            Class.forName(JDBC_DRIVER);
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement ps = c.prepareStatement("INSERT INTO enderecocliente (endereco, complemento, numero, bairro, cidade, uf, cep, principal, idCliente) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, endereco);
            ps.setString(2, complemento);
            ps.setInt(3, numero);
            ps.setString(4, bairro);
            ps.setString(5, cidade);
            ps.setString(6, uf);
            ps.setString(7, cep);
            ps.setInt(8, principal);
            ps.setInt(9, cliente);

            sucesso = (ps.executeUpdate() == 1);
            ps.close();
            c.close();
        } catch (ClassNotFoundException | SQLException ex) {
            return false;
        }
        return sucesso;
    }

    /**
     * Método utilizado para inserir o telefone do novo cliente
     *
     * @param ddd
     * @param numero
     * @param principal
     * @param cliente
     * 
     * @return
     */
    public boolean inserirTelefoneCliente(int ddd, int numero, int principal, int cliente) {
        boolean sucesso = false;
        try {
            Class.forName(JDBC_DRIVER);
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement ps = c.prepareStatement("INSERT INTO telefonecliente (ddd, numero, principal, idCliente) VALUES (?, ?, ?, ?)");
            ps.setInt(1, ddd);
            ps.setInt(2, numero);
            ps.setInt(3, principal);
            ps.setInt(4, cliente);
            sucesso = (ps.executeUpdate() == 1);
            ps.close();
            c.close();
        } catch (ClassNotFoundException | SQLException ex) {
            return false;
        }
        return sucesso;
    }
}
