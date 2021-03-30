
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
        <form id="form" action="m1_teatru.jsp" method="post">
             <table class="table">
             <thead class="table-dark">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdTeatru:</b></td>
                    <td><b>Nume:</b></td>
                    <td><b>Capacitate:</b></td>
                    <td><b>Adresa:</b></td>
                    <td><b>IdOras:</b></td>
                </tr>
                </thead>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("teatre");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idteatru");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                    <td><%= x%></td>
                    <td><%= rs.getString("nume")%></td>
                    <td><%= rs.getInt("capacitate")%></td>
                    <td><%= rs.getString("adresa")%></td>
                    <td><%= rs.getInt("idoras")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" class="btn btn-dark fs-6 fw-bold" id="modifica" value="Modifica linia">
                <input type="button" class="btn btn-dark fs-6 fw-bold" id="sterge" value="Sterge linia">
            </p>
        </form>
        <%
    jb.disconnect();%>
        
    </body>
    </div>
    <script type="text/javascript">
    let form=document.getElementById("form");
    let modifica=document.getElementById("modifica");
    let sterge=document.getElementById("sterge");
    sterge.onclick=()=>{
    	form.action="sterge_teatru.jsp";
    	form.submit();
    };
    </script>
</html>