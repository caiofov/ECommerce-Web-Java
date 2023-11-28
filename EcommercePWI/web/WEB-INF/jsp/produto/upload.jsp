<%-- 
    Document   : upload
    Created on : 21 de nov de 2023, 18:08:08
    Author     : leoomoreira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Upload de foto do produto</h1>
        <form method="post" enctype="multipart/form-data"
              action="admin/UploadProdutoFoto">
            Id: <input type="text" name="id" /><br/>
            Foto: <input type="file" name="foto" accept="image/png" /><br/>
            <input type="submit" value="Enviar" />
        </form>
    </body>
</html>
