
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
     <jsp:include page="importuri.jsp"/>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
        	int idteatru,salariu;
        	String NumeTeatru;
       		String id1 = request.getParameter("idteatru");
            String Nume = request.getParameter("nume");
            String Prenume = request.getParameter("prenume");
            String Salariu = request.getParameter("salariu");
            if (Nume != null) {
                jb.connect();
                jb.adaugaActor(java.lang.Integer.parseInt(id1), Nume, Prenume,java.lang.Integer.parseInt(Salariu));
                jb.disconnect();
        %>
        <h1 style="margin-top:5rem" align="center">Datele au fost adaugate!</h1><%
        } else {
        jb.connect();
        ResultSet rs = jb.vedeTabela("teatre");
        %>
        <form action="nou_actor.jsp" method="post">
            <div style="margin-left:230px; margin-top:5rem" class="container">
            <table style="margin:auto;" class="table table-borderless">
            	<tr>
                    <td align="right"></td>
                    <td> 
                        Selectati teatrul:
			<SELECT NAME="idteatru">
                                <%
                                    while(rs.next()){
                                        idteatru = rs.getInt("idteatru");
                                        NumeTeatru = rs.getString("nume");                                     
                                %>
                                    <OPTION VALUE="<%= idteatru%>"><%= idteatru%>,<%= NumeTeatru%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                <tr>
                    <td align="right">Nume Actor:</td>
                    <td> <input type="text" name="nume" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">Prenume Actor:</td>
                    <td> <input type="text" name="prenume" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Salariu:</td>
                    <td> <input type="text" name="salariu" size="30" /></td>
                </tr>
            </table>
            <input style="margin-left:380px" class="btn btn-dark fs-6 fw-bold" type="submit" value="Adauga actorul" />
        </form>
        <%
            }
        %>
      
    </body>
</html>