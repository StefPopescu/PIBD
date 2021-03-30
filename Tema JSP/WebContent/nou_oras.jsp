
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <jsp:include page="importuri.jsp"/>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String Nume = request.getParameter("nume");
            if (Nume != null) {
                jb.connect();
                jb.adaugaOras(Nume);
                jb.disconnect();
        %>
        <h1 style="margin-top:5rem" align="center">Datele au fost adaugate!</h1><%
        } else {
        %>
        <form action="nou_oras.jsp" method="post">
            <div style="margin-left:280px; margin-top:5rem" class="container">
            <table style="margin:auto;" class="table table-borderless">
                <tr>
                    <td align="right">Nume Oras:</td>
                    <td> <input type="text" name="nume" size="40" /></td>
                </tr>
            </table>
            <input style="margin-left:350px" class="btn btn-dark fs-6 fw-bold" type="submit" value="Adauga orasul" />
        </form>
        <%
            }
        %>     
    </body>
</html>