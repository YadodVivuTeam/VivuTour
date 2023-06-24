<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.*"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">

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
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css"
            rel="stylesheet"
            />
        <!-- MDB -->
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"
        ></script>
        <style>
            .rating {
                display: inline-block;
            }

            .rating input {
                display: none;
            }

            .rating label {
                float: right;
                color: #aaa;
            }

            .rating label:before {
                content: "\2605";
                font-size: 25px;
            }

            .rating input:checked ~ label {
                color: #ffbf00;
            }

            .rating label:hover,
            .rating label:hover ~ label {
                color: #ffbf00;
            }

        </style>
    </head>

    <body class="bg-light">
        !<!-- navbar include by components -->
        <%@include file="conponents/navbar.jsp" %>
        <div class="untree_co-section">
            <div class="container">
                <h5 class="section-title text-left mb-4" style="text-align: center; /* Gạch chân dưới chữ */
                    font-size: 75px; /* Làm chữ to */
                    font-weight: bold; /* Làm chữ đậm */ ">${t.getTourName()}</h5>
                <div class="row justify-content-between align-items-center">
                    <div class="col-lg-10">
                        <figure class="img-play-video">
                            <img src="${t.getImg()}" alt="Image" class="img-fluid rounded-20" style="width: 100%; height: auto;">
                        </figure>
                    </div>



                    <div class="col-lg-10">

                        <h5>- Thông tin:</h5>
                        <p id="content">
                            ${t.getContent().replace("-", "<br>       +")}
                    </div>
                    <h5>- Các hoạt động:</h5>
                    <ul class="list-unstyled two-col clearfix list_active">

                        <c:forEach var="i" items="${requestScope.lat}">
                            <li>+ ${i.getActivityName()} : ${i.getTime()}</li>
                            </c:forEach>
                        <style>
                            .list_active li{
                                padding-left: 15px;
                                padding-bottom: 10px;
                            }
                        </style>
                    </ul>
                    <div  class="col-lg-12">
                        <h4 style="color: red">${t.getTotalPrice()}VND</h4>
                        <p><a href="BookingTour?id=${id}" class="btn btn-primary">Booking</a></p>
                    </div>
                </div>
            </div>
        </div>
        <c:if test="${listF != null}">
            <form action="Feedback" method="Post">
                <input type="text" name="tourID" value="${t.getTour_ID()}" style="display: none;">
                <input type="text" name="userID" value="${user.getUserID()}" style="display: none;">
                <section>
                    <div class="container" >
                        <div class="row d-flex justify-content-center" >
                            <div class="col-md-12 col-lg-10 col-xl-8" style="border: 1px solid black;">
                                <div class="card">
                                    <div class="card-body">
                                        <c:forEach var="i" items="${listF}">
                                            <div class="d-flex flex-start align-items-center">
                                                <div>
                                                    <h6 class="fw-bold text-primary mb-1">${uDAO.searchUser("UserID", i.getUserID()).getFullname()}</h6>
                                                </div>
                                            </div>

                                            <p class="mt-3 mb-4 pb-2">
                                                ${i.getContext()}
                                            </p>
                                            <div class="small d-flex justify-content-start">
                                                <a href="#!" class="d-flex align-items-center me-3">
                                                    <i class="far fa-thumbs-up me-2"></i>
                                                    <p class="mb-0">Like</p>
                                                </a>
                                            </div>
                                        </c:forEach>
                                    </div>


                                    <c:if test="${user!=null}">
                                        <div class="rating">
                                            <input type="radio" id="star5" name="rating" value="5"required />
                                            Đánh giá:
                                            <label for="star5"></label>
                                            <input type="radio" id="star4" name="rating" value="4" />
                                            <label for="star4"></label>
                                            <input type="radio" id="star3" name="rating" value="3" />
                                            <label for="star3"></label>
                                            <input type="radio" id="star2" name="rating" value="2" />
                                            <label for="star2"></label>
                                            <input type="radio" id="star1" name="rating" value="1" />
                                            <label for="star1"></label>
                                        </div>
                                        <div class="card-footer py-3 border-0" style="background-color: #c3c2bd5d1d1;">
                                            <div class="d-flex flex-start w-100">
                                                <div class="form-outline w-100">
                                                    <textarea class="form-control" id="textAreaExample" rows="4"
                                                              style="background: #dad6ba;" name="context"></textarea>
                                                    <label class="form-label" for="textAreaExample">Message</label>
                                                </div>
                                            </div>
                                            <div class="float-end mt-2 pt-1">
                                                <button type="submit" class="btn btn-primary btn-sm">Post comment</button>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </form>
        </c:if>
        

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