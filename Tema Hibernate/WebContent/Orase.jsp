<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="importuri.jsp"/>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Orase</title>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#stergeOras").hide();
                $("#modificaOras").hide();

                $("#update").click(function () {
                    $("#modificaOras").show();
                    $("#stergeOras").hide();
                });
                $("#delete").click(function () {
                    $("#stergeOras").show();
                    $("#modificaOras").hide();
                });
            });
        </script>
<div align="center" style="margin-top:5rem">
    <body>
        <h1 align="center"> Tabela Orase:</h1> 
        <table class="table table-dark table-borderless" align="center">
            <tr>
                <td><b>IdOras:</b></td>
                <td><b>Nume:</b></td>            
            </tr>
            <c:out value="${listaOrase}"></c:out>
            <c:forEach var="orase" items="${listaOrase}">
            
                <tr>
                    <td>${orase.idoras}</td>
                    <td>${orase.nume}</td>
                </tr>
            </c:forEach>
        </table>
        <form action="OraseController" method="POST">
            <p align="center">
                Modifica: <input type="checkbox" id="update"> Sterge: <input type="checkbox" id="delete" onclick="document.getElementById('nume').disabled = this.checked; "><br><br>
                <select name="idoras">
                    <c:forEach items="${listaOrase}" var="orase">
                        <option value="${orase.idoras}">${orase.idoras}</option>
                    </c:forEach>
                </select>
                <br><br>
                Modifica Nume: <input id="nume" type="text" name="nume"><br><br>
                <button class="btn btn-dark fs-6 fw-bold" type="submit" id="modificaOras" name="modificaOras"> Modifica</button> <br> <br>
                <button class="btn btn-dark fs-6 fw-bold" type="submit" id="stergeOras" name="stergeOras"> Sterge </button>
            </p>
        </form>
</div>
    </body>   
</html>
