<%@ page import="common.Person" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h4>Include 페이지</h4>
<%
	int pInteger = (Integer)(pageContext.getAttribute("pageIneger"));
	//String pString = pageContext.getAttribute("pageString").toString();
	Person pPerson = (Person)(pageContext.getAttribute("pagePerson"));
	%>
	<ul>
		<li>Integer 객체 : <%= pInteger %></li>
		<li>String 객체 : <%= pageContext.getAttribute("pageString") %></li>
		<li>Person 객체 : <%= pPerson.getName() %>, <%=pPerson.getAge() %></li>
	</ul>