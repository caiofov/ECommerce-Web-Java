package categoria.modelo;

import static config.Config.*;
import java.sql.*;

/**
 * Classe que implementa o padrão DAO para a entidade categoria
 */
public class CategoriaDAO {

    /**
     * Método utilizado para inserir uma nova categoria
     *
     * @param nome
     * @param descricao
     * 
     * @return
     */
    public boolean inserirCategoria(String nome, String descricao) {
        boolean sucesso = false;
        try {
            Class.forName(JDBC_DRIVER);
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement ps = c.prepareStatement("INSERT INTO categoria (nome, descricao) VALUES (?, ?)");
            ps.setString(1, nome);
            ps.setString(2, descricao);
            sucesso = (ps.executeUpdate() == 1);
            ps.close();
            c.close();
        } catch (ClassNotFoundException | SQLException ex) {
            return false;
        }
        return sucesso;
    }

}
