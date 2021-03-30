
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <jsp:include page="importuri.jsp"/>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <div style="margin-top:5rem">
    <body>
        <br/>
        <p align="center"><a type="button" class="btn btn-dark fs-4" href="nou_oras.jsp"><b>Adauga oras</b></a></p>
        <%
            jb.connect();
            String NumeOras, NumeTeatru, NumeActor, Prenume;

            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("orase","idoras",aux);
            rs.first();                       
            NumeOras = rs.getString("nume");
        %>
        <form action="m2_oras.jsp" method="post">
            <div style="margin-left:280px" class="container">
            <table style="margin:auto;" class="table table-borderless">
                <tr>
                    <td align="right">IdOras:</td>
                    <td> <input type="text" name="idoras" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>                   
                <tr>
                    <td align="right">NumeOras:</td>
                    <td> <input type="text" name="nume" size="30" value="<%= NumeOras%>"/></td>
                </tr>               
            </table></div><p align="center">
                <input type="submit" class="btn btn-dark fs-6 fw-bold" value="Modifica linia">
            </p>
        </form>
       
    </body>
    </div>
    <%
        rs.close();
        jb.disconnect();
    %>
</html>