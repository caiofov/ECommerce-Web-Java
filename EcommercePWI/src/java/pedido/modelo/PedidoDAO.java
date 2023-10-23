package pedido.modelo;

import static config.Config.*;
import java.sql.*;

/**
 * Classe que implementa o padrão DAO para a entidade pedido
 */
public class PedidoDAO {

    /**
     * Método utilizado para inserir um novo pedido
     *
     * @param dataCompra
     * @param qtdeTotal
     * @param valorTotal
     * @param cliente
     * 
     * @return
     */
    public boolean inserirPedido(String dataCompra, int qtdeTotal, float valorTotal, int cliente) {
        boolean sucesso = false;
        try {
            Class.forName(JDBC_DRIVER);
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement ps = c.prepareStatement("INSERT INTO pedido (dataCompra, qtdeTotal, valorTotal, idCliente) VALUES (?, ?, ?, ?)");
            ps.setString(1, dataCompra);
            ps.setInt(2, qtdeTotal);
            ps.setFloat(3, valorTotal);
            ps.setInt(4, cliente);
            sucesso = (ps.executeUpdate() == 1);
            ps.close();
            c.close();
        } catch (ClassNotFoundException | SQLException ex) {
            return false;
        }
        return sucesso;
    }

    /**
     * Método utilizado para inserir os produtos de um novo pedido
     *
     * @param itens
     * @param qtdes
     * @param pedido
     * 
     * @return
     */
    public boolean inserirProdutoPedido(int[] itens, int[] qtdes, int pedido) {

        // AJEITAR, PRA RETORNAR TRUE QUANDO TODAS AS INSERÇÕES FOREM FEITAS E FAZER ROLLBACK SE DER ERRADO ALGUMA...........
        for (int i=0; i<itens.length; i++) {
            boolean sucesso = false;
            try {
                Class.forName(JDBC_DRIVER);
                Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
                PreparedStatement ps = c.prepareStatement("INSERT INTO produto_pedido (quantidade, idPedido, idProduto) VALUES (?, ?, ?)");
                ps.setInt(1, qtdes[i]);
                ps.setInt(2, pedido);
                // BUSCAR NO BANCO O ID DO PRODUTO (itens[i])...........
                ps.setInt(3, itens[i]);
                sucesso = (ps.executeUpdate() == 1);
                ps.close();
                c.close();
            } catch (ClassNotFoundException | SQLException ex) {
                return false;
            }
            return sucesso;
        }
        return true;
    }
}
