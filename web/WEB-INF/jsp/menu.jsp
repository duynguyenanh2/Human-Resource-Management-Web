<%@ page import="dao.UserDao"%>
<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href=""><i class="fas fa-home"></i></a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href=""><span class="glyphicon glyphicon-home"></span> <s:message code="menu.home"/></a></li>
            <li><a href="#"><span class="glyphicon glyphicon-fire"></span> <s:message code="menu.about"/></a></li>
            <li><a href="contact"><span class="glyphicon glyphicon-send"></span> <s:message code="menu.contact"/></a></li>
            <li><a href="staff/report"><span class="glyphicon glyphicon-send"></span> <s:message code="menu.report"/></a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">          
            <%
                if (UserDao.authenticated(request)) {
            %>
            <li><a href="admin"><span class="glyphicon glyphicon-user"></span> <s:message code="admin.home"/></a></li>
            <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span> <s:message code="menu.logout"/></a></li>
            <%                   
                } else {
            %>
            <li><a href="login"><span class="glyphicon glyphicon-log-in"></span> <s:message code="menu.login"/></a></li>
            <%
                }
            %>
            <li><a href="index?lang=en"><img src="images/uk.png"></a></li>
            <li><a href="index?lang=vi"><img src="images/vn.png"></a></li>
        </ul>
    </div>
</nav>