
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <jsp:include page="importuri.jsp"/>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idoras"));
            String NumeOras = request.getParameter("nume");      
            String[] valori = {NumeOras};
            String[] campuri = {"nume"};
            jb.modificaTabela("orase", "idoras", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 style="margin-top:5rem" align="center">Modificarile au fost efectuate!</h1>
       
    </body>
</html>