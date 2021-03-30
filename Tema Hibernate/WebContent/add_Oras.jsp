
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="importuri.jsp"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Orase</title>
    </head>
    <body>
<div align="center" style="margin-top:5rem">
        <div id="add">
            <h1> Adauga Oras: </h1>  
            <br>    
            
            </br>    
            <form action="OraseController" method="GET">
                        <td> Nume Oras: </td>
                        <td><input type="text" name="nume"></td>
                        <br></br>
                        <p><input class="btn btn-dark fs-6 fw-bold" type="submit" name="adaugaOras" value="Adauga"></p>
            </form>
        </div>  

        <form action="OraseController" method="POST">
            <input style="margin-left:20px" class="btn btn-dark fs-6 fw-bold" type="submit" name="afiseazaOrase" value="Afiseaza"> &nbsp; &nbsp;<br>
        </form>
       
</div>	
    </body>
</html>
