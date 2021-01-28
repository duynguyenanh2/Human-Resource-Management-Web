<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<div>
    <h1>Tổng Thành Tích</h1>
    <table class="table table-hover">
        <tr>
            <th>Mã NV</th>
            <th>Tên NV</th>
            <th>Tổng Thành Tích</th>
            <th>Tổng kỷ luật</th>
            <th>Tổng kết</th>
        </tr>
        <c:forEach var="r" items="${report}">
            <tr>
                <td>${r[0]}</td>
                <td>${r[1]}</td>
                <td>${r[2]}</td>
                <td>${r[3]}</td>
                <td>${r[2]-r[3]}</td>
            </tr>
        </c:forEach>
    </table>
</div>
