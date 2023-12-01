<%@page import="pedido.modelo.Pedido"%>
<%@page import="java.util.ArrayList"%>
<%@page import="carrinhocompras.modelo.CarrinhoCompras"%>
<%@page import="carrinhocompras.modelo.CarrinhoCompraItem"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="produto.modelo.Produto"%>
<%@page import="java.util.List"%>

<%@include file="../../cabecalho.jsp" %>
<hr/>
<h1>Pedidos</h1>
<table class="table table-striped">
    <thead>
        <tr>
            <%-- //TODO: colocar uma imagens pequena dos produtos--%>
            <th scope="col">Id do usuario</th>
            <th scope="col">N� do Pedido</th>
            <th scope="col">Data do Pedido</th>
            <th scope="col">Produto</th>
            <th scope="col">Quantidade</th>
            <th scope="col">Valor Unit�rio</th>
            <th scope="col"></th>
            
        </tr>
    </thead>
    <tbody>
        <%
        ArrayList<Pedido> pedidos = (ArrayList<Pedido>) request.getAttribute("pedidos");
        if (pedidos != null && !pedidos.isEmpty()) {
            for (int i = 0; i < pedidos.size(); i++) {
                System.out.println(pedidos.get(i));
        %>
        <tr>
            <% Pedido pedido = pedidos.get(i);%>
            <td><%= pedido.getCliente() %></td>
            
            <td><%= pedido.getId() %></td>

            <td><%= pedido.getDataCompra() %></td>
            
            <td><%= pedido.getProduto() %></td>
            
            <td><%= pedido.getQtde() %></td>
            
            <td><%= pedido.getValor() %></td>
            
            <td><a title="Excluir" class="text-decoration-none" href="RemoverPedido?id=<%= pedido.getId() %>">
            <%@include file="../../imagens/svg/trash.svg" %>
            </a>
            </td>
        </tr>
            
        <%
            }
        }
        else {
        %>
        <div class="alert alert-info alert-dismissible fade show mt-4" role="alert">
            Sem pedidos feitos
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <%
        }
        %>
    </tbody>
</table>
<%@include file="../../rodape.jsp" %>
