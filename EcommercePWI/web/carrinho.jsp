<%@page import="carrinhocompras.modelo.CarrinhoCompras"%>
<%@page import="carrinhocompras.modelo.CarrinhoCompraItem"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="produto.modelo.Produto"%>
<%@page import="java.util.List"%>

<%@include file="cabecalho.jsp" %>
<%
    Cookie cookie = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            if (c.getName().equals("smdecommerce.carrinho")) {
                cookie = c;
                break;
            }
        }
    }
    if (cookie != null && cookie.getValue().length() > 0) {
%>
<hr/>
<h1>Carrinho de Compras</h1>
<table class="table table-striped">
    <thead>
        <tr>
            <%-- //TODO: colocar uma imagens pequena dos produtos--%>
            <th scope="col">Produto</th>
            <th scope="col">Quantidade</th>
            <th scope="col">Preço R$</th>
            <th scope="col">Total R$</th>
            <th scope="col"></th>
        </tr>
    </thead>
    <tbody>
        <%
                DecimalFormat realFormat = new DecimalFormat("#,##0.00");
                List<CarrinhoCompraItem> itens = (List<CarrinhoCompraItem>) CarrinhoCompras.obterCarrinho(cookie.getValue());
                double total = 0;
                if (itens != null && !itens.isEmpty()) {
                    for (int i = 0; i < itens.size(); i++) {
        %>
        <tr>
            <% Produto produto = itens.get(i).getProduto();%>
            <td><a href="GetProduto?id=<%= produto.getId() %>"><%= produto.getNome() %></a></td>

            <td><%= itens.get(i).getQuantidade() %></td>

            <td><%= realFormat.format(produto.getPreco()) %></td>

            <td>

                <%-- //TODO: botão para remover só um (não todos)--%>
                <%= realFormat.format(produto.getPreco() * itens.get(i).getQuantidade()) %>
                <a class="text-decoration-none" href="AdicionarProdutoCarrinho?produtoId=<%= produto.getId() %>&irPara=Carrinho">
                    <%@include file="imagens/svg/add.svg" %>
                </a>
            </td>

            <td>
                <a title="Remover" href="RemoverProdutoCarrinho?produtoId=<%= produto.getId() %>&irPara=Carrinho"  aria-disabled="true">
                    <%@include file="imagens/svg/trash.svg" %>
                </a>
            </td>

        </tr>
        <%
            total += produto.getPreco() * itens.get(i).getQuantidade();
        }
    }  
        %>
    </tbody>
</table>
<h4>Total R$: <%= realFormat.format(total) %></h4>
<% 
        if (usuario != null && usuario instanceof Usuario && !usuario.isAdministrador()) {
%>
<a href="VendaInserir" class="btn btn-primary" role="button" aria-disabled="true">Finalizar Compra</a>
<%
        }    
    } else {
%>
<div class="alert alert-info alert-dismissible fade show mt-4" role="alert">
    Sem produtos no carrinho de compras
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<%
    }
%>

<%@include file="rodape.jsp" %>
