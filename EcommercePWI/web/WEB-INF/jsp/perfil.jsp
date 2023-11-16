<%@page import="usuario.modelo.Usuario"%>
<%@include file="../../../cabecalho.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Verifica se foi encontrado um usuario -->
<%
    Usuario usuarioPerfil = (Usuario) request.getAttribute("perfil");
    if (usuarioPerfil == null) {
%>
    <p>Usuário não encontrado</p>
<%
    } else{
%>

<div class="d-flex flex-row flex-align-center justify-content-between">
    <h2><%= usuarioPerfil.getNome()%></h2>
    <h2><%= usuarioPerfil.getEndereco()%></h2>
    <h2><%= usuarioPerfil.getEmail()%></h2>
    <h2><%= usuarioPerfil.getLogin()%></h2>
    <h2><%= usuarioPerfil.getSenha()%></h2>    
    
    <div class="d-flex flex-row flex-align-center flex-justify-end">
            <a title="Editar" class="text-decoration-none" href="AlterarConta?id=<%= usuarioPerfil.getId() %>">
            <%@include file="../../../imagens/svg/pencil.svg" %>
        </a>

        <a title="Excluir" class="text-decoration-none" href="ExcluirConta?id=<%= usuarioPerfil.getId() %>">
            <%@include file="../../../imagens/svg/trash.svg" %>
        </a>
    </div>
    <%
        }
    %>
</div>
<%@include file="../../../rodape.jsp" %>
