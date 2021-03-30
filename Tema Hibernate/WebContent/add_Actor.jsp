
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
    </head>
    <body>
<%
		TeatreDaolmpl teatruDaolmpl = new TeatreDaolmpl();
		List<Teatre> listaTeatre = new ArrayList();
		listaTeatre = teatruDaolmpl.afiseazaTeatre();
		request.setAttribute("listaTeatre", listaTeatre);
%>
<div align="center" style="margin-top:5rem">
        <div id="add">
            <h1 > Adauga Actor:</h1>
            <br>
            
            </br>
            <form action="ActoriController" method="GET">               
                    <p>
                        <td> Teatru: </td>
                        <td>
                            <select name="idteatru">
                                <c:forEach items="${listaTeatre}" var="teatre">
                                    <option value="${teatre.idteatru}">${teatre.idteatru}, ${teatre.nume}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </p>                  
                    <p>
                        <td> Nume Actor: </td>
                        <td><input type="text" name="nume"></td>
                    </p>
                    <p>
                        <td> Prenume: </td>
                        <td><input type="text" name="prenume"></td>
                    </p>
                    <p>
                        <td> Salariu: </td>
                        <td><input type="text" name="salariu"></td>
                    </p>
                    <p>
                        <td><input class="btn btn-dark fs-6 fw-bold" type="submit" name="adaugaActor" value="Adauga"></td>

                    </p>
            </form>
        </div>

        <form action="ActoriController" method="POST">
            <input style="margin-left:20px" type="submit" class="btn btn-dark fs-6 fw-bold" name="afiseazaActori" value="Afiseaza"> &nbsp; &nbsp;<br>
        </form>
</div>
    </body>
</html>
