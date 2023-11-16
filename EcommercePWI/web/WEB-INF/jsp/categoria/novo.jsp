<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../../../cabecalho.jsp" %>
        <h1>Cadastrar uma nova categoria</h1>
        <form action="InserirCategoria" method="post">
            <div class="mb-3">
                <label for="inputNomeCateg" class="form-label">Nome</label>
                <input type="text" name="nome" class="form-control" id="inputNomeCateg" aria-describedby="nomeCategHelp">
                <div id="nomeCategHelp" class="form-text">Campo obrigatório.</div>
            </div>
           
            <button type="submit" class="btn btn-primary">Cadastrar</button>
        </form>
        <br/>
        <a href="Inicio" class="btn btn-primary">Voltar</a>

<%@include file="../../../rodape.jsp" %>
