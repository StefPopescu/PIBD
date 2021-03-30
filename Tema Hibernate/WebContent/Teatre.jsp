
<%@page import="DAOlmpl.OraseDaolmpl"%>
<%@page import="pojo.Orase"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="importuri.jsp"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teatre</title>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#stergeTeatru").hide();
                $("#modificaTeatru").hide();

                $("#update").click(function () {
                    $("#modificaTeatru").show();
                    $("#stergeTeatru").hide();
                });
                $("#delete").click(function () {
                    $("#stergeTeatru").show();
                    $("#modificaTeatru").hide();
                });
            });
        </script>

    </head>
    <div align="center" style="margin-top:5rem">
    <body>
        <%
            OraseDaolmpl orasDaolmpl = new OraseDaolmpl();
            List<Orase> listaOrase = new ArrayList();
            listaOrase = orasDaolmpl.afiseazaOrase();
            request.setAttribute("listaOrase", listaOrase);
        %>
        <h1 align="center"> Tabela Teatre:</h1> 
        <table class="table table-dark table-borderless" align="center">
            <tr>
                <td><b>IdTeatru:</b></td>
                <td><b>Nume:</b></td>
                <td><b>Adresa:</b></td>
                <td><b>Capacitate:</b></td>
                <td><b>IdOras:</b></td>
                <td><b>Nume:</b></td>
            </tr>
            <c:forEach var="teatre" items="${listaTeatre}">
                <tr>
                    <td>${teatre.idteatru}</td>
                    <td>${teatre.nume}</td>
                    <td>${teatre.adresa}</td>
                    <td>${teatre.capacitate}</td>
                    <td>${teatre.orase.idoras}</td>
                    <td>${teatre.orase.nume}</td>
                </tr>
            </c:forEach>
        </table>
        <form action="TeatreController" method="POST">
            <p align="center">
                Modifica: <input type="checkbox" id="update"> Sterge: <input type="checkbox" id="delete" onclick="document.getElementById('idoras').disabled = this.checked;                        
                        document.getElementById('nume').disabled = this.checked;
                        document.getElementById('adresa').disabled = this.checked;
                        document.getElementById('capacitate').disabled = this.checked;"><br><br>
                idteatru:
                <select name="idteatru">
                    <c:forEach items="${listaTeatre}" var="teatre">
                        <option value="${teatre.idteatru}">${teatre.idteatru}</option>
                    </c:forEach>
                </select>               
                <br><br>
                idoras:
                <select name="idoras">
                    <c:forEach items="${listaOrase}" var="orase">
                        <option value="${orase.idoras}">${orase.idoras}, ${orase.nume}</option>
                    </c:forEach>
                </select>
                <br><br>
                Modifica numele teatrului: <input id="nume" type="text" name="nume"><br><br>
                Modifica adresa: <input id="adresa" type="text" name="adresa"> <br><br>
                Modifica capacitatea: <input id="capacitate" type="text" name="capacitate"> <br><br>
                <button class="btn btn-dark fs-6 fw-bold" type="submit" id="modificaTeatru" name="modificaTeatru"> Modifica</button> <br> <br>
                <button class="btn btn-dark fs-6 fw-bold" type="submit" id="stergeTeatru" name="stergeTeatru"> Sterge </button>
            </p>
        </form>
        <br>
    </body>
    </div>
</html>
