package categoria.modelo;

import produto.modelo.*;
import static config.Config.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoriaDAO {

    /**
     * Método utilizado para inserir uma nova categoria
     *
     * @param nome
     * @return
     */
    public boolean inserir(String nome) {
        boolean sucesso = false;
        try {
            Class.forName(JDBC_DRIVER);
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement ps = c.prepareStatement("INSERT INTO categoria (nome) VALUES (?)");
            ps.setString(1, nome);
            sucesso = (ps.executeUpdate() == 1);
            ps.close();
            c.close();
        } catch (ClassNotFoundException | SQLException ex) {
            return false;
        }
        return sucesso;
    }

    /**
     * Método utilizado para atualizar uma categoria existente
     *
     * @param nome
     * @param id
     * @return
     */
    public boolean atualizar(String nome, int id) {
        boolean sucesso = false;
        try {
            Class.forName(JDBC_DRIVER);
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement ps = c.prepareStatement("UPDATE categoria SET nome = ? WHERE id = ?");
            ps.setString(1, nome);
            ps.setInt(2, id);
            sucesso = (ps.executeUpdate() == 1);
            ps.close();
            c.close();
        } catch (ClassNotFoundException | SQLException ex) {
            return false;
        }
        return sucesso;
    }

    public boolean excluir(int id) {
        boolean sucesso = false;
        try {
            Class.forName(JDBC_DRIVER);
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement ps = c.prepareStatement("DELETE FROM categoria WHERE id = ?");
            ps.setInt(1, id);
            sucesso = (ps.executeUpdate() == 1);
            ps.close();
            c.close();
        } catch (ClassNotFoundException | SQLException ex) {
            return false;
        }
        return sucesso;
    }

    /**
     * Método utilizado para listar todas as categorias
     *
     * @param nome
     * @return
     */
    public List<Categoria> listar(String nome) {
        if (nome == null || nome.length() == 0) {
            nome = "%";
        } else {
            nome = "%" + nome + "%";
        }
        List<Categoria> categorias = new ArrayList();
        try {
            Class.forName(JDBC_DRIVER);
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement ps = c.prepareStatement("SELECT id, nome FROM categoria WHERE upper(nome) LIKE upper(?)");
            ps.setString(1, nome);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Categoria p = new Categoria();
                p.setId(rs.getInt("id"));
                p.setNome(rs.getString("nome"));
                categorias.add(p);
            }
            rs.close();
            ps.close();
            c.close();
        } catch (ClassNotFoundException | SQLException ex) {
            return new ArrayList();
        }
        return categorias;
    }

    /**
     * Método utilizado para listar uma categoria existente
     *
     * @param id
     * @return
     */
    public Categoria get(int id) {
        Categoria cat = null;
        try {
            Class.forName(JDBC_DRIVER);
            Connection c = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement ps = c.prepareStatement("SELECT id, nome FROM categoria WHERE id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                cat = new Categoria();
                cat.setId(rs.getInt("id"));
                cat.setNome(rs.getString("nome"));
            }
            rs.close();
            ps.close();
            c.close();
        } catch (ClassNotFoundException | SQLException ex) {
            return null;
        }
        return cat;
    }

}
