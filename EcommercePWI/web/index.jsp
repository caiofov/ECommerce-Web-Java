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
                <img src="" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title"><%= p.getDescricao() %></h5>
                    <p class="card-text"><%= p.getDescricao() %></p>
                </div>
                <div class="card-footer">
                    <small class="text-muted"><a href="#" class="btn btn-primary">Comprar</a></small>
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

