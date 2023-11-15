<%@page import="produto.modelo.Produto"%>
<%@include file="cabecalho.jsp" %>
<%
    Produto produto = (Produto) request.getAttribute("produto");
    if (produto == null) {
%>
    <p>Produto não encontrado</p>
<%
    } else{
%>
    <h1><%= p.getDescricao()%></h1>
<%
    }
%>
<%@include file="rodape.jsp" %>

