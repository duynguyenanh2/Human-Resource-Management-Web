<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<div class="container">
    <ul class="breadcrumb">
        <li><a href="">Home</a></li>
        <li><a href="user?page=1">Users</a></li>
        <li>User Form</li>
    </ul>
    <f:form action="user/save" modelAttribute="user" method="post" onsubmit="return checkUnique(this)">
        <f:hidden path="id"/>
        <div class="form-group">
            <label>Username:</label>
            <f:input path="username" class="form-control" placeholder="Username"/>
            <f:errors path="username"/>
        </div>
        <c:if test="${user.id == null}">
            <div class="form-group">
                <label>Password:</label>
                <f:password path="password" class="form-control" placeholder="Password"
                            pattern=".{8,}" required="true" title="8 letters minimum"/>
            </div>
            <div class="form-group">
                <label>Confirm Password:</label>
                <input type="password" id="repass" class="form-control" placeholder="Confirm Password">
            </div>
        </c:if>
        <div class="form-group">
            <label>Full Name:</label>
            <f:input path="fullname" class="form-control" placeholder="Full Name"/>
            <f:errors path="fullname"/>
        </div>
        <button class="btn btn-default">Save</button>
    </f:form>
</div>