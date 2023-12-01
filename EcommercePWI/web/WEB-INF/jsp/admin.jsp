
<%@include file="../../cabecalho.jsp" %>

<%@include file="auth.jsp" %>

<h1>Área Administrativa</h1>
<ul>
    <li>
        <a href="${pageContext.request.contextPath}/NovoProduto">Novo Produto</a>
    </li>
    <li class="nav-item">
        <a href="${pageContext.request.contextPath}/ListarCategoria">Categorias</a>
    </li>
    <li class="nav-item">
        <a href="${pageContext.request.contextPath}/PedidosAdm">Pedidos</a>
    </li>
    <li class="nav-item">
        <a href="${pageContext.request.contextPath}/RelatorioProdutosFaltando">Relatório de produtos</a>
    </li>
</ul>
<% } %>
<%@include file="../../rodape.jsp" %>
