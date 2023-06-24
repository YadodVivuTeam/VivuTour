<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.*"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="VN">

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
        <style>
            .check-form {
                margin-top: -50px;
                z-index: 2;
                position: relative;
            }
        </style>

    </head>

    <body class="bg-light">
        !<!-- navbar include by components -->
        <%@include file="conponents/navbar.jsp" %>


        <div class="container-fluid px-lg-4 mt-4">
            <div class="swiper swiper-container">
                <div class="swiper-wrapper ">
                    <div class="swiper-slide">
                        <img src="images/carousel/g-1.jpg" class="w-100 d-block">
                    </div>
                    <div class="swiper-slide">
                        <img src="images/carousel/g-2.jpg" class="w-100 d-block">
                    </div>
                    <div class="swiper-slide">
                        <img src="images/carousel/g-3.jpg" class="w-100 d-block">
                    </div>
                    <div class="swiper-slide">
                        <img src="images/carousel/g-4.jpg" class="w-100 d-block">
                    </div>
                </div>
            </div>
        </div>
        <!-- check -->
        <div class="container check-form">
            <div class="row text-align-center">
                <div class="col-lg-12 bg-white shadow p-4 rounded">
                    <h1 class="font">Du lịch theo cá tính 8   </h1>
                    <h5 class="mb-4 h-font">Trải nghiệm trọn vẹn - Giá cả phải chăng</h5>
                    <form action="searchTour" method="POST">
                        <div class="row align-items-end">
                            <div class="col-lg-3 mb-3">
                                <label class="form-label" style="font-weight: 500;">Ngày khởi hành</label>
                                <input type="date" class="form-control shadow-none" name="startDate">
                            </div>
                            <div class="col-lg-3 mb-3">
                                <label class="form-label" style="font-weight: 500;">Đến</label>
                                <select class="form-control shadow-none" name="to">
                                    <c:forEach var="city" items="${cityList}">
                                        <option value="${city.getCity_Name()}">${city.getCity_Name()}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="col-lg-3 mb-3">
                                <button type="submit" class="btn btn-info btn-lg btn-block"  >Tìm kiếm</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>



        <!--popular-->
        <div class="container">
            <h1 class=" mt-5 pt-4 mb-4 text-center">Tour dành cho các bạn</h1>
            <p class="mb-4 text-center">Hãy cùng trải nghiệm với chúng tôi</p>
            <div class="row popular-list">
                <c:forEach var="i" items="${requestScope.tour}">
                    <div class="col-lg-4 col-md-6 my-3">
                        <a href="TourDetail?id=${i.getTour_ID()}">
                            <div class="popular-card">
                                <img src="${i.getImg()}" alt="Image description">

                                <div class="card-content">

                                    <div class="card-rating">
                                        <ion-icon name="star"></ion-icon>
                                        <ion-icon name="star"></ion-icon>
                                        <ion-icon name="star"></ion-icon>
                                        <ion-icon name="star"></ion-icon>
                                        <ion-icon name="star"></ion-icon>
                                    </div>
                                    <p class="card-subtitle">
                                        <a href="TourDetail?id=${i.getTour_ID()}">${cDAO.getCityByID(hDAO.getHotelByID(i.getHotel_ID()).getCityID()).getCity_Name()}</a>
                                    </p>
                                    <h3 class="h3 card-title">         
                                        <a href="TourDetail?id=${i.getTour_ID()}">Hotel: ${hDAO.getHotelByID(i.getHotel_ID()).getHotel_Name()}</a>
                                    </h3>
                                    <h4 class="h3 card-title">
                                        <a href="TourDetail?id=${i.getTour_ID()}" style="color: red">${String.format("%.1f",i.getTotalPrice())}VNĐ</a>
                                    </h4>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>

                <div class="col-lg-12 text-center mt-5">
                    <a href="#" class="btn btn-sm btn-outline-dark rounded-0 fw-bold shadow-none">More >>></a>
                </div>
            </div>


            <!-- footer -->
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

    </body>

</html>