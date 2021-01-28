<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<div align="center">
    <img src="images/bia.jpg" width="1100px" height="350px">
</div>
<div class="text-center">
    <h1>${message}</h1>
    <c:forEach var="p" items="${list}">
        <div class ="col-25">
            <div class="prod">
                <div class="name">${p.name}</div>
                <img class="image" src="${p.imagePath}"/>
                <div class="price">${p.salary}</div>
            </div>
        </div>
    </c:forEach>
</div>
