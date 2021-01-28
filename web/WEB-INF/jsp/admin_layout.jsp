<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Admin</title>
    <base href="${pageContext.servletContext.contextPath}/">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
    <script src="https://kit.fontawesome.com/c71d029c97.js"></script>
    
    <link rel="stylesheet" href="css/abc.css">
</head>
<body>
    <div class="container">
        <nav>
            <jsp:include page="admin/menu.jsp"/>
        </nav>
        <article>
            <jsp:include page="${param.view}"/>
        </article>
        <footer>
            <div class="alert alert-info" align="center">&copy; PS11112_Nguyễn Anh Duy</div>
        </footer>
    </div>
    <!-- Modal -->
    <div class="modal fade text-center" id="delModal">
        <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Confirm delete</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                Are you sure you want to delete this record?
            </div>
            <div class="modal-footer">
                <a class="btn btn-danger" id="delRef" href="">Yes, delete</a>
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
            </div>
            </div>
        </div>
    </div>
    <script src="js/abc.js"></script>
    <script src="js/check.js"></script>
    <script>
        function clearFilter() {
            window.location = "user";
        }
    </script>
</body>
</html>