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
    <h2><%= produto.getDescricao()%></h2>
    <img src="<%= produto.getFoto()%>" alt="<%= produto.getDescricao()%>">
    <h3>R$ <%= produto.getPrecoString()%></h3>

<%
    }
%>
<%@include file="../../../rodape.jsp" %>

