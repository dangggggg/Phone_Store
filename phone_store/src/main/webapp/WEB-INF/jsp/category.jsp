<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>${category.name}</title>
        <jsp:include page="./include/css_page_category.jsp"/>
        </head>
        <body>

            <!-- Mobile Menu -->
        <jsp:include page="./include/mobile-menu.jsp"/>

        <div class="super_container">

            <!-- Header -->	
            <jsp:include page="./include/header.jsp"/>

            <div class="super_container_inner">
                <div class="super_overlay"></div>                   

                <!-- Products -->

                <div class="products" style="margin-top: 80px">
                    <div class="container">
                        
                        <div class="row products_row products_container grid">

                            <c:forEach var="product" items="${products}">
                                <!-- Product -->
                                <div class="col-xl-4 col-md-6 grid-item new">
                                    <div class="product">
                                        <div class="product_image"><a href="<c:url value="/product?id=${product.id}"></c:url>"><img src="./resources/images/${product.images[0].name}" alt=""></div>
                                                    <div class="product_content">
                                                        <div class="product_info d-flex flex-row align-items-start justify-content-start">
                                                            <div>
                                                                <div>
                                                                    <div class="product_name"><a href="<c:url value="/product?id=${product.id}"></c:url>">${product.name}</a></div>
                                                                <div class="product_category">In <a href="<c:url value="/category?id=${product.category.id}&page=1"></c:url>">${product.category.name}</a></div>
                                                                </div>
                                                            </div>
                                                            <div class="ml-auto text-right">
                                                                <div class="rating_r"><i class="fa fa-heart fa-1x" style="color: #ff66a3" aria-hidden="true"></i> ${product.totalFavorite}</div>
                                                            <div class="product_price text-right">$${product.price}</div>
                                                        </div>
                                                    </div>                                           
                                                </div>
                                        </div>
                                    </div>
                                </c:forEach>                               

                            </div>
                            <div class="row page_nav_row">
                                <div class="col">
                                    <div class="page_nav">
                                        <ul class="d-flex flex-row align-items-start justify-content-center">                                            
                                            <c:forEach begin="1" end="${page}" varStatus="status">
                                                <c:choose>
                                                    <c:when test="${param.page==null && status.index==1}">
                                                        <li class="active"><a href="<c:url value="/category?id=${param.id}&page=${status.index}"/>">${status.index}</a></li>
                                                        </c:when>
                                                        <c:when test="${param.page==null && status.index!=1}">
                                                        <li><a href="<c:url value="/category?id=${param.id}&page=${status.index}"/>">${status.index}</a></li>
                                                        </c:when>
                                                        <c:when test="${param.page!=null && param.page==status.index}">
                                                        <li class="active"><a href="<c:url value="/category?id=${param.id}&page=${status.index}"/>">${status.index}</a></li>
                                                        </c:when>                                                   
                                                        <c:otherwise>
                                                        <li><a href="<c:url value="/category?id=${param.id}&page=${status.index}"/>">${status.index}</a></li>
                                                        </c:otherwise>
                                                    </c:choose>                                          
                                                </c:forEach>                                                  
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Footer -->
                    <jsp:include page="./include/footer.jsp"/>

                </div>

            </div>

            <jsp:include page="./include/js_page_category.jsp"/>
    </body>
</html>