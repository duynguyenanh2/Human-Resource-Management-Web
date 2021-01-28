<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href=""><i class="fas fa-home"></i></a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="user?page=1"><span class="glyphicon glyphicon-user"></span> <s:message code="admin.user"/></a></li>
            <li><a href="depart?page=1"><span class="glyphicon glyphicon-th"></span> <s:message code="admin.depart"/></a></li>
            <li><a href="staff?page=1"><span class="glyphicon glyphicon-leaf"></span> <s:message code="admin.staff"/></a></li>
            <li><a href="record?page=1"><span class="glyphicon glyphicon-record"></span> <s:message code="admin.record"/></a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="admin"><span class="glyphicon glyphicon-user"></span> <s:message code="admin.home"/></a></li>
            <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span> <s:message code="menu.logout"/></a></li>
            <li><a href="admin?lang=en"><img src="images/uk.png"></a></li>
            <li><a href="admin?lang=vi"><img src="images/vn.png"></a></li>
        </ul>
    </div>
</nav>