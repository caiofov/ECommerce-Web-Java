package produto.modelo;

import static config.Config.*;
import java.sql.*;

/**
 * Classe que implementa o padrão DAO para a entidade produto
 */
public class ProdutoDAO {

    /**
     * Método utilizado para inserir um novo produto
     *
     * @param nome
     * @param descricao
     * @param valor
     * @param qtdeEstoque
     * @param categoria
     * @param funcionario
     * 
     * @return
     */
    public boolean inserirProduto(String nome, String descricao, float valor, int qtdeEstoque, int categoria, int funcionario) {
        boolean sucesso = false;
        try {
            Class.forName(JDBC_DRIVER);
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement ps = c.prepareStatement("INSERT INTO produto (nome, descricao, valor, qtdeEstoque, categoria, funcionario) VALUES (?, ?, ?, ?, ?, ?)");
            ps.setString(1, nome);
            ps.setString(2, descricao);
            ps.setFloat(3, valor);
            ps.setInt(4, qtdeEstoque);
            ps.setInt(5, categoria);
            ps.setInt(6, funcionario);
            sucesso = (ps.executeUpdate() == 1);
            ps.close();
            c.close();
        } catch (ClassNotFoundException | SQLException ex) {
            return false;
        }
        return sucesso;
    }

}
