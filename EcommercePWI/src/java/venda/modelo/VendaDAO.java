package venda.modelo;

import carrinhocompras.modelo.CarrinhoCompraItem;
import static config.Config.JDBC_DRIVER;
import static config.Config.JDBC_SENHA;
import static config.Config.JDBC_URL;
import static config.Config.JDBC_USUARIO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

/**
 * Classe que implementa o padrão DAO para a entidade venda
 */
public class VendaDAO {

    /**
     * Método utilizado para registrar uma nova venda
     *
     * @param usuarioId
     * @param itens
     * @return
     */
    public boolean inserir(int usuarioId, List<CarrinhoCompraItem> itens) {
        boolean sucesso = false;
        try {
            Class.forName(JDBC_DRIVER);
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            c.setAutoCommit(false);
            PreparedStatement ps = c.prepareStatement("INSERT INTO venda (data, usuario_id) VALUES (NOW(), ?)", java.sql.Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, usuarioId);
            if (ps.executeUpdate() != 1) {
                c.rollback();
                c.close();
                return false;
            }
            int vendaId = -1;
            try (java.sql.ResultSet keys = ps.getGeneratedKeys()) {
                keys.next();
                vendaId = keys.getInt(1);
            }
            ps.close();

            for (CarrinhoCompraItem item : itens) {
                PreparedStatement psInsert = c.prepareStatement("INSERT INTO venda_produto (venda_id, produto_id, quantidade) VALUES (?, ?, ?)");
                psInsert.setInt(1, vendaId);
                psInsert.setInt(2, item.getProduto().getId());
                psInsert.setInt(3, item.getQuantidade());
                if (psInsert.executeUpdate() != 1) {
                    c.rollback();
                    c.close();
                    return false;
                }
                psInsert.close();
                PreparedStatement psUpdate = c.prepareStatement("UPDATE produto SET quantidade = quantidade - ? WHERE id = ?");
                psUpdate.setInt(1, item.getQuantidade());
                psUpdate.setInt(2, item.getProduto().getId());
                if (psUpdate.executeUpdate() != 1) {
                    c.rollback();
                    c.close();
                    return false;
                }
                psUpdate.close();
            }
            c.commit();
            c.close();
            sucesso = true;
        } catch (ClassNotFoundException | SQLException ex) {
            return false;
        }
        return sucesso;
    }

}
