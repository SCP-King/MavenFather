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
    /* 设置标题样式 */
    h1 {
      text-align: center;
      font-size: 24px;
      font-weight: bold;
    }

    /* 设置表格样式 */
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    table th {
      font-weight: bold;
      width:200px;
      height: 50px;
      background-color: #f5f5f5;
      border: 1px solid #ddd;
      padding: 5px;
    }

    table td {
      width: 200px;
      height: 50px;
      border: 1px solid #ddd;
      padding: 5px;
    }

    /* 设置搜索表单样式 */
    form {
      text-align: center;
      margin-top: 20px;
    }

    label {
      display: inline-block;
      margin-right: 10px;
    }

    input[type="text"] {
      width: 200px;
      padding: 5px;
      border: 1px solid #ddd;
      border-radius: 3px;
      margin-right: 10px;
    }

    input[type="submit"] {
      padding: 5px 10px;
      background-color: #007bff;
      color: #fff;
      border: none;
      border-radius: 3px;
      cursor: pointer;
    }

    /* 设置分页样式 */
    div {
      text-align: center;
      margin-top: 20px;
    }

    span {
      display: inline-block;
      margin-right: 10px;
      padding: 5px;
      background-color: #f5f5f5;
      border: 1px solid #ddd;
      border-radius: 3px;
      cursor: pointer;
    }

    button {
      padding: 5px 10px;
      background-color: #007bff;
      color: #fff;
      border: none;
      border-radius: 3px;
      cursor: pointer;
      margin-left: 5px;
    }

    /* 设置鼠标悬停样式 */
    td[title]:hover::before {
      content: attr(title);
      position: absolute;
      background-color: #fff;
      border: 1px solid #ddd;
      border-radius: 3px;
      padding: 5px;
      z-index: 1;
      white-space: nowrap;
    }

    td[title]:hover {
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }
  </style>
</head>
<body>
<img src="LOGO.png">
<h1 style="text-align: center;">科技政策查询系统</h1>
<form action="/find" method="post" style="text-align: center">
  <label>政策名称<input type="text" name="name" placeholder="请输入政策名称"></label>
  <label>发文字号<input type="text" name="hyphen" placeholder="请输入发文字号"></label>
  <label>发文机构<input type="text" name="agency"></label>
  <label>全文检索<input type="text" name="content"></label>
  <input type="submit" value="搜索">
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
  int Allpage=0;
  if(policies!=null){
    if(k>=policies.size()) k=0;
    Allpage=policies.size();
%>
<table>
  <tr>
    <th>政策名称</th>
    <th>发文机构</th>
    <th>颁布日期
      <button  onclick="location.replace('/sort1')">▲</button>
      <button  onclick="location.replace('/sort2')">▼</button>
    </th>
    <th>政策分类</th>
  </tr>
  <%{
    List<Policy> policyList=new ArrayList<>();
    if(k>=0&&k<policies.size())
    policyList=policies.get(k);
    if(policyList!=null){
      for(int i=0;i<policyList.size();i++){
      Policy policy=policyList.get(i);
      String ps="";
      if(policy.getName().length()<6) ps=policy.getName();
      else ps=policy.getName().substring(0,6)+"......";
  %>
  <tr>
    <td style="text-align: left" title="<%=policy.getName()%>" onmouseover="this.innerText='<%=policy.getName()%>'" onmouseleave="this.innerText='<%=ps%>'" onclick="location.replace('/detail.jsp?k=<%=k%>&i=<%=i%>')"><%=ps%></td>
    <td style="text-align: center"><%=policy.getOrgan()%></td>
    <td style="text-align: center"><%=policy.getPubdata()%></td>
    <td style="text-align: center"><%=policy.getCategory()%></td>
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
  <%if (k-2>1){%>
  <span onclick="location.href='/see?k=<%=1%>'"><%=1%></span>
  <span>......</span>
  <%}%>
  <%if (k-2>0){%>
  <span onclick="location.href='/see?k=<%=k-2%>'"><%=k-2%></span>
  <%}%>
  <%if (k-1>0){%>
  <span onclick="location.href='/see?k=<%=k-1%>'"><%=k-1%></span>
  <%}%>
  <%if (k>0){%>
  <span onclick="location.href='/see?k=<%=k%>'"><%=k%></span>
  <%}%>
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
  <%if (k+4<policies.size()){%>
  <span>......</span>
  <span onclick="location.href='/see?k=<%=policies.size()%>'"><%=policies.size()%></span>
  <%}%>
<form action="/next" style="display: inline">
  <input type="submit" value="下一页">
</form>
  <span>总共条数:<%=Num%></span>
  <span>总页数<%=Allpage%></span>
  <form action="/new" style="display: inline">
    <select name="k">
      <%for(int i=0;i<policies.size();i++){%>
      <option value="<%=i%>">第<%=i%>页</option>
      <%}%>
    </select>
    <input type="submit" value="点击跳转">
  </form>
</div>
<%}%>
</body>
</html>