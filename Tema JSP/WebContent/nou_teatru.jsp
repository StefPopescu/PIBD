
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <jsp:include page="importuri.jsp"/>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
        	int idoras,capacitate;
        	String NumeOras;
       		String id1 = request.getParameter("idoras");
            String Nume = request.getParameter("nume");         
            String Capacitate = request.getParameter("capacitate");
            String Adresa = request.getParameter("adresa");
            if (Nume != null) {
                jb.connect();
                jb.adaugaTeatru(java.lang.Integer.parseInt(id1), Nume,java.lang.Integer.parseInt(Capacitate), Adresa);
                jb.disconnect();
        %>
        <h1 style="margin-top:5rem" align="center">Datele au fost adaugate!</h1>><%
        } else {
        jb.connect();
        ResultSet rs = jb.vedeTabela("orase");
        %>
        <form action="nou_teatru.jsp" method="post">
            <div style="margin-left:280px; margin-top:5rem" class="container">
            <table style="margin:auto;" class="table table-borderless">
            	<tr>
                    <td align="right"></td>
                    <td> 
                        Selectati Orasul:
			<SELECT NAME="idoras">
                                <%
                                    while(rs.next()){
                                        idoras = rs.getInt("idoras");
                                        NumeOras = rs.getString("nume");                                     
                                %>
                                    <OPTION VALUE="<%= idoras%>"><%= idoras%>,<%= NumeOras%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                <tr>
                    <td align="right">Nume Teatru:</td>
                    <td> <input type="text" name="nume" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">Capacitate:</td>
                    <td> <input type="text" name="capacitate" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Adresa:</td>
                    <td> <input type="text" name="adresa" size="30" /></td>
                </tr>
            </table>
            <input style="margin-left:350px" class="btn btn-dark fs-6 fw-bold" type="submit" value="Adauga teatru" />
        </form>
        <%
            }
        %>
    
    </body>
</html>