<%@page import="carrinhocompras.modelo.CarrinhoCompras"%>
<%@page import="carrinhocompras.modelo.CarrinhoCompraItem"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="produto.modelo.Produto"%>
<%@page import="java.util.List"%>

<%@include file="cabecalho.jsp" %>
<hr/>
<h1>Meus Pedidos</h1>
<table class="table table-striped">
    <thead>
        <tr>
            <%-- //TODO: colocar uma imagens pequena dos produtos--%>
            <th scope="col">Pedido</th>
            <th scope="col">Data do Pedido</th>
            <th scope="col"></th>
        </tr>
    </thead>
    <tbody>
        
    </tbody>
</table>
<%@include file="rodape.jsp" %>
