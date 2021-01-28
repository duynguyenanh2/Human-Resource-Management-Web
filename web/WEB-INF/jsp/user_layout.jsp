<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Home</title>
        <base href="${pageContext.servletContext.contextPath}/">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <script src="https://kit.fontawesome.com/c71d029c97.js"></script>

        <link rel="stylesheet" href="css/abc.css">
        <link rel="stylesheet" href="css/sp.css">
        <style>
            .alert{
                clear: both;
                margin
            }
        </style>
    </head>
    <body>
        <div class="container">
            <nav>
                <jsp:include page="menu.jsp"/>
            </nav>
            <article>
                <jsp:include page="${param.view}"/>
            </article>
                <div class="alert alert-info" align="center">&copy; PS11112_Nguyễn Anh Duy</div>
        </div>
    </body>
</html>