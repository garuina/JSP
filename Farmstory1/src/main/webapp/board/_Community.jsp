<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String cate = request.getParameter("cate");

%>
<div id="sub">
<div><img src="/Farmstory1/img/sub_top_tit5.png" alt="COMMUNITY"></div>
    <section class="cate5">
        <aside>
            <img src="/Farmstory1/img/sub_aside_cate5_tit.png" alt="커뮤니티"/>

            <ul class="lnb">
                <li class="<%= cate.equals("notice") ? "on" : "off" %>"><a href="./list.jsp?group=Community&cate=notice">공지사항</a></li>
                <li class="<%= cate.equals("menu") ? "on" : "off" %>"><a href="./list.jsp?group=Community&cate=menu">오늘의식단</a></li>
                <li class="<%= cate.equals("chef") ? "on" : "off" %>"><a href="./list.jsp?group=Community&cate=chef">나도요리사</a></li>
                <li class="<%= cate.equals("qna") ? "on" : "off" %>"><a href="./list.jsp?group=Community&cate=qna">1:1고객문의</a></li>
                <li class="<%= cate.equals("fnq") ? "on" : "off" %>"><a href="./list.jsp?group=Community&cate=fnq">자주묻는질문</a></li>
            </ul>

        </aside>
        <article>
            <nav>
                <img src="/Farmstory1/img/sub_nav_tit_cate5_<%=cate %>.png" alt="공지사항"/>
                <p>
                    HOME > 커뮤니티 > 
                    <% if (cate.equals("story")){ %>
                    <em>공지사항</em>
                    <%} else if(cate.equals("menu")){ %>
                    <em>오늘의식단</em>
                    <%} else if(cate.equals("chef")){ %>
                    <em>나도요리사</em>
                    <%} else if(cate.equals("qna")){ %>
                    <em>1:1고객문의</em>
                    <%} else if(cate.equals("fnq")){ %>
                    <em>자주묻는질문</em>
                    <% } %>
                </p>
            </nav>
