<%@ page import="java.util.List" %>
<%@ page import="org.example.pojo.Policy" %>
<%@ page import="org.example.utils.SelectServlet" %>
<%@ page import="org.example.utils.PolicySelect" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 19505
  Date: 2023/4/10
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>查询界面</title>
  <meta charset="UTF-8">
  <style>
    label{
      margin: 20pt;
    }
    table
    {
      border-collapse: collapse;
      margin: 0 auto;
      text-align: center;
    }
    table td, table th
    {
      border: 1px solid #cad9ea;
      color: #666;
      height: 30px;
    }
    table thead th
    {
      background-color: #CCE8EB;
      width: 100px;
    }
    table tr:nth-child(odd)
    {
      background: #fff;
    }
    table tr:nth-child(even)
    {
      background: #F5FAFA;
    }
  </style>
</head>
<body>
<img src="LOGO.png" style="margin: 0">
<h1 style="text-align: center;color: deepskyblue;">科技政策查询系统</h1>
<form action="/find" method="post" style="text-align: center">
  <label>政策名称</label><input type="text" name="name" placeholder="请输入政策名称" style="color: orange">
  <label>发文字号</label><input type="text" name="hyphen" placeholder="请输入发文字号" style="color: orange">
  <label>发文机构</label><input type="text" name="agency">
  <label>全文检索</label><input type="text" name="content">
  <input type="submit" value="搜索" style="width: 40px;height: 30px;background: paleturquoise">
</form>
<%
  PolicySelect select=new PolicySelect();
  List<List<Policy>> policies= (List<List<Policy>>) session.getAttribute("policies");
  int k=0;
  System.out.println(session.getAttribute("k"));
  if(session.getAttribute("k")!=null) k=(int) session.getAttribute("k");
  else session.setAttribute("k",k);
  int Num=0;
  if(session.getAttribute("Num")!=null) {
    Num=(int)session.getAttribute("Num");
  }
  if(policies!=null){
    if(k>=policies.size()) k=0;
%>
<table>
  <tr>
    <th>政策名称</th>
    <th>发文机构</th>
    <th>颁布日期</th>
    <th>政策分类</th>
    <th>操作</th>
  </tr>
  <%{
    List<Policy> policyList=new ArrayList<>();
    if(k>=0&&k<policies.size())
    policyList=policies.get(k);
    if(policyList!=null){
      for(int i=0;i<policyList.size();i++){
      Policy policy=policyList.get(i);
  %>
  <tr>
    <td style="font-size: 5px;width: 400px;"><%=policy.getName()%></td>
    <td style="font-size: 5px;width: 400px;"><%=policy.getOrgan()%></td>
    <td><%=policy.getPubdata()%></td>
    <td><%=policy.getCategory()%></td>
    <td>
      <a href="detail.jsp?k=<%=k%>&i=<%=i%>" style="background: blue;color:orange;width: 50px;height: 40px;">查看</a>
    </td>
  </tr>
  <%
        }
      }
    }%>
</table>
<div style="text-align: center">
<form action="/last" style="display: inline">
  <input type="submit" value="上一页">
</form>
<%if (k+1<=policies.size()){%>
<span onclick="location.href='/see?k=<%=k+1%>'"><%=k+1%></span>
<%}%>
<%if (k+2<=policies.size()){%>
<span onclick="location.href='/see?k=<%=k+2%>'"><%=k+2%></span>
<%}%>
<%if (k+3<=policies.size()){%>
<span onclick="location.href='/see?k=<%=k+3%>'"><%=k+3%></span>
<%}%>
<%if (k+4<=policies.size()){%>
<span onclick="location.href='/see?k=<%=k+4%>'"><%=k+4%></span>
<%}%>
<%if (k+5<=policies.size()){%>
<span onclick="location.href='/see?k=<%=k+5%>'"><%=k+5%></span>
<%}%>
<form action="/next" style="display: inline">
  <input type="submit" value="下一页">
</form>
  <span style="font-size: 15pt">总共条数:<%=Num%></span>
</div>
<%}%>
</body>
</html>
