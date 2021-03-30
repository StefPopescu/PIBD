
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
        <p align="center"><a type="button" class="btn btn-dark fs-4" href="nou_teatru.jsp"><b>Adauga teatru</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("teatre", "idteatru", aux);
            rs.first();
            int idoras;
            int id1 = rs.getInt("idoras");
            String NumeOras;
            String Nume = rs.getString("nume");
            int Capacitate = rs.getInt("capacitate");
            String Adresa = rs.getString("adresa");
            
            ResultSet rs1 = jb.vedeTabela("orase");
        %>
        <form action="m2_teatru.jsp" method="post">
            <div style="margin-left:230px" class="container">
            <table style="margin:auto;" class="table table-borderless">
                <tr>
                    <td align="right">IdTeatru:</td>
                    <td> <input type="text" name="idteatru" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Selectati Orasul:</td>
                    <td> 
                        <SELECT NAME="idoras">
                            <% 
                                while (rs1.next()) {
                                    idoras = rs1.getInt("idoras");
                                    NumeOras = rs1.getString("nume");
                                    if (idoras != id1) {
                            %>
                            <OPTION VALUE="<%= idoras%>"><%= idoras%>, <%= NumeOras%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idoras%>"><%= idoras%>, <%= NumeOras%></OPTION>
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
                    <td align="right">Capacitate:</td>
                    <td> <input type="text" name="capacitate" size="30" value="<%= Capacitate%>"/></td>
                </tr>
                <tr>
                    <td align="right">Adresa:</td>
                    <td> <input type="text" name="adresa" size="30" value="<%= Adresa%>"/></td>
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