<%-- 
    Document   : novoCliente
    Created on : 15 de set de 2023, 14:52:02
    Author     : Leonardo Oliveira Moreira
--%>

<%@include file="cabecalho.jsp" %>
        <h1>Cadastrar um Novo Cliente</h1>
        <form action="InserirCliente" method="post">
            <p class="form-text">Todos os campos são obrigatórios.</p>

            <div class="mb-3">
                <label for="inputNome" class="form-label">Nome completo</label>
                <input required type="text" name="nome" class="form-control" id="inputNome" aria-describedby="nomeHelp">
            </div>
            <div class="mb-3">
                <label for="inputEndereco" class="form-label">Endereço</label>
                <input required type="text" name="endereco" class="form-control" id="inputEndereco" aria-describedby="enderecoHelp">
            </div>
            <div class="mb-3">
                <label for="inputEmail" class="form-label">E-mail</label>
                <input required type="email" name="email" class="form-control" id="inputEmail" aria-describedby="emailHelp">
            </div>

            
            <div class="mb-3">
                <label for="inputLogin" class="form-label">Login</label>
                <input required type="text" name="login" class="form-control" id="inputLogin" aria-describedby="loginHelp">
            </div>

            <div class="mb-3">
                <label for="inputSenha" class="form-label">Senha</label>
                <input required type="password" name="senha" class="form-control" id="inputSenha" aria-describedby="senhaHelp">
            </div>
            <button type="submit" class="btn btn-primary">Cadastrar</button>
        </form>
        <br/>
        <a href="Inicio" class="btn btn-primary">Voltar</a>
<%@include file="rodape.jsp" %>
