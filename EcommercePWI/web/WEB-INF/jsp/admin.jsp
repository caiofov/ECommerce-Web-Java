
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
        <a href="${pageContext.request.contextPath}/RelatorioProdutosFaltando">Relat�rio de Produtos Esgotados</a>
    </li>
    <li class="nav-item">
        <a href="${pageContext.request.contextPath}/RelatorioTotalCompras">Relat�rio Pedidos por Usu�rio</a>
    </li>
    <li class="nav-item">
        <a href="${pageContext.request.contextPath}/RelatorioFaturamentoDia">Relat�rio de Faturamento por Dia</a>
    </li>
</ul>
<% } %>
<%@include file="../../rodape.jsp" %>
