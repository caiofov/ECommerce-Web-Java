<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Usuario usuarioPerfil = (Usuario) request.getAttribute("perfil");
%>

<%@include file="cabecalho.jsp" %>
        <h1>Alterar Perfil</h1>
        <form action="AlterarPerfil?id=<%= usuarioPerfil.getId() %>" method="post">
            <div class="mb-3">
                <label for="inputNome" class="form-label">Nome completo</label>
                <input type="text" name="nome" class="form-control" id="inputNome" aria-describedby="nomeHelp" required value= <%= usuarioPerfil.getNome() %> >
                <div id="nomeHelp" class="form-text">Campo obrigatório.</div>
            </div>
            <div class="mb-3">
                <label for="inputEndereco" class="form-label">Endereço</label>
                <input type="text" name="endereco" class="form-control" id="inputEndereco" aria-describedby="enderecoHelp" required value= <%= usuarioPerfil.getEndereco() %>>
                <div id="enderecoHelp" class="form-text">Campo obrigatório.</div>
            </div>
            <div class="mb-3">
                <label for="inputEmail" class="form-label">E-mail</label>
                <input type="email" name="email" class="form-control" id="inputEmail" aria-describedby="emailHelp" required value= <%= usuarioPerfil.getEmail() %>>
                <div id="emailHelp" class="form-text">Campo obrigatório.</div>
            </div>

            
            <div class="mb-3">
                <label for="inputLogin" class="form-label">Login</label>
                <input type="text" name="login" class="form-control" id="inputLogin" aria-describedby="loginHelp" required value= <%= usuarioPerfil.getLogin() %>>
                <div id="loginHelp" class="form-text">Campo obrigatório.</div>
            </div>

            <div class="mb-3">
                <label for="inputSenha" class="form-label">Senha</label>
                <input type="password" name="senha" class="form-control" id="inputSenha" aria-describedby="senhaHelp" required value= <%= usuarioPerfil.getSenha() %>>
                <div id="senhaHelp" class="form-text">Campo obrigatório.</div>
            </div>
            <button type="submit" class="btn btn-primary">Cadastrar</button>
        </form>
        <br/>
        <a href="GetConta?id=<%= usuarioPerfil.getId() %>" class="btn btn-primary"> Voltar</a>
<%@include file="rodape.jsp" %>
