<%-- 
    Document   : index
    Created on : Mar 7, 2022, 7:52:38 PM
    Author     : SE151464 Nguyen Hoang Huy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="demo" class="carousel slide" data-bs-ride="carousel">

    <!-- Indicators/dots -->
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
        <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
        <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
    </div>

    <!-- The slideshow/carousel -->




    <div id="demo" class="carousel slide" data-bs-ride="carousel">

        <!-- Indicators/dots -->
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
        </div>

        <!-- The slideshow/carousel -->




        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="${pageContext.request.contextPath}/images/bookbanner1.jpg" alt="bannel" class="d-block" style="width:100%; height: 50vh">
                <div class="carousel-caption">
                    <h1 style="color: black;float:left;font-size: 100px;font-family: 'Brush Script MT', cursive; font-weight: bold">Hey, we have that book you like</h1>
                </div>
            </div>

            <div class="carousel-item">
                <img src="${pageContext.request.contextPath}/images/bookbanner3.jpg" alt="bannel" class="d-block" style="width:100%; height: 50vh">
                <div class="carousel-caption">
                    <h1 style="color: black;text-align: center;font-size: 100px;font-family: 'Brush Script MT', cursive; font-weight: bold">A town isn???t a town without bookstore (Neil Gaiman)</h1>
                </div>  
            </div>

            <div class="carousel-item">
                <img src="${pageContext.request.contextPath}/images/bookbanner2.jpg" alt="bannel" class="d-block" style="width:100%; height: 50vh">
                <div class="carousel-caption">
                    <h1 style="color: black;float:right;font-size: 100px;font-family: 'Brush Script MT', cursive; font-weight: bold">Your dream life starts here</h1>
                </div> 
            </div>
        </div>


        <!--Phan trang dau-->



        <!-- Left and right controls/icons -->
        <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
        </button>
    </div>


    <!--Phan trang dau-->



    <!-- Left and right controls/icons -->
    <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
    </button>
</div>
<div class="container mt-3">
    <div class="row">
        <c:forEach var="book" items="${bookList}" >
            <div class="col">
                <div class="d-flex justify-content-center mb-3 product container mt-3">
                    <div class="card" style="width:300px;">
                        <img src="${pageContext.request.contextPath}/images/book/<c:if test="${book.bookImage==null}">book.gif</c:if><c:if test="${book.bookImage!=null}">${book.bookImage}</c:if>" class="img-circle" alt="${book.bookName}" style="width:100%;height: 25vh">
                            <div class="card-body text-center">
                                    <h4 class="card-title text-truncate" data-bs-toggle="tooltip" data-bs-placement="top" title="${book.bookName}">${book.bookName}</h4>
                            <p style="margin-left: 10px;color: red">
                                <c:if test="${book.discount != 0}"><del></c:if>
                                    <fmt:formatNumber value="${book.price}" pattern="$ #,##0.00" />
                                    <c:if test="${book.discount != 0}"></del></c:if>
                                </p>
                            <c:if test="${book.discount != 0}">
                                <p style="margin-left: 10px;color: red">
                                    <fmt:formatNumber value="${book.price - book.price * book.discount / 100}" pattern="$ #,##0.00" />
                                </p>
                            </c:if>
                            <c:if test="${book.discount == 0}">
                                <p style="margin-left: 10px;color: red">
                                    
                                </p>
                            </c:if>
                            <p class="card-text">Quantity: ${book.quantity}</p>
                            <p class="card-text">Bought: ${book.bought}</p>

                            <a href="${pageContext.request.contextPath}/detail/index.do?bookID=${book.bookID}" class="btn btn-primary" style="margin-top: 10px;">See Profile</a>
                        </div>
                    </div>
                    <br>
                </div>
            </div>
        </c:forEach>
    </div>

</div>

<!--phan trang cuoi-->
<div class="row">
    <div class="col" style="text-align: right;">
        <br/>
        <form action="<c:url value="/home/index.do" />">
            <button type="submit" class="btn btn-sm btn-info" name="op" value="FirstPage" title="First Page" <c:if test="${page==1}">disabled</c:if>><i class="bi bi-chevron-bar-left"></i></button>
            <button type="submit" class="btn btn-sm btn-info" name="op" value="PreviousPage" title="Previous Page" <c:if test="${page==1}">disabled</c:if>><i class="bi bi-chevron-left"></i></button>
            <button type="submit" class="btn btn-sm btn-info" name="op" value="NextPage" title="Next Page" <c:if test="${page==totalPage}">disabled</c:if>><i class="bi bi-chevron-right"></i></button>
            <button type="submit" class="btn btn-sm btn-info" name="op" value="LastPage" title="Last Page" <c:if test="${page==totalPage}">disabled</c:if>><i class="bi bi-chevron-bar-right"></i></button>
            <input type="text" name="gotoPage" value="${page}" class="btn btn-sm btn-outline-default" style="text-align: right;width: 32px;" title="Enter page number"/>
            <button type="submit" class="btn btn-sm btn-info" name="op" value="GotoPage" title="Goto Page"><i class="bi bi-arrow-up-right-circle"></i></button>
        </form>
        Page ${page}/${totalPage}
    </div>
</div>