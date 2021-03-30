
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
        <p align="center"><a type="button" class="btn btn-dark fs-4" href="nou_actor.jsp"><b>Adauga actor</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("actori", "idactor", aux);
            rs.first();
            int idteatru;
            int id1 = rs.getInt("idteatru");
            String NumeTeatru;
            String Nume = rs.getString("nume");
            String Prenume = rs.getString("prenume");
            int Salariu = rs.getInt("salariu");
            
            ResultSet rs1 = jb.vedeTabela("teatre");
        %>
        <form action="m2_actor.jsp" method="post">
        <div style="margin-left:230px" class="container">
            <table style="margin:auto;" class="table table-borderless">
                <tr>
                    <td align="right">IdActor:</td>
                    <td> <input type="text" name="idactor" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Selectati Teatrul:</td>
                    <td> 
                        <SELECT NAME="idteatru">
                            <% 
                                while (rs1.next()) {
                                    idteatru = rs1.getInt("idteatru");
                                    NumeTeatru = rs1.getString("nume");
                                    if (idteatru != id1) {
                            %>
                            <OPTION VALUE="<%= idteatru%>"><%= idteatru%>, <%= NumeTeatru%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idteatru%>"><%= idteatru%>, <%= NumeTeatru%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">Nume:</td>
                    <td> <input type="text" name="nume" size="30" value="<%= Nume%>"/></td>
                </tr>
                <tr>
                    <td align="right">Prenume:</td>
                    <td> <input type="text" name="prenume" size="30" value="<%= Prenume%>"/></td>
                </tr>
                <tr>
                    <td align="right">Salariu:</td>
                    <td> <input type="text" name="salariu" size="30" value="<%= Salariu%>"/></td>
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