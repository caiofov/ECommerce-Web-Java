<%@page import="categoria.modelo.Categoria"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Categorias</h1>
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
        <div>Não há categorias a serem listadas.</div>
        <%
            } else {
        %>
        <table>
            <tr>
                <td>Id</td>
                <td>Nome</td>
                <td>&nbsp;</td>
            </tr>
            <% 
                for (Categoria c : categorias) {
            %>
            <tr>
                <td><%= c.getId() %></td>
                <td><%= c.getNome() %></td>
                <td>
                    <a href="MostrarCategoria?id=<%= c.getId() %>">Mostrar</a>
                    <a href="ExcluirCategoria?id=<%= c.getId() %>">Excluir</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            }
        %>
        <a href="NovaCategoria">Nova categoria</a>
    </body>
</html>
