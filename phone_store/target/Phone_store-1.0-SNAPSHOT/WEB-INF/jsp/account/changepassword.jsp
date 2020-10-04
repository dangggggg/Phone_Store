<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<!DOCTYPE html>
<html lang="en">
    <!-- head -->
    <head>
        <title>Change your password</title>
        <jsp:include page="../include/css_page_index.jsp"/>
        </head>
        <body>
            <!-- Mobile Menu -->
        <jsp:include page="../include/mobile-menu.jsp"/>

            <div class="super_container">

                <!-- Header -->
            <jsp:include page="../include/header.jsp"/>

                <div class="super_container_inner">
                    <div class="super_overlay"></div>		
                    <div class="container">
                        <div class="row" style="margin-top: 100px">
                            <div class="col-lg-6 offset-lg-3">
                                <div class="section_title text-center">Change Password</div>
                            </div>
                        </div>
                        <div class="row page_nav_row">
                            <div class="col">
                                <div class="page_nav">
                                    <ul class="d-flex flex-row align-items-start justify-content-center">
                                    <c:import url="../include/account-menu.jsp"></c:import>                                         
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="row mainmain">
                            <div class="col-xs-12 col-sm-12">
                                <p style="font-size: 150%;color: red;text-align: center">${messageError}</p>
                            <p style="font-size: 150%;color: blue;text-align: center">${messageSuccess}</p>
                            <f:form action="${pageContext.request.getContextPath()}/update-password" method="post" class="form-horizontal">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <tr>
                                            <th>Current password <span style="color: red">(*)</span></th>
                                            <td><input type="password" name="password" class="form-control" required/></td>
                                        </tr>
                                        <tr>
                                            <th>New password <span style="color: red">(*)</span></th>
                                            <td><input type="password" name="newpassword1" class="form-control" pattern=".{5,50}" title="Limit 5-50 characters" required/></td>
                                        </tr>
                                        <tr>
                                            <th>Confirm password <span style="color: red">(*)</span></th>
                                            <td><input type="password" name="newpassword2" class="form-control" pattern=".{5,50}" title="Limit 5-50 characters" required/></td>
                                        </tr>                                        
                                    </table>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12 col-xs-12" style="text-align: center">
                                        <button type="submit" class="btn btn-primary">Update</button>                                      
                                    </div>
                                </div>
                            </f:form>
                        </div>
                    </div>
                </div>
                <!-- profile -->



            </div>
        </div>

        <!-- Footer -->
        <jsp:include page="../include/footer.jsp"/>

            <!-- script -->
            <jsp:include page="../include/js_page_index.jsp"/>    
    </body>
</html>