
<%@include file="../../cabecalho.jsp" %>

<%@include file="auth.jsp" %>

<h1>√Årea Administrativa</h1>
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
        <a href="${pageContext.request.contextPath}/RelatorioProdutosFaltando">RelatÛrio de Produtos Esgotados</a>
    </li>
    <li class="nav-item">
        <a href="${pageContext.request.contextPath}/RelatorioTotalCompras">RelatÛrio Pedidos por Usu·rio</a>
    </li>
    <li class="nav-item">
        <a href="${pageContext.request.contextPath}/RelatorioFaturamentoDia">RelatÛrio de Faturamento por Dia</a>
    </li>
</ul>
<% } %>
<%@include file="../../rodape.jsp" %>
