<%-- 
    Document   : HomePageCustomer
    Created on : Dec 31, 2021, 4:28:23 PM
    Author     : pc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Exam A&D</title>
        <link rel="stylesheet" href="styles/bootstrap.css" type="text/css">
        <style>
            <jsp:include page="styles/css/bootstrap.css"></jsp:include>
            </style>
        </head>

        <body>
            <header>
                <nav class="navbar-expand-md navbar-dark" style="background-color: forestgreen">
                    <a href="<%=request.getContextPath()%>/homeCus" class="navbar-brand text-uppercase text-xl-start">Bookstore - A&D 2021</a>
                <c:if test="${cookie.usernameCookie.value == null}">
                    <span class="navbar-brand text-center">Xin chào, <c:out value="${username}"></c:out></span>
                </c:if>
                <c:if test="${cookie.usernameCookie.value != null}">
                    <span class="navbar-brand text-center">Xin chào, <c:out value="${cookie.usernameCookie.value}"></c:out></span>
                </c:if>
                <a href="<%=request.getContextPath()%>/cart" class="navbar-brand text-center">Giỏ hàng</a>
            </nav>
        </header>
        <br>

        <div class="row">
            <div class="container">
                <h3 class="text-center text-uppercase">Chào mừng bạn đến với cửa hàng sách!</h3>
                <br>

                <div class="row height d-flex justify-content-center align-items-center">
                    <div class="row height d-flex justify-content-center align-items-center">
                        <div class="col-md-8">
                            <form action="search" method="post">
                                <div class="search"> <i class="fa fa-search"></i> <input type="text" class="form-control" name="bookTitle" required placeholder="Tìm kiếm theo tên sách" oninvalid="this.setCustomValidity('Không được bỏ trống từ khóa!')" oninput="this.setCustomValidity('')"> </div>
                                <div class="text-center"> <button type="submit" class="btn btn-warning">Tìm kiếm</button> </div>
                            </form>
                        </div>
                    </div>
                </div>
                <br>

                <div class="table-responsive-md">
                    <table class="table table-bordered table-striped table-hover">
                        <thead class="table-primary text-center text-capitalize">
                            <tr>
                                <th>Ảnh</th>
                                <th>ISBN</th>
                                <th>Tựa đề</th>
                                <th>Tác giả</th>
                                <th>Tóm lược</th>
                                <th>Thể loại</th>
                                <th>Ấn bản thứ</th>
                                <th>Ngày xuất bản</th>
                                <th>Nhà xuất bản</th>
                                <th>Số trang</th>
                                <th>Ngôn ngữ</th>
                                <th>Kích thước</th>
                                <th>Trọng lượng</th>
                                <th>Giá</th>
                                <th>Giảm giá</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="itemBook" items="${listItemBooks}">
                                <tr>
                                    <td>
                                        <c:forEach items="${itemBook.images}" var="image">
                                            <img src="${image.src}" style="width:175px;height:250px;">
                                        </c:forEach>
                                    </td>
                                    <td>
                                        <c:out value="${itemBook.book.isbn}"/>
                                    </td>
                                    <td>
                                        <c:out value="${itemBook.book.title}"/>
                                    </td>
                                    <td>
                                        <c:forEach items="${itemBook.book.author}" var="auth">
                                            <c:out value="${auth.name}"/>
                                        </c:forEach>
                                    </td>
                                    <td>
                                        <c:out value="${itemBook.book.summary}"/>
                                    </td>
                                    <td>
                                        <c:out value="${itemBook.book.category.type}"/>
                                    </td>
                                    <td>
                                        <c:out value="${itemBook.book.edition} ed."/>
                                    </td>
                                    <td>
                                        <c:out value="${itemBook.book.publicationDate}"/>
                                    </td>
                                    <td>
                                        <c:out value="${itemBook.book.publisher.name}"/>
                                    </td>
                                    <td>
                                        <c:out value="${itemBook.book.numOfPages} trang"/>
                                    </td>
                                    <td>
                                        <c:out value="${itemBook.book.language}"/>
                                    </td>
                                    <td>
                                        <c:out value="${itemBook.book.dimensions}"/>
                                    </td>
                                    <td>
                                        <c:out value="${itemBook.book.weight} gam"/>
                                    </td>
                                    <td>
                                        <c:out value="${itemBook.price} VNĐ"/>
                                    </td>
                                    <td>
                                        <c:out value="${itemBook.discount}"/>
                                    </td>
                                    <td>
                                        <form action="addToCart" method="post">
                                            <input type="hidden" name="itemBarcode" value="${itemBook.barcode}"/>
                                            <input type="number" name="quantity" required placeholder="Nhập số lượng sản phẩm muốn thêm" oninvalid="this.setCustomValidity('Không được bỏ trống trường này /\nSố lượng nhập vào không hợp lệ')" oninput="this.setCustomValidity('')"/>
                                            <input type="hidden" name="cartId" value="${cookie.cartCookie.value}"/>
                                            <button type="submit" class="btn btn-primary">Thêm vào giỏ hàng</button>
                                        </form>
                                        <c:if test="${cookie.replyCookie.value == 'Success' && cookie.barcodeCookie.value == itemBook.barcode}">
                                            <h5 style="color: mediumblue">Thêm vào giỏ hàng thành công!</h5>
                                        </c:if>
                                        <c:if test="${cookie.replyCookie.value == 'Failed' && cookie.barcodeCookie.value == itemBook.barcode}">
                                            <h5 style="color: red">Thêm vào giỏ hàng không thành công. Hãy thử lại!</h5>
                                        </c:if>
                                        <c:if test="${cookie.replyCookie.value == 'Invalid' && cookie.barcodeCookie.value == itemBook.barcode}">
                                            <h5 style="color: red">Số lượng nhập vào không hợp lệ. Hãy thử lại!</h5>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
