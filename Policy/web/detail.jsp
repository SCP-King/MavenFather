<%@ page import="java.util.List" %>
<%@ page import="org.example.pojo.Policy" %><%--
  Created by IntelliJ IDEA.
  User: 19505
  Date: 2023/4/10
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
int k=Integer.valueOf(request.getParameter("k"));
int i=Integer.valueOf(request.getParameter("i"));
    List<List<Policy>> p= (List<List<Policy>>) session.getAttribute("policies");
%>
<%=p.get(k).get(i).getText()%>
</body>
</html>
