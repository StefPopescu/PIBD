
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
    </head>
    <body>
<%
		OraseDaolmpl orasDaolmpl = new OraseDaolmpl();
		List<Orase> listaOrase = new ArrayList();
		listaOrase = orasDaolmpl.afiseazaOrase();
		request.setAttribute("listaOrase", listaOrase);
%>
<div align="center" style="margin-top:5rem">
        <div id="add">
        <h1> Adauga Teatru: </h1>  
            <br>    
            
            </br>  
            <form action="TeatreController" method="GET">
            <p>
                        <td> Oras: </td>
                        <td>
                            <select name="idoras">
                                <c:forEach items="${listaOrase}" var="orase">
                                    <option value="${orase.idoras}">${orase.idoras}, ${orase.nume}</option>
                                </c:forEach>
                            </select>
                        </td>
             </p>                                    
                    <p>
                        <td> Nume teatru: </td>
                        <td><input type="text" name="nume"></td>
                    </p>
                    <p>
                        <td> Adresa: </td>
                        <td><input type="text" name="adresa"></td>
                    </p>
                    <p>
                        <td> Capacitate: </td>
                        <td><input type="text" name="capacitate"></td>
                    </p>
                    <p>
                        <td><input class="btn btn-dark fs-6 fw-bold" type="submit" name="adaugaTeatru" value="Adauga"></td>

                    </p>

            </form>
        </div>

        <form action="TeatreController" method="POST">
            <input style="margin-left:20px" class="btn btn-dark fs-6 fw-bold" type="submit" name="afiseazaTeatre" value="Afiseaza"> &nbsp; &nbsp;<br>
        </form>
</div>
    </body>
</html>
