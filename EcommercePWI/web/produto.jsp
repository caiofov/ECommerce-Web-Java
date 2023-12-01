<%@page import="produto.modelo.Produto"%>
<%@page import="categoria.modelo.Categoria"%>

<%@include file="../../../cabecalho.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Verifica se foi encontrado um produto -->
<%
    Produto produto = (Produto) request.getAttribute("produto");
    Categoria categoria = (Categoria) request.getAttribute("categoria");
    if (produto == null) {
%>
<p>Produto não encontrado</p>
<%
    } else{
%>

<div class="d-flex flex-row flex-align-center justify-content-between">
    <h2><%= produto.getNome()%></h2>

    <!-- Se for admin, exibe opções de edição -->
    <%
        if (logado && usuario.isAdministrador()) {
    %>
    <div class="d-flex flex-row flex-align-center flex-justify-end">
        <a title="Editar" class="text-decoration-none" href="GetAlterarProduto?id=<%= produto.getId() %>">
            <%@include file="../../../imagens/svg/pencil.svg" %>
        </a>

        <a title="Excluir" class="text-decoration-none" href="ExcluirProduto?id=<%= produto.getId() %>">
            <%@include file="../../../imagens/svg/trash.svg" %>
        </a>
    </div>
    <%
        }
    %>
</div>

<div class="d-flex flex-row flex-align-center justify-content-between">
    <b>R$ <%= produto.getPrecoString()%></b>

    <div class="d-flex flex-column flex-align-center">
        <a href="AdicionarProdutoCarrinho?produtoId=<%= produto.getId()%>" class="btn btn-warning"><%@include file="../../../../imagens/svg/basket.svg" %> Comprar</a>
        <small> (<%= produto.getQuantidade()%> produto(s) em estoque)</small>
    </div>
</div>

<div class="d-flex flex-row flex-align-center">
    <img width="30%" height="auto" class="figure-img img-thumbnail rounded" alt="<%= produto.getNome()%>" src="<%= produto.getFoto()%>"/>
    <div class="d-flex flex-column">
        <small> Categoria: <a href="GetCategoria?id=<%= categoria.getId() %>"><%= categoria.getNome() %></a></small>
        <p><%= produto.getDescricao()%></p>
    </div>
</div>


<%
    }
%>
<%@include file="../../../rodape.jsp" %>

