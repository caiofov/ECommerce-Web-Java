<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Alterar produto</h1>
        <form action="AlterarProduto">
            Descricao: <input type="text" name="descricao" />
            <br/>
            Preco: <input type="text" name="preco" />
            <br/>
            Foto: <input type="text" name="foto" />
            <br/>     
            Quantidade: <input type="text" name="quantidade" />
            <br/>     
            Categoria: <input type="text" name="categoria" />
            <br/>            
            <input type="submit" value="Editar" />
        </form>
    </body>
</html>
