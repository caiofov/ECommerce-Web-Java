<%@page import="categoria.modelo.Categoria"%>
<%@page import="usuario.modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../../../cabecalho.jsp" %>
<%@include file="../auth.jsp" %>

        <div class="d-flex align-items-center justify-content-between">
            <h1>Categorias</h1>
            <a title="Adicionar" class="text-decoration-none" href="NovaCategoria">
                <%@include file="../../../imagens/svg/add.svg" %>
            </a>
        </div>

        <%
            if (request.getAttribute("mensagem") != null) {
        %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <%= request.getAttribute("mensagem") %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <%
            }
        %>

        <%-- verificar se existem categorias --%>
        <% 
            List<Categoria> categorias = (List<Categoria>) request.getAttribute("categorias");
            if (categorias == null || categorias.isEmpty()) {
        %>
            <div>Não há categorias a serem listadas.</div>

        <%
            } else {
        %>
            <table class='table'>
                <%-- Cabeçalho da tabela --%>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Nome</th>
                    <th scope="col">&nbsp;</th>
                </tr>
                
                <%-- Cada linha da tabela é uma categoria --%>
                <% 
                    for (Categoria c : categorias) {
                %>
                    <tr>
                        <th scope="row"><%= c.getId() %></th>
                        <td><%= c.getNome() %></td>
                        <td>
                            <a title="Mostrar" class="text-decoration-none" href="GetCategoria?id=<%= c.getId() %>">
                                <%@include file="../../../imagens/svg/eye.svg" %>
                            </a>

                            <a title="Editar" class="text-decoration-none" href="GetAlterarCategoria?id=<%= c.getId() %>">
                                <%@include file="../../../imagens/svg/pencil.svg" %>
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
                }
            %>
    <%
        }
    %>
<%@include file="../../../rodape.jsp" %>

