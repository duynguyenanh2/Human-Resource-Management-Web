<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<c:if test="${message != null}">
    <div class="alert alert-info alert-dismissible text-center">
        <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
        ${message}
    </div>
</c:if>
<div class="text-center" style="height: 75vh">
    <img src="images/admin.jpg">
</div>
