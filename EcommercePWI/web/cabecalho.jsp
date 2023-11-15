<%@page import="usuario.modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>smdecommerce</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link href="css/principal.css" rel="stylesheet" />
    </head>
    <body>
        <%
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        boolean logado = usuario != null && usuario instanceof Usuario;
        %>
        <nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light border-bottom">
            <div class="container-fluid">
                <a class="navbar-brand" href="Inicio">
                    <img src="imagens/logo.png" alt="" width="26" height="26" class="d-inline-block align-text-top">
                    smdecommerce
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggler01" aria-controls="navbarToggler01" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarToggler01">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="novoCliente.jsp">Novo Cliente</a>
                        </li>
                        <%
                    if (logado && usuario.isAdministrador()) {
                    %>
                        <li class="nav-item">
                            <a class="nav-link" href="ListarCategoria">Categorias</a>
                        </li>
                      <% 
                    }
                      %>
                    </ul>
                    
                    <%
                    if (logado) {
                    %>
                    <form class="d-flex" action="Logout" method="get">
                        <input class="form-control me-2" type="text" readonly disabled value="Olá, <%= usuario.getNome() %>!">
                        <button class="btn btn-outline-danger" type="submit">Sair</button>
                    </form>
                    <% 
                    } else {
                    %>
                    <form class="d-flex" action="Login" method="post">
                        <input class="form-control me-2" type="text" name="login" placeholder="Login" aria-label="Login" required>
                        <input class="form-control me-2" type="password" name="senha" placeholder="Senha" aria-label="Senha" required>
                        <button class="btn btn-outline-primary" type="submit">Entrar</button>
                    </form>
                    <% 
                    }
                    %>
                </div>
            </div>
        </nav>
        <div class="container">
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