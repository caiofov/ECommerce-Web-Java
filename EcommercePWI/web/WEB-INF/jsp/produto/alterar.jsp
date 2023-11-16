<%@page import="produto.modelo.Produto"%>
<%@page import="categoria.modelo.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../../../cabecalho.jsp" %>
<%@include file="../auth.jsp" %>

<%
    Produto produto = (Produto) request.getAttribute("produto");
    Categoria categoria = (Categoria) request.getAttribute("categoria");
    if (produto == null) {
%>
    <p>Produto não encontrado</p>
<%
    } else{
%>
        <h1>Alterar um produto</h1>
        <form action="AlterarProduto?id<%= produto.getId() %>" method="post">
            <div class="mb-3">
                <label for="inputNomeProd" class="form-label">Nome</label>
                <input value="<%= produto.getNome() %>" type="text" name="nome" class="form-control" id="inputNomeProd" aria-describedby="nomeProdHelp">
                <div id="nomeProdHelp" class="form-text">Campo obrigatório.</div>
            </div>
            <div class="mb-3">
                <label for="inputPreco" class="form-label">Preço</label>
                <input value="<%= produto.getPreco() %>" type="number" name="preco" class="form-control" id="inputPreco" aria-describedby="precoHelp">
                <div id="precoHelp" class="form-text">Campo obrigatório.</div>
            </div>
            <div class="mb-3">
                <label for="inputFoto" class="form-label">Foto</label>
                <input value="<%= produto.getFoto() %>" type="text" name="foto" class="form-control" id="inputFoto" aria-describedby="fotoHelp">
                <div id="fotoHelp" class="form-text">Campo obrigatório.</div>
            </div>

            
            <div class="mb-3">
                <label for="inputQtde" class="form-label">Quantidade em estoque</label>
                <input value="<%= produto.getQuantidade() %>" type="number" name="quantidade" class="form-control" id="inputQtde" aria-describedby="qtdeHelp">
                <div id="qtdeHelp" class="form-text">Campo obrigatório.</div>
            </div>

            <div class="mb-3">
                <!-- TODO dropdown com as categorias existentes -->
                <label for="inputCategoria" class="form-label">Categoria</label>
                <input value="<%= produto.getCategoriaId() %>" type="number" name="categoria" class="form-control" id="inputCategoria" aria-describedby="categoriaHelp">
                <div id="categoriaHelp" class="form-text">Campo obrigatório.</div>
            </div>
            <button type="submit" class="btn btn-primary">Cadastrar</button>
        </form>
        <br/>
        <a href="Inicio" class="btn btn-primary">Voltar</a>
<%
        }
    %>
<%
        }
    %>
<%@include file="../../../rodape.jsp" %>
