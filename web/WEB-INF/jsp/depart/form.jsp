<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<div class="container">
    <ul class="breadcrumb">
        <li><a href="">Home</a></li>
        <li><a href="depart?page=1">Departs</a></li>
        <li>Depart Form</li>
    </ul>
    <f:form action="depart/save" modelAttribute="depart" method="post">
        <f:hidden path="id"/>
        <div class="form-group">
            <label>Name:</label>
            <f:input path="Name" class="form-control" placeholder="Name"/>
            <f:errors path="Name"/>
        </div>
        <button class="btn btn-default">Save</button>
    </f:form>
</div>