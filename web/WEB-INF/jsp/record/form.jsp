<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<div class="container">
    <ul class="breadcrumb">
        <li><a href="">Home</a></li>
        <li><a href="record?page=1">Records</a></li>
        <li>Record Form</li>
    </ul>
    <f:form action="record/save" modelAttribute="record" method="post">
        <f:hidden path="id"/>
        <div class="form-group">
            <label>Staff:</label>
            <f:select path="staff.id" class="form-control">
                <f:options items="${slist}" itemValue="id" itemLabel="name"/>
            </f:select>
            <f:errors path="staff"/>
        </div>      
        <div class="form-group">
            <label>Type:</label>
            <f:radiobutton path="type" value="true"/> Thưởng
            <f:radiobutton path="type" value="false"/> Phạt
        </div>
        <div class="form-group">
            <label>Reason:</label>
            <f:textarea rows="5" path="reason" class="form-control" placeholder="Reason"/>
            <f:errors path="reason"/>
        </div>
        <button class="btn btn-default">Save</button>
    </f:form>
</div>