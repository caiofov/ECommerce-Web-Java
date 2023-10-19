package pedido.modelo;

/**
 * Classe que representa a entidade pedido
 */
public class Pedido {
    
    private int id;
    private String dataCompra;
    private int qtdeTotal;
    private float valorTotal;
    private int cliente;
    private int[] itens;
    private int[] qtdes;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDataCompra() {
        return dataCompra;
    }

    public void setDataCompra(String dataCompra) {
        this.dataCompra = dataCompra;
    }

    public int getQtdeTotal() {
        return qtdeTotal;
    }

    public void setQtdeTotal(int qtdeTotal) {
        this.qtdeTotal = qtdeTotal;
    }

    public float getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(float valorTotal) {
        this.valorTotal = valorTotal;
    }

    public int getCliente() {
        return cliente;
    }

    public void setCliente(int cliente) {
        this.cliente = cliente;
    }

    public int[] getItens() {
        return itens;
    }

    public void setItens(int[] itens) {
        this.itens = itens;
    }

    public int[] getQtdes() {
        return qtdes;
    }

    public void setQtdes(int[] qtdes) {
        this.qtdes = qtdes;
    }
}
