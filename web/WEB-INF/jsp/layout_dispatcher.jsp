<%
    String view = request.getParameter("view");
    if (view.startsWith("admin/") || view.startsWith("user/") || view.startsWith("depart/") || view.startsWith("staff/") || view.startsWith("record/")) {
        pageContext.forward("admin_layout.jsp");
    } else {
        pageContext.forward("user_layout.jsp");
    }
%>