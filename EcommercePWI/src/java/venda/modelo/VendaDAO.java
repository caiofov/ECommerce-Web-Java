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
     * Método utilizado para remover uma venda
     *
     * @param id
     * @return
     */
    public boolean remover(int id) {
        boolean sucesso = false;
        try {
            Class.forName(JDBC_DRIVER);
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);

            PreparedStatement psProdutosId = c.prepareStatement("SELECT * FROM venda_produto WHERE venda_id = ?");
            psProdutosId.setInt(1, id);
            ResultSet rs = psProdutosId.executeQuery();

            //Atualizar a quantidade dos produtos
            while (rs.next()) {
                int idProduto = rs.getInt("produto_id");
                int quantidade = rs.getInt("quantidade");

                PreparedStatement psUpdateProdutos = c.prepareStatement("UPDATE produto SET quantidade = quantidade + ? WHERE id = ?");
                psUpdateProdutos.setInt(2, idProduto);
                psUpdateProdutos.setInt(1, quantidade);
                sucesso = psUpdateProdutos.executeUpdate() == 1;
                psUpdateProdutos.close();
            }
            sucesso = true;
            psProdutosId.close();

            //Excluir os registros dos produtos vendidos
            PreparedStatement psVendaProduto = c.prepareStatement("DELETE FROM venda_produto WHERE venda_id = ?");
            psVendaProduto.setInt(1, id);

            sucesso = (psVendaProduto.executeUpdate() == 1);
            psVendaProduto.close();

            if (!sucesso) {
                c.close();
                return false;
            }

            //Excluir a venda
            PreparedStatement psVenda = c.prepareStatement("DELETE FROM venda WHERE id = ?");
            psVenda.setInt(1, id);
            sucesso = (psVenda.executeUpdate() == 1);
            psVenda.close();
            c.close();

        } catch (ClassNotFoundException | SQLException ex) {
            return false;
        }
        return sucesso;
    }

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
    
    /**
     * Método utilizado para listar total de compras por cliente no ano
     *
     * @return
     */
    public ArrayList<ArrayList> listarTotalPedidosPorClienteAno() {
        ArrayList<ArrayList> pedidosPorCliente = new ArrayList();
        try {
            Class.forName(JDBC_DRIVER);
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement ps = c.prepareStatement(
                    "SELECT u.id, u.nome, COUNT(v.id) AS npedidos FROM venda v JOIN usuario u ON v.usuario_id = u.id WHERE v.data >= to_timestamp('01-01-2023 00:00:01', 'dd-mm-yyyy hh24:mi:ss') AND v.data <= CURRENT_TIMESTAMP GROUP BY u.id ORDER BY npedidos DESC");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ArrayList<Object> cliente = new ArrayList();
                cliente.add(rs.getInt(1));
                cliente.add(rs.getString(2));
                cliente.add(rs.getInt(3));
                pedidosPorCliente.add(cliente);
            }
            rs.close();
            ps.close();
            c.close();
        } catch (ClassNotFoundException | SQLException ex) {
            String errorMessage = ex.getMessage();
            ArrayList al = new ArrayList();
            al.add(errorMessage);
            return al;
        }
        return pedidosPorCliente;
    }
    
    public ArrayList<ArrayList> listarFaturamentoPorDiaAno() {
        ArrayList<ArrayList> datas = new ArrayList();
        try {
            Class.forName(JDBC_DRIVER);
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement ps = c.prepareStatement(
                    "SELECT v.data, SUM(pr.preco * vp.quantidade) AS soma FROM venda v JOIN venda_produto vp on v.id = vp.venda_id JOIN produto pr on vp.produto_id = pr.id WHERE v.data >= to_timestamp('01-01-2023 00:00:01', 'dd-mm-yyyy hh24:mi:ss') AND v.data <= CURRENT_TIMESTAMP GROUP BY v.data ORDER BY soma ASC");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ArrayList<Object> data = new ArrayList();
                data.add(rs.getString(1));
                data.add(rs.getFloat(2));
                datas.add(data);
            }
            rs.close();
            ps.close();
            c.close();
        } catch (ClassNotFoundException | SQLException ex) {
            ArrayList<ArrayList> al = new ArrayList<>();
            return al;
        }
        return datas;
    }

}
