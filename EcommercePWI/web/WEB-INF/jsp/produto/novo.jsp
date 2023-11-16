<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../cabecalho.jsp" %>
        <h1>Cadastrar um novo produto</h1>
        <form action="NovoProduto" method="post">
            <div class="mb-3">
                <label for="inputNomeProd" class="form-label">Nome</label>
                <input type="text" name="nomeProd" class="form-control" id="inputNomeProd" aria-describedby="nomeProdHelp">
                <div id="nomeProdHelp" class="form-text">Campo obrigatório.</div>
            </div>
            <div class="mb-3">
                <label for="inputPreco" class="form-label">Preço</label>
                <input type="number" name="preco" class="form-control" id="inputPreco" aria-describedby="precoHelp">
                <div id="precoHelp" class="form-text">Campo obrigatório.</div>
            </div>
            <div class="mb-3">
                <label for="inputFoto" class="form-label">Foto</label>
                <input type="text" name="foto" class="form-control" id="inputFoto" aria-describedby="fotoHelp">
                <div id="fotoHelp" class="form-text">Campo obrigatório.</div>
            </div>

            
            <div class="mb-3">
                <label for="inputQtde" class="form-label">Quantidade em estoque</label>
                <input type="number" name="quantidade" class="form-control" id="inputQtde" aria-describedby="qtdeHelp">
                <div id="qtdeHelp" class="form-text">Campo obrigatório.</div>
            </div>

            <div class="mb-3">
                <!-- TODO dropdown com as categorias existentes -->
                <label for="inputCategoria" class="form-label">Categoria</label>
                <input type="number" name="categoria" class="form-control" id="inputCategoria" aria-describedby="categoriaHelp">
                <div id="categoriaHelp" class="form-text">Campo obrigatório.</div>
            </div>
            <button type="submit" class="btn btn-primary">Cadastrar</button>
        </form>
        <br/>
        <a href="Inicio" class="btn btn-primary">Voltar</a>

<%@include file="../rodape.jsp" %>
