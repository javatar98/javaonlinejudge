<%@page import="java.sql.ResultSet"%>
<%@include file="controller/Connect.jsp" %>
<%
    String id = request.getParameter("id");
    ResultSet rs = st.executeQuery("SELECT * FROM problem where id = "+id);
    if(rs.next()){
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US">
 
<head>
<meta name="viewport" content="width=device-width; initial-scale=1; maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>AV Online Judge</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<body>
<header>
    <a href="#" id="logos"></a>
        <nav>
            <a href="#" id="menu-icon"></a>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="problem.jsp"   class="current">Problem</a></li>
                <li><a href="submission.jsp">Submission</a></li>
                <li><a href="about.jsp">About</a></li>
                <%
                    if(session.getAttribute("id_user")!=null){
                        if(((ResultSet)session.getAttribute("id_user")).getString("role").equals("1")){
                            out.print("<li><a href='announcement.jsp'>Create Announcement</a></li><li><a href='createproblem.jsp'>Create Problem</a></li>");
                        }
                    }
                %>
                <%if(session.getAttribute("id_user")==null){out.print("<li><a href='login.jsp'>Login</a></li>");}else{out.print("<li><a href='editprofile.jsp'>"+((ResultSet)session.getAttribute("id_user")).getString("username")+"</a></li><li><a href='logout.jsp'>Logout</a></li>");}%>
            </ul>
        </nav>
    </header>
    <section>
        <form method='post' action="doCompile.jsp">
            <input type='hidden' name='id' value="<%=id%>"/> 
            <div style="display: block; border:1px solid orange; height: auto; padding-bottom: 30px;">
                <table>
                    <tr>
                        <td></td>
                        <td><center>Problem <%=rs.getString("problem_name")%></center></td>
                    </tr>
                    <tr>
                        <td valign="top">Code :</td>
                        <td><textarea name="code" cols="110" rows="20"></textarea></td>
                    </tr>
                </table>
                <center><input type='submit' id='modifiedButton' style='background-color: orange;color:white;' value="Judge Now"></center>
            </div>
        </form>
    </section>
        <footer>
            <center>AV Online Judge � 2015 <a style="color:blue;" href="http://www.fb.com/DreamingDelta">AV15-1</a> All Rights Reserved</center>
        </footer>
</body>
</html>
                <%
    }
                %>