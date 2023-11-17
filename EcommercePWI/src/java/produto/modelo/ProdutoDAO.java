package produto.modelo;

import static config.Config.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Classe que implementa o padrão DAO para a entidade produto
 */
public class ProdutoDAO {

    /**
     * Método utilizado para inserir um novo produto
     *
     * @param nome
     * @param descricao
     * @param preco
     * @param foto
     * @param quantidade
     * @param categoria
     * @return
     */
    public boolean inserir(String nome, String descricao, double preco, String foto, int quantidade, int categoria) {
        boolean sucesso = false;
        try {
            Class.forName(JDBC_DRIVER);
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement ps = c.prepareStatement("INSERT INTO produto (descricao, preco, foto, quantidade, categoria, nome) VALUES (?, ?, ?, ?, ?, ?)");
            ps.setString(1, descricao);
            ps.setDouble(2, preco);
            ps.setString(3, foto);
            ps.setInt(4, quantidade);
            ps.setInt(5, categoria);
            ps.setString(6, nome);

            sucesso = (ps.executeUpdate() == 1);
            ps.close();
            c.close();
        } catch (ClassNotFoundException | SQLException ex) {
            return false;
        }
        return sucesso;
    }

    /**
     * Método utilizado para listar todos os produtos em estoque
     *
     * @return
     */
    public List<Produto> listarProdutosEmEstoque() {
        List<Produto> produtos = new ArrayList();
        try {
            Class.forName(JDBC_DRIVER);
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement ps = c.prepareStatement("SELECT * FROM produto WHERE quantidade > 0");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Produto p = new Produto();
                p.setId(rs.getInt("id"));
                p.setDescricao(rs.getString("descricao"));
                p.setNome(rs.getString("nome"));
                p.setFoto(rs.getString("foto"));
                p.setPreco(rs.getDouble("preco"));
                p.setQuantidade(rs.getInt("quantidade"));
                p.setCategoriaId(rs.getInt("categoria_id"));
                produtos.add(p);
            }
            rs.close();
            ps.close();
            c.close();
        } catch (ClassNotFoundException | SQLException ex) {
            return new ArrayList();
        }
        return produtos;
    }

    /**
     * Método utilizado para listar todos os produtos em uma categoria
     *
     * @param categoriaId
     * @return
     */
    public List<Produto> listarProdutosCategoria(int categoriaId) {
        List<Produto> produtos = new ArrayList();
        try {
            Class.forName(JDBC_DRIVER);
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement ps = c.prepareStatement("SELECT * FROM produto WHERE categoria_id=?");
            ps.setInt(1, categoriaId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Produto p = new Produto();
                p.setId(rs.getInt("id"));
                p.setDescricao(rs.getString("descricao"));
                p.setNome(rs.getString("nome"));
                p.setFoto(rs.getString("foto"));
                p.setPreco(rs.getDouble("preco"));
                p.setQuantidade(rs.getInt("quantidade"));
                p.setCategoriaId(rs.getInt("categoria_id"));
                produtos.add(p);
            }
            rs.close();
            ps.close();
            c.close();
        } catch (ClassNotFoundException | SQLException ex) {
            return new ArrayList();
        }
        return produtos;
    }

    /**
     * Método utilizado para excluir um produto
     *
     * @param id
     * @return
     */
    public boolean excluir(int id) {
        boolean sucesso = false;
        try {
            Class.forName(JDBC_DRIVER);
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement ps = c.prepareStatement("DELETE FROM produto WHERE id = ?");
            ps.setInt(1, id);
            sucesso = (ps.executeUpdate() == 1);
            ps.close();
            c.close();
        } catch (ClassNotFoundException | SQLException ex) {
            return false;
        }
        return sucesso;
    }

    public boolean atualizar(String nome,String descricao, double preco, String foto, int quantidade, int categoria, int id) {
        boolean sucesso = false;
        try {
            Class.forName(JDBC_DRIVER);
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement ps = c.prepareStatement("UPDATE produto SET nome = ?,descricao = ?,preco = ?, foto = ?,quantidade = ?,categoria_id = ? WHERE id = ?");
            // (nome, endereco, email, login, senha, administrador)
            ps.setString(1, nome);
            ps.setString(2, descricao);
            ps.setDouble(3, preco);
            ps.setString(4, foto);
            ps.setInt(5, quantidade);
            ps.setInt(6, categoria);
            ps.setInt(7, id);
            sucesso = (ps.executeUpdate() == 1);
            ps.close();
            c.close();
        } catch (ClassNotFoundException | SQLException ex) {
            return false;
        }
        return sucesso;
    }

    public Produto get(Integer id) {
        try {
            Class.forName(JDBC_DRIVER);
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement ps = c.prepareStatement("SELECT * FROM produto WHERE id=?");
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            Produto p = null;
            while (rs.next()) {
                p = new Produto();
                p.setId(rs.getInt("id"));
                p.setDescricao(rs.getString("descricao"));
                p.setNome(rs.getString("nome"));
                p.setFoto(rs.getString("foto"));
                p.setPreco(rs.getDouble("preco"));
                p.setCategoriaId(rs.getInt("categoria_id"));
                p.setQuantidade(rs.getInt("quantidade"));
                break;
            }
            rs.close();
            ps.close();
            c.close();
            return p;

        } catch (ClassNotFoundException | SQLException ex) {
            return null;
        }

    }
}
