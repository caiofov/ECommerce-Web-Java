<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../../../cabecalho.jsp" %>
        <h1>Editar a categoria</h1>
        <form action="AlterarCategoria">
            <div class="mb-3">
                <label for="inputNomeCateg" class="form-label">Nome</label>
                <input type="text" name="nome" class="form-control" id="inputNomeCateg" aria-describedby="nomeCategHelp">
            </div>
           
            <button type="submit" class="btn btn-primary">Editar</button>
        </form>
        <br/>
        <a href="Inicio" class="btn btn-primary">Voltar</a>

<%@include file="../../../rodape.jsp" %>
