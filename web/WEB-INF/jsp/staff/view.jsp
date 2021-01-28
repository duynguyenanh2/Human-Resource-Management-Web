<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
    <ul class="breadcrumb">
        <li><a href="">Home</a></li>
        <li>Staffs</li>
    </ul>
    <div class="col-md-10 col-md-offset-1">
        <div class="panel panel-table panel-default">
            <div class="panel-heading">
                <div class="row">
                    <div class="col col-xs-6">
                        <a class="fas fa-plus fa-2x text-primary" href="staff/add"></a>
                    </div>
                    <div class="col col-xs-3 pull-right">
                        <input type="search" class="form-control" id="tblInput" placeholder="Search">
                    </div>                       
                </div>
            </div>
            <div class="panel-body">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Gender</th>
                            <th>Birthday</th>
                            <th>Image</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Salary</th>
                            <th>Depart</th>
                            <th>Action</th>
                        </tr> 
                    </thead>
                    <tbody id="myTable">
                        <c:forEach var="u" items="${list}">
                            <tr>
                                <td>${u.id}</td>
                                <td>${u.name}</td>
                                <td>${u.gender ? 'Male' : 'Female'}</td>
                                <td>${u.birthday}</td>
                                <td><img src="${u.imagePath}" width="50px" height="50px"></td>
                                <td>${u.email}</td>
                                <td>${u.phone}</td>
                                <td>${u.salary}</td>
                                <td>${u.depart}</td>
                                <td>
                                    <a class="fas fa-edit fa-2x text-info" href="staff/edit?id=${u.id}"></a>
                                    &nbsp;
                                    <a class="fas fa-trash fa-2x text-danger btn-del" href="staff/delete?id=${u.id}"></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="panel-footer">
                <div class="row">
                    <div class="col col-xs-4">Page ${pages} of ${totalpage}</div>
                    <div class="col col-xs-8">
                        <ul class="pagination pull-right">
                            <c:set var="totalpage" value="${totalpage}"/>
                            <c:set var="pages" value="${pages}"/>
                            <%
                                String totalpage = String.valueOf(pageContext.getAttribute("totalpage"));
                                String pages = String.valueOf(pageContext.getAttribute("pages"));
                                int sotrang = Integer.valueOf(totalpage);
                                int trang = Integer.valueOf(pages);
                            %>
                            <%
                                if (trang > 1) {
                            %>
                            <li><a href="staff?page=1">‹</a></li>
                            <li><a href="staff?page=<%=(trang - 1)%>">«</a></li>
                                <%
                                    }
                                %>
                                <%
                                    for (int i = 1; i <= sotrang; i++) {
                                %>
                            <li <%if (trang == i) {%>class="active"<%}%>><a href="staff?page=<%=i%>"><%=i%></a></li>
                                <%
                                    }
                                %>
                                <%
                                    if (trang != sotrang) {
                                %>
                            <li><a href="staff?page=<%=(trang + 1)%>">»</a></li>
                            <li><a href="staff?page=${totalpage}">›</a></li>
                                <%
                                    }
                                %>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>