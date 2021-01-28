<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<div class="container">
    <ul class="breadcrumb">
        <li><a href="">Home</a></li>
        <li><a href="staff?page=1">Staffs</a></li>
        <li>Staff Form</li>
    </ul>
    <f:form action="staff/save" modelAttribute="staff" method="post" enctype="multipart/form-data">
        <f:hidden path="id"/>
        <div class="form-group">
            <label>Name:</label>
            <f:input path="name" class="form-control" placeholder="Name"/>
            <f:errors path="name"/>
        </div>
        <div class="form-group">
            <label>Gender:</label><br>
            <f:radiobutton path="gender" value="true"/>Male
            <f:radiobutton path="gender" value="false"/>Female
        </div>
        <div class="form-group">
            <label>Birthday:</label>
            <f:input type="date" path="birthday" class="form-control"/>
            <f:errors path="birthday"/>
        </div>
        <div class="form-group">
            <label>Email:</label>
            <f:input type="email" path="email" class="form-control" placeholder="Email"/>
            <f:errors path="email"/>
        </div>
        <div class="form-group">
            <label>Phone:</label>
            <f:input type= "tel" path="phone" class="form-control" placeholder="Phone"/>
            <f:errors path="phone"/>
        </div>
        <div class="form-group">
            <label>Salary:</label>
            <f:input type="number" path="salary" class="form-control" placeholder="Salary"/>
            <f:errors path="salary"/>
        </div>
        <div class="form-group">
            <label>Depart:</label>
            <f:select path="depart.id" class="form-control">
                <f:options items="${dlist}" itemValue="id" itemLabel="name"/>
            </f:select>
            <f:errors path="depart"/>
        </div>
        <div class="form-group">
            <label>Image:</label>
            <input type="file" class="file-input" id="fileImg" name="fileImg" accept="image/png, image/jpeg">
            <f:hidden path="image"/>
            <img id="thumbnail" src="${staff.imagePath}" width="100" height="100">
        </div>
        <button class="btn btn-default">Save</button>
    </f:form>
</div>