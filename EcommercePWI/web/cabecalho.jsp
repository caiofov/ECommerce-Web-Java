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
                <a class="navbar-brand" href="${pageContext.request.contextPath}">
                    <img src="${pageContext.request.contextPath}/imagens/logo.png" alt="" width="26" height="26" class="d-inline-block align-text-top">
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
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/Admin">Área do administrador</a>
                        </li>
                      <% 
                    }
                      %>
                    </ul>
                    
                    <%
                    if (logado) {
                    %>

                    <%
                    if(usuario.isAdministrador()){
                    %>
                    
                                        
                    <a title="Meus pedidos" class="text-decoration-none" href="${pageContext.request.contextPath}/PedidosAdm">
                        <%@include file="imagens/svg/basket.svg" %>
                    </a>
                    
                    <%
                    } else{
                    %>
                    
                    
                    <a title="Meus pedidos" class="text-decoration-none" href="${pageContext.request.contextPath}/Pedidos?id=<%= usuario.getId()%>">
                        <%@include file="imagens/svg/basket.svg" %>
                    </a>
                    
                    <%
                    }
                    %>
                    
                    <a title="Meu carrinho" class="text-decoration-none" href="${pageContext.request.contextPath}/Carrinho">
                        <%@include file="imagens/svg/cart.svg" %>
                    </a>
                    
                    <div class="d-flex flex-row align-items-center">
                    <a title="Meu Perfil" class="text-decoration-none align-items-center" href="${pageContext.request.contextPath}/GetConta?id=<%= usuario.getId()%>">
                        <%@include file="imagens/svg/user.svg" %>
                        <%= usuario.getNome() %>
                    </a>

                        <form class="d-flex" action="Logout" method="get">
                            <button class="btn btn-outline-danger" type="submit">Sair</button>
                        </form>
                    </div>
                        
                    <% 
                    } else { 
                    %>
                    <%-- Se não tiver logado, é exibido um formulário de login --%>
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