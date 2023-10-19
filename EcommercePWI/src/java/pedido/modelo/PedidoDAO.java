package pedido.modelo;

import static config.Config.*;
import java.sql.*;

/**
 * Classe que implementa o padrão DAO para a entidade pedido
 */
public class PedidoDAO {                 // FALTA INSERIR NA TABELA produto_pedido OS PRODUTOS DO PEDIDO, DEPOIS DA CRIAÇÃO

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
            PreparedStatement ps = c.prepareStatement("INSERT INTO pedido (dataCompra, qtdeTotal, valorTotal, cliente) VALUES (?, ?, ?, ?)");
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

}
