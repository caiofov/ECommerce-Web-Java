package carrinhocompras.modelo;

import java.util.ArrayList;
import java.util.List;
import produto.modelo.ProdutoDAO;

public class CarrinhoCompras {

    private static final String SEPARADOR_ITEM = "S";
    private static final String SEPARADOR_CAMPOS = "C";

    /**
     * Método para adicionar um novo produto ao carrinho de compras
     *
     * @param cookieString
     * @param produtoId
     * @return
     */
    public static String adicionar(String cookieString, int produtoId) {
        if (cookieString != null && cookieString.length() > 0) {
            String[] itens = cookieString.split(SEPARADOR_ITEM);
            cookieString = "";
            boolean inseriu = false;
            for (int i = 0; i < itens.length; i++) {
                String[] item = itens[i].split(SEPARADOR_CAMPOS);
                int id = Integer.parseInt(item[0]);
                int quantidade = Integer.parseInt(item[1]);
                if (id == produtoId) {
                    quantidade++;
                    inseriu = true;
                }
                if (cookieString.isEmpty()) {
                    cookieString += id + SEPARADOR_CAMPOS + quantidade;
                } else {
                    cookieString += SEPARADOR_ITEM + id + SEPARADOR_CAMPOS + quantidade;
                }
            }
            if (!inseriu) {
                cookieString += SEPARADOR_ITEM + produtoId + SEPARADOR_CAMPOS + 1;
            }
        } else {
            cookieString = produtoId + SEPARADOR_CAMPOS + 1;
        }
        return cookieString;
    }

    /**
     * Método utilizado para transformar a string do cookie em uma lista de
     * itens do carrinho de compra
     *
     * @param cookieString
     * @return
     */
    public static List<CarrinhoCompraItem> obterCarrinho(String cookieString) {
        List<CarrinhoCompraItem> resultado = new ArrayList<>();
        ProdutoDAO produtoDAO = new ProdutoDAO();
        if (cookieString != null && cookieString.length() > 0) {
            String[] itens = cookieString.split(SEPARADOR_ITEM);
            for (String registro : itens) {

                String[] item = registro.split(SEPARADOR_CAMPOS);
                int id = Integer.parseInt(item[0]);
                int quantidade = Integer.parseInt(item[1]);

                CarrinhoCompraItem carrinhoCompraItem = new CarrinhoCompraItem();
                carrinhoCompraItem.setProduto(produtoDAO.get(id));
                carrinhoCompraItem.setQuantidade(quantidade);

                resultado.add(carrinhoCompraItem);
            }
        }
        return resultado;
    }

    /**
     * Método utilizado para remover um produto do carrinho de compras
     *
     * @param cookieString
     * @param produtoId
     * @return
     */
    public static String remover(String cookieString, int produtoId) {
        List<CarrinhoCompraItem> itens = obterCarrinho(cookieString);
        cookieString = "";
        for (CarrinhoCompraItem registro : itens) {
            if (registro.getProduto().getId() == produtoId) {
                continue;
            } else {
                if (cookieString.isEmpty()) {
                    cookieString = registro.getProduto().getId() + SEPARADOR_CAMPOS + registro.getQuantidade();
                } else {
                    cookieString += SEPARADOR_ITEM + registro.getProduto().getId() + SEPARADOR_CAMPOS + registro.getQuantidade();
                }
            }

        }
        return cookieString;
    }

}
