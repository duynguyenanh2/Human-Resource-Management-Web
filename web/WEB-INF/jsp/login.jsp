<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>Login</h1>
<c:if test="${message != null}">
    <div class="alert alert-danger alert-dismissible text-center">
        <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
        ${message}
    </div>
</c:if>
<form action="login" method="post">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
        <input type="text" class="form-control" name="username" placeholder="Username" required>
    </div>
    <br/>
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
        <input type="password" class="form-control" name="password" placeholder="Password" required>
    </div>
    <br/>
    <input type="submit" class="btn btn-default" value="Login">
</form>