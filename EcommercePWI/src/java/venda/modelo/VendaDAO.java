package venda.modelo;

import static config.Config.*;
import java.sql.*;
import carrinhocompras.modelo.CarrinhoCompraItem;
import java.util.ArrayList;
import java.util.List;
import pedido.modelo.Pedido;

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
    
    /**
     * Método utilizado para recuperar os pedidos de um usuário
     *
     * @param id
     * @return
     */
    public ArrayList<Pedido> getPedidos(int id) {
        ArrayList<Pedido> pedidos = new ArrayList<>();
        try {
            Class.forName(JDBC_DRIVER);
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement ps = c.prepareStatement("SELECT v.id, v.data, v.usuario_id, vp.quantidade, pr.nome,  pr.preco FROM venda v JOIN venda_produto vp ON v.id=vp.venda_id JOIN produto pr ON vp.produto_id=pr.id WHERE usuario_id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setId(rs.getInt("id"));
                pedido.setDataCompra(rs.getString("data"));
                pedido.setCliente(rs.getInt("usuario_id"));
                pedido.setQtde(rs.getInt("quantidade"));
                pedido.setProduto(rs.getString("nome"));
                pedido.setValor(rs.getFloat("preco"));
                        
                pedidos.add(pedido);
            }
            rs.close();
            ps.close();
            c.close();
        } catch (ClassNotFoundException | SQLException ex) {
            return null;
        }
        return pedidos;
    }

    public ArrayList<Pedido> getPedidosAdm() {
        ArrayList<Pedido> pedidos = new ArrayList<>();
        try {
            Class.forName(JDBC_DRIVER);
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement ps = c.prepareStatement("SELECT v.id, v.data, v.usuario_id, vp.quantidade, pr.nome,  pr.preco FROM venda v JOIN venda_produto vp ON v.id=vp.venda_id JOIN produto pr ON vp.produto_id=pr.id");
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setId(rs.getInt("id"));
                pedido.setDataCompra(rs.getString("data"));
                pedido.setCliente(rs.getInt("usuario_id"));
                pedido.setQtde(rs.getInt("quantidade"));
                pedido.setProduto(rs.getString("nome"));
                pedido.setValor(rs.getFloat("preco"));
                        
                pedidos.add(pedido);
            }
            rs.close();
            ps.close();
            c.close();
        } catch (ClassNotFoundException | SQLException ex) {
            return null;
        }
        return pedidos;
    }

}
