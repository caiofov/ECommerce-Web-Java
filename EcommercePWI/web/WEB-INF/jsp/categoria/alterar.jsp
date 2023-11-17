<%@page import="categoria.modelo.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../../../cabecalho.jsp" %>
<%@include file="../auth.jsp" %>

<%
    Categoria categoria = (Categoria) request.getAttribute("categoria");
    if (categoria == null) {
%>
    <p>Categoria não encontrada</p>
<%
    } else{
%>
        <h1>Editar a categoria</h1>
        <form action="AlterarCategoria">
            <input type="hidden" name="id" value="<%= categoria.getId()%>" /> 
            <div class="mb-3">
                <label for="inputNomeCateg" class="form-label">Nome</label>
                <input value="<%= categoria.getNome() %>" type="text" name="nome" class="form-control" id="inputNomeCateg" aria-describedby="nomeCategHelp">
                <div id="nomeCategHelp" class="form-text">Campo obrigatório.</div>
            </div>
           
            <button type="submit" class="btn btn-primary">Editar</button>
        </form>
        <br/>
        <a href="Inicio" class="btn btn-primary">Voltar</a>
<%
    }}
%>
<%@include file="../../../rodape.jsp" %>
