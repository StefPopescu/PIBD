
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
        <form id="form" action="m1_oras.jsp" method="post">
            <table class="table">
            <thead class="table-dark">
                <tr>
                     <td><b>Mark:</b></td>
                    <td><b>IdOras:</b></td>
                    <td><b>NumeOras:</b></td>
                    <td><b>IDteatru:</b></td>
                    <td><b>NumeTeatru:</b></td>
                    <td><b>IDactor:</b></td>
                    <td><b>NumeActor:</b></td>
                    <td><b>Prenume:</b></td>             
                </tr>
                </thead>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeOrase();
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idoras");
                %>
                <tr>
                   <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>                 
                    <td><%= rs.getString("NumeOras")%></td>
                    <td><%= rs.getString("IDteatru")%></td>
                    <td><%= rs.getString("NumeTeatru")%></td>
                    <td><%= rs.getString("IDactor")%></td>
                    <td><%= rs.getString("NumeActor")%></td>
                    <td><%= rs.getString("prenume")%></td>               
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
            rs.close();
            jb.disconnect();
        %>
       
    </body>
    </div>
    <script type="text/javascript">
    let form=document.getElementById("form");
    let modifica=document.getElementById("modifica");
    let sterge=document.getElementById("sterge");
    sterge.onclick=()=>{
    	form.action="sterge_oras.jsp";
    	form.submit();
    };
    </script>
</html>