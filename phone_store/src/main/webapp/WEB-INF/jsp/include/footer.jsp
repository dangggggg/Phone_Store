<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<footer class="footer" style="margin-top: 3em">			
    <div class="footer_bar">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="footer_bar_content d-flex flex-md-row flex-column align-items-center justify-content-start">
                        <div class="copyright order-md-1 order-2">
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | <i class="fa fa-heart-o" aria-hidden="true"></i> by Phone Store
                            </div>
                        <nav class="footer_nav ml-md-auto order-md-2 order-1">
                            <ul class="d-flex flex-row align-items-center justify-content-start">
                                <li><a href="<c:url value="/category?id=1&page=1"></c:url>">IPhone</a></li>
                                <li><a href="<c:url value="/category?id=2&page=1"></c:url>">Samsung</a></li>
                                <li><a href="<c:url value="/category?id=3&page=1"></c:url>">Oppo</a></li>                                               
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>