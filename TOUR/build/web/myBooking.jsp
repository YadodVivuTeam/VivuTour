<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Yadovuvi</title>
        <link rel="stylesheet" href="style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link
            href="https://fonts.googleapis.com/css2?family=Merienda:wght@400;700&family=Poppins:wght@400;500;600&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
        <link rel="stylesheet" href="css/common.css">
        <!-- Font Awesome -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />
        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
            />
        <!-- MDB -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.1/mdb.min.css"
            rel="stylesheet"
            />
    </head>
    <body>
        <%@include file="conponents/navbar.jsp" %>
        <div style="display: flex; flex-wrap: wrap;">
            <p style="width: 100%;"><span class="h1 container">My Booking</span>
                <c:if test="${messHuyTour!=null}">
                    <span class="h4 text-danger">${messHuyTour}</span>
                </c:if>
            </p>
            <table class="table container " style="width: 100%;">
                <tbody>
                    <tr>
                        <th style="width: 10%;">Ảnh</th>
                        <th style="width: 15%;">Địa Điểm</th>
                        <th style="width: 15%;">Hotel</th>
                        <th style="width: 10%;">Số Người</th>
                        <th style="width: 10%;">Ngày đặt</th>
                        <th style="width: 10%;">Total</th>
                        <th style="width: 10%;">Trạng thái</th>
                        <th></th>
                    </tr>
                    <c:forEach var="o" items="${requestScope.o}">
                        <tr style="width: 100%;">
                            <td style="width: 10%;">
                                <img src="${tDao.getTourByID(o.getTourId()).getImg()}" class="img-fluid" alt="Generic placeholder image" style="width: 100%; height: auto;">
                            </td>
                            <td style="width: 15%;">
                                <p>${ciDao.getCiHName(o.getTourId()).getCityName()}</p>
                            </td>
                            <td style="width: 15%;">
                                <p>${ciDao.getCiHName(o.getTourId()).getHotel_Name()}</p>
                            </td>
                            <td style="width: 10%;">
                                <p>${o.getPeople()}</p>
                            </td>
                            <td style="width: 10%;">
                                <p>${o.getDateOrder()}</p>
                            </td>


                            <td style="width: 10%;">
                                <p>${String.format("%.1f", o.getTotal())}VND</p>
                            </td>
                            <td style="width: 10%;">
                                <c:set var="statusText">
                                    <c:choose>
                                        <c:when test="${o.getStatus() eq 0}">Đang xử lí</c:when>
                                        <c:when test="${o.getStatus() eq 1}">Thanh toán thành công</c:when>
                                        <c:when test="${o.getStatus() eq 2}">Đang hủy tour</c:when>
                                        <c:when test="${o.getStatus() eq 3}">Hủy</c:when>
                                        <c:otherwise><p class="text-danger h6">Từ chối</p></c:otherwise>
                                    </c:choose>
                                </c:set>
                                <p>${statusText}</p>
                            </td>
                            <td>
                                <c:if test="${o.getStatus() eq 1}">
                                    <a href="DeleteBooking?id=${o.getOrderId()}" style="display: inline-block; background-color: red; color: white; padding: 5px 5px; border: none; border-radius: 4px; cursor: pointer;">Hủy tour</a>
                                </c:if>
                                <c:if test="${o.getStatus() eq 0}">
                                    <a href="DeleteBooking?id=${o.getOrderId()}" style="display: inline-block; background-color: red; color: white; padding: 5px 5px; border: none; border-radius: 4px; cursor: pointer;">Xóa</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>





        <%@include file="conponents/footer.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="js/call_api.js"></script>
        <script>
            var swiper = new Swiper(".swiper-container", {
                spaceBetween: 30,
                effect: "fade",
                loop: true,
                autoplay: {
                    delay: 3500,
                    disableOnInteraction: false,
                }
            });
        </script>
        <!-- MDB -->
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.1/mdb.min.js"
        ></script>
    </body>
</html>
