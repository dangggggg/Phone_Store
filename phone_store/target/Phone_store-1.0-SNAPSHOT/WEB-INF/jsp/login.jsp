<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <!-- head -->
    <head>
        <title>Login</title>
        <jsp:include page="./include/css_page_login.jsp"/>
        </head>
        <body>
            <!-- Mobile Menu -->
        <jsp:include page="./include/mobile-menu.jsp"/>

            <div class="super_container">

                <!-- Header -->
            <jsp:include page="./include/header.jsp"/>

                <div class="super_container_inner">
                    <div class="super_overlay"></div>		
                    <div class="container">
                        <div class="row" style="margin-top: 100px">
                            <div class="col-lg-6 offset-lg-3">
                                <div class="section_title text-center">Login</div>
                            </div>
                        </div>
                        <div class="row page_nav_row">
                            <div class="col">
                                <div class="page_nav">
                                    <ul class="d-flex flex-row align-items-start justify-content-center">
                                        <li class="active"><a href="<c:url value="/register"></c:url>">Don't have an account? Register now!</a></li>                                                                           
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="row mainmain">
                            <div class="col-xs-12 col-sm-12">
                            <c:if test="${param.error != null}">
                                <p style="color: red;text-align: center"><c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/></p>
                            </c:if>                                
                            <form action="<c:url value="j_spring_security_check"/>" method="post" class="form-horizontal">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <tr>
                                            <th>Username <span style="color: red">(*)</span></th>
                                            <td><input type="text" name="username" class="form-control"/></td>
                                        </tr>
                                        <tr>
                                            <th>Password <span style="color: red">(*)</span></th>
                                            <td><input type="password" name="password" class="form-control"/></td>
                                        </tr>                                        
                                    </table>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12 col-xs-12" style="text-align: center">
                                        <button type="submit" class="btn btn-primary">Login</button>                                      
                                    </div>
                                </div>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"
                            </form>
                        </div>
                    </div>
                </div>
                <!-- profile -->



            </div>
        </div>

        <!-- Footer -->
        <jsp:include page="./include/footer.jsp"/>

            <!-- script -->
            <jsp:include page="./include/js_page_login.jsp"/>
    </body>
</html>