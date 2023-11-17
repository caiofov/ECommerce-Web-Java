<%@page import="usuario.modelo.Usuario"%>
<%@include file="cabecalho.jsp" %>
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
    <div class="container rounded bg-white mt-5 mb-5">
        <div class="row">
            <div class="col-md-3 border-right">
                <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span class="font-weight-bold"><%= usuarioPerfil.getNome()%></span><span class="text-black-50"> <%= usuarioPerfil.getEmail()%> </span><span> </span></div>
            </div>
            <div class="col-md-5 border-right">
                <div class="p-3 py-5">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-right">Profile Settings</h4>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12"><label class="labels">Nome</label><input type="text" class="form-control" value= <%= usuarioPerfil.getNome()%> ></div>
                        <div class="col-md-12"><label class="labels">Endereço</label><input type="text" class="form-control" value= <%= usuarioPerfil.getEndereco()%> ></div>
                        <div class="col-md-12"><label class="labels">E-mail</label><input type="text" class="form-control" value= <%= usuarioPerfil.getEmail()%> ></div>
                        <div class="col-md-12"><label class="labels">Login</label><input type="text" class="form-control" value= <%= usuarioPerfil.getLogin()%> ></div>
                        <div class="col-md-12"><label class="labels">Senha</label><input type="text" class="form-control" value= <%= usuarioPerfil.getSenha()%> ></div>
                    </div>
                </div>
                <div class="d-flex flex-row flex-align-center flex-justify-end">
                    <a title="Editar" class="mt-5 text-center" href="AlterarConta?id=<%= usuarioPerfil.getId() %>">
                        <%@include file="../../../imagens/svg/pencil.svg" %>
                    </a>
                    <a title="Excluir" class="mt-5 text-center" href="ExcluirConta?id=<%= usuarioPerfil.getId() %>">
                        <%@include file="../../../imagens/svg/trash.svg" %>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <%
        }
    %>
</div>
<%@include file="rodape.jsp" %>
