<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<!DOCTYPE html>
<html lang="en">
    <!-- head -->
    <head>
        <title>Register</title>
        <jsp:include page="./include/css_page_index.jsp"/>
        <style>
            th, input{
                color: black;
            }            
        </style>
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
                            <div class="section_title text-center">Register</div>
                        </div>
                    </div>

                    <div class="row" style="margin-top: 3em">
                        <div class="col-xs-12 col-sm-12">
                            <p style="font-size: 150%;color: red;text-align: center">${messageError}</p>
                            <p style="font-size: 150%;color: blue;text-align: center">${messageSuccess}</p>
                            <f:form action="${pageContext.request.getContextPath()}/register-account" method="post" modelAttribute="account" id="registerform" class="form-horizontal">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <tr>
                                            <th>Full name <span style="color: red">(*)</span></th>
                                            <td><input type="text" name="fullName" class="form-control" pattern="[A-Za-z ]{3,50}" title="Only letters and space are allowed, length 3-50" required/></td>
                                        </tr>
                                        <tr>
                                            <th>Username <span style="color: red">(*)</span></th>
                                            <td><input type="text" name="username" class="form-control" pattern="[A-Za-z0-9_]{3,50}" title="Only letters, numbers and '_' are allowed, length 3-50" required/></td>
                                        </tr>
                                        <tr>
                                            <th>Email <span style="color: red">(*)</span></th>
                                            <td><input type="email" name="email" class="form-control" required/></td>
                                        </tr>
                                        <tr>
                                            <th>Phone</th>
                                            <td><input type="text" name="phone" pattern="[0-9]{10,11}" title="Only numbers are allowed, length 10-11" class="form-control"/></td>
                                        </tr>
                                        <tr>
                                            <th>Birthday</th>
                                            <td><input type="date" name="birthday" class="form-control"/></td>
                                        </tr>
                                        <tr>
                                            <th>Address</th>
                                            <td><input type="text" name="address" class="form-control"/></td>
                                        </tr>
                                        <tr>
                                            <th>Password <span style="color: red">(*)</span></th>
                                            <td><input type="password" name="password1" pattern=".{5,50}" title="Limit 5-50 characters" class="form-control" required/></td>
                                        </tr>
                                        <tr>
                                            <th>Confirm password <span style="color: red">(*)</span></th>
                                            <td><input type="password" name="password2" pattern=".{5,50}" title="Limit 5-50 characters" class="form-control" required/></td>
                                        </tr>                                        

                                    </table>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12 col-xs-12" style="text-align: center">
                                        <button id="registerBtn" type="submit" class="btn btn-primary">Register</button>                                      
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
        <jsp:include page="./include/footer.jsp"/>

        <!-- script -->
        <jsp:include page="./include/js_page_index.jsp"/>       
    </body>
</html>