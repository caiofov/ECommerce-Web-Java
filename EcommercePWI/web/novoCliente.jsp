<%-- 
    Document   : novoCliente
    Created on : 15 de set de 2023, 14:52:02
    Author     : Leonardo Oliveira Moreira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>smd e-commerce</title>
    </head>
    <body>
        <h1>Cadastrar um Novo Cliente</h1>
        <form action="InserirCliente" method="post">
            <input type="text" name="nome" placeholder="Entre com seu nome" />
            <br/>
            <input type="text" name="login" placeholder="Entre com seu login" />
            <br/>
            <input type="password" name="senha" placeholder="Entre com sua senha" />
            <br/>
            <input type="date" name="dataNascimento" placeholder="Entre com sua data de nascimento" />
            <br/>
            <input type="submit" value="Cadastrar" />
        </form>
        <a href="index.jsp">Voltar</a>
    </body>
</html>
