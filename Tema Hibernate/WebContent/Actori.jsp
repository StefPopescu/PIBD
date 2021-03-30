
<%@page import="DAOlmpl.TeatreDaolmpl"%>
<%@page import="pojo.Teatre"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="importuri.jsp"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actori</title>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#stergeActor").hide();
                $("#modificaActor").hide();

                $("#update").click(function () {
                    $("#modificaActor").show();
                    $("#stergeActor").hide();
                });
                $("#delete").click(function () {
                    $("#stergeActor").show();
                    $("#modificaActor").hide();
                });
            });
        </script>

    </head>
        <div align="center" style="margin-top:5rem">
    <body>
        <%
            TeatreDaolmpl teatruDaolmpl = new TeatreDaolmpl();
            List<Teatre> listaTeatre = new ArrayList();
            listaTeatre = teatruDaolmpl.afiseazaTeatre();
            request.setAttribute("listaTeatre", listaTeatre);
        %>
        <h1 align="center"> Tabela Actori:</h1> 
        <table class="table table-dark table-borderless" align="center">
            <tr>
                <td><b>IdActor:</b></td>
                <td><b>Nume:</b></td>
                <td><b>Prenume:</b></td>
                <td><b>Salariu:</b></td>
                <td><b>IdTeatru:</b></td>
                <td><b>Nume:</b></td>
            </tr>
            <c:forEach var="actori" items="${listaActori}">
                <tr>
                    <td>${actori.idactor}</td>
                    <td>${actori.nume}</td>
                    <td>${actori.prenume}</td>
                    <td>${actori.salariu}</td>
                    <td>${actori.teatre.idteatru}</td>
                    <td>${actori.teatre.nume}</td>
                </tr>
            </c:forEach>
        </table>
        <form action="ActoriController" method="POST">
            <p align="center">
                Modifica: <input type="checkbox" id="update"> Sterge: <input type="checkbox" id="delete" onclick="document.getElementById('idteatru').disabled = this.checked;                        
                        document.getElementById('nume').disabled = this.checked;
                        document.getElementById('prenume').disabled = this.checked;
                        document.getElementById('salariu').disabled = this.checked;"><br><br>
                idactor:
                <select name="idactor">
                    <c:forEach items="${listaActori}" var="actori">
                        <option value="${actori.idactor}">${actori.idactor}</option>
                    </c:forEach>
                </select>               
                <br><br>
                idteatru:
                <select name="idteatru">
                    <c:forEach items="${listaTeatre}" var="teatre">
                        <option value="${teatre.idteatru}">${teatre.idteatru}, ${teatre.nume}</option>
                    </c:forEach>
                </select>
                <br><br>
                Modifica nume: <input id="nume" type="text" name="nume"><br><br>
                Modifica prenume: <input id="prenume" type="text" name="prenume"> <br><br>
                Modifica salariu: <input id="salariu" type="text" name="salariu"> <br><br>
                <button class="btn btn-dark fs-6 fw-bold" type="submit" id="modificaActor" name="modificaActor"> Modifica</button> <br> <br>
                <button class="btn btn-dark fs-6 fw-bold" type="submit" id="stergeActor" name="stergeActor"> Sterge </button>
            </p>
        </form>
        <br>
    </body>
    </div>
</html>
