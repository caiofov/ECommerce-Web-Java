<%@page import="produto.modelo.Produto"%>
<%@include file="../../../cabecalho.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Produto produto = (Produto) request.getAttribute("produto");
    if (produto == null) {
%>
    <p>Produto não encontrado</p>
<%
    } else{
%>
    <h2><%= produto.getNome()%></h2>
    <b>R$ <%= produto.getPrecoString()%></b>

    <div class="d-flex flex-row flex-align-center">
        <img width="30%" height="auto" class="figure-img img-thumbnail rounded" alt="<%= produto.getNome()%>" src="<%= produto.getFoto()%>">
        <p><%= produto.getDescricao()%></p>
    </div>

<%
    }
%>
<%@include file="../../../rodape.jsp" %>

