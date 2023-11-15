<%@page import="categoria.modelo.Categoria"%>
<%@page import="usuario.modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../../../cabecalho.jsp" %>
    <%
     if (usuario == null || !(usuario instanceof Usuario) || !usuario.isAdministrador()){
    %>
    <p>Não autorizado</p>
    <%
     }else{
    %>
    <div class="d-flex align-items-center justify-content-between">
        <h1>Categorias</h1>
        <a title="Adicionar" class="text-decoration-none" href="NovaCategoria">
            <%@include file="../../../imagens/svg/add.svg" %>
        </a>
    </div>

        <%
            if (request.getAttribute("mensagem") != null) {
        %>
        <div><%= request.getAttribute("mensagem") %></div>
        <%
            }
        %>
        <% 
            List<Categoria> categorias = (List<Categoria>) request.getAttribute("categorias");
            if (categorias == null || categorias.isEmpty()) {
        %>
        <div>NÃ£o hÃ¡ categorias a serem listadas.</div>
        <%
            } else {
        %>
        <table class='table'>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Nome</th>
                <th scope="col">&nbsp;</th>
            </tr>
            <% 
                for (Categoria c : categorias) {
            %>
            <tr>
                <th scope="row"><%= c.getId() %></th>
                <td><%= c.getNome() %></td>
                <td>
                    <a title="Mostrar" class="text-decoration-none" href="MostrarCategoria?id=<%= c.getId() %>">
                        <%@include file="../../../imagens/svg/eye.svg" %>
                    </a>

                    <a title="Excluir" class="text-decoration-none" href="ExcluirCategoria?id=<%= c.getId() %>">
                        <%@include file="../../../imagens/svg/trash.svg" %>
                    </a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            }}
        %>
<%@include file="../../../rodape.jsp" %>

