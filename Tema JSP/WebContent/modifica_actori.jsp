
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
        <p align="center"><a type="button" class="btn btn-dark fs-4"  href="nou_actor.jsp"><b>Adauga actor</b></a></p>
        <form id="form" action="m1_actor.jsp" method="post">
        
            <table class="table">
            <thead class="table-dark">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdActorc:</b></td>
                    <td><b>Nume:</b></td>
                    <td><b>Prenume:</b></td>
                    <td><b>Salariu:</b></td>
                    <td><b>IdTeatru:</b></td>
                </tr>
                </thead>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("actori");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idactor");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                    <td><%= x%></td>
                    <td><%= rs.getString("nume")%></td>
                    <td><%= rs.getString("prenume")%></td>
                    <td><%= rs.getInt("salariu")%></td>
                    <td><%= rs.getInt("idteatru")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <b><input class="btn btn-dark fs-6 fw-bold" type="submit" id="modifica" value="Modifica linia"></b>
                <b><input class="btn btn-dark fs-6 fw-bold" type="button" id="sterge" value="Sterge linia"></b>
            </p>
        <%
    jb.disconnect();%>
       
    </body>
    </div>
    <script type="text/javascript">
    let form=document.getElementById("form");
    let modifica=document.getElementById("modifica");
    let sterge=document.getElementById("sterge");
    sterge.onclick=()=>{
    	form.action="sterge_actor.jsp";
    	form.submit();
    };
    </script>
    
</html>