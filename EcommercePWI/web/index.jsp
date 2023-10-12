<%-- 
    Document   : index
    Created on : 6 de out. de 2023, 15:55:48
    Author     : aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form id="login">
                <div>
                    <label for="email-input">Email: </label>
                    <input type="text" id="email-login"/>
                </div>

                <div>
                    <label for="password-input">Senha: </label>
                    <input type="text" id="password-login"/>
                </div>

                <input type="submit" value="Login">
            </form>
            
            <form id="signin">
                <div>
                    <label for="email-input">Email: </label>
                    <input type="text" id="email-signin"/>
                </div>
                   
                
                <div>
                    <label for="email-input">Nome: </label>
                    <input type="text" id="name-signin"/>
                </div>
                
                <div>
                    <label for="password-input">Senha: </label>
                    <input type="text" id="password-signin"/>
                </div>
                
                <div>
                    <label for="password-input">Confirme a senha: </label>
                    <input type="text" id="confirm-password-signin"/>
                </div>
                   
                <div>
                    Li e concordo com os <a href="">termos</a>
                    <input type="checkbox" name="agreement">
                </div>
                <input type="submit" value="Criar conta">
            </form>
        <!-- scripts do bootstrap -->

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>
