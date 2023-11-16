<%@page import="categoria.modelo.Categoria"%>
<%@page import="produto.modelo.Produto"%>
<%@page import="java.util.List"%>

<%@include file="../../../cabecalho.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Verifica se foi encontrada uma categoria -->
<%
    Categoria categoria = (Categoria) request.getAttribute("categoria");
    List<Produto> produtos = (List<Produto>) request.getAttribute("produtos");

    
    if (categoria == null) {
%>
    <p>Categoria nÃ£o encontrada</p>
<%
    } else{
%>

    <h1><%= categoria.getNome() %></h1>

    <%
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
                    <h5 class="card-title"><%= p.getNome() %></h5>
                    <p class="card-text"><b>R$ <%= p.getPrecoString() %></b> - <%= p.getDescricao() %></p>
                </div>
                <div class="card-footer">
                    <small class="text-muted"><a href="GetProduto?id=<%= p.getId() %>" class="btn btn-primary">Comprar</a></small>
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
<%
    }
%>
<%@include file="../../../rodape.jsp" %>

