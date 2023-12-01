
<%@include file="../../cabecalho.jsp" %>

<%-- <%@include file="auth.jsp" %> --%>
 
<h1>Área Administrativa</h1>
<ul>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/NovoProduto">Novo Produto</a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/admin/ListarCategoria">Categorias</a>
                        </li>
                        </ul>
<%-- <% } %> --%>
<%@include file="../../rodape.jsp" %>
