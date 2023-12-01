<%@page import="carrinhocompras.modelo.CarrinhoCompras"%>
<%@page import="carrinhocompras.modelo.CarrinhoCompraItem"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="produto.modelo.Produto"%>
<%@page import="java.util.List"%>
<%@include file="cabecalho.jsp" %>
<%
    List<Produto> produtos = (List<Produto>) request.getAttribute("produtosEmEstoque");
    if (produtos != null && !produtos.isEmpty()) {
%>
    <div class="row row-cols-1 row-cols-md-3 g-4">
    <%
        for (int i = 0; i < produtos.size(); i++) {
            Produto p = produtos.get(i);
    %>
        <div class="col">
            <div class="card h-100">
                <img src="<%= p.getFoto() %>" class="card-img-top img-thumbnail rounded" alt="<%= p.getNome() %>">
                <div class="card-body">
                    <h5 class="card-title"><a href="GetProduto?id=<%= p.getId() %>"><%= p.getNome() %></a></h5>
                    <p class="card-text"><b>R$ <%= p.getPrecoString() %></b> - <%= p.getDescricao() %></p>
                </div>
                <div class="card-footer">
                    <small class="text-muted"><a href="AdicionarProdutoCarrinho?produtoId=<%= p.getId()%>" class="btn btn-warning">Comprar</a></small>
                </div>
            </div>
        </div>
    <%
        }
    %>
    </div>
<%
    }
%>
<%@include file="rodape.jsp" %>