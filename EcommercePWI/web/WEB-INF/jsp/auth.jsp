<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
     if (usuario == null || !(usuario instanceof Usuario) || !usuario.isAdministrador()){
    %>
        <div class="d-block">
            <p>Não autorizado</p>
            <%@include file="../../../../../../imagens/svg/circle-slash.svg" %> 
        </div>

    <%
     } else{
    %>