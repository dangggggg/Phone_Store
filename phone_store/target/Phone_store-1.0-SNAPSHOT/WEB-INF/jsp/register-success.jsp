<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <!-- head -->
    <head>
        <title>Register success</title>
        <jsp:include page="./include/css_page_index.jsp"/>
        </head>
        <body>
            <!-- Mobile Menu -->
        <jsp:include page="./include/mobile-menu.jsp"/>

        <div class="super_container">

            <!-- Header -->
            <jsp:include page="./include/header.jsp"/>

            <div class="container" style="text-align: center;margin-top: 150px;margin-bottom: 300px;">
                <h2 style="color: blue">${messageSuccess}</h2>               
                <a href="<c:url value="/home"></c:url>">Click here to return home page</a>                    
                </div>	
            </div>

            <!-- Footer -->
        <jsp:include page="./include/footer.jsp"/>

        <!-- script -->
        <jsp:include page="./include/js_page_index.jsp"/>                 
    </body>
</html>
