
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="icon" type="image/png" href="assets/img/favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <title>Light Bootstrap Dashboard by Creative Tim</title>

        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />


        <!-- Bootstrap core CSS     -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

        <!-- Animation library for notifications   -->
        <link href="assets/css/animate.min.css" rel="stylesheet"/>

        <!--  Light Bootstrap Table core CSS    -->
        <link href="assets/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>


        <!--  CSS for Demo Purpose, don't include it in your project     -->
        <link href="assets/css/demo.css" rel="stylesheet" />


        <!--     Fonts and icons     -->
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
        <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
    </head>
    <body>

        <div class="wrapper">
            <div class="sidebar" data-color="purple" data-image="assets/img/sidebar-5.jpg">

                <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->


                <div class="sidebar-wrapper">
                    <div class="logo">
                        <a href="/TOUR/home" class="simple-text">
                            Creative Tim
                        </a>
                    </div>

                    <ul class="nav">
                        <li>
                            <a href="adminSite">
                                <i class="pe-7s-graph"></i>
                                <p>Dashboard</p>
                            </a>
                        </li> 
                        <li>
                            <a href="getAccount">
                                <i class="pe-7s-user"></i>
                                <p>User Profile</p>
                            </a>
                        </li>
                        <li>
                        <li class="active">
                            <a href="getTour">
                                <i class="pe-7s-note2"></i>
                                <p>Manager Tour</p>
                            </a>
                        </li>
                        <li>
                            <a href="getOrder">
                                <i class="pe-7s-news-paper"></i>
                                <p>Manager Order Tour</p>
                            </a>
                        </li>
                        <li>
                            <a href="voucher">
                                <i class="pe-7s-news-paper"></i>
                                <p>Voucher</p>
                            </a>
                    </ul>
                </div>
            </div>

            <div class="main-panel">



                <div class="content">
                    <form action="actionUpdateUser" method="post" onsubmit="return validateForm()">  
                        <div class="container-fluid">
                           <div class="modal-header">
                            <h5 class="modal-title d-flex align-items-lg-center">
                                <i class="bi bi-person-lines-fill fs-3 me-2"></i>User Registration
                            </h5>
                            <button type="reset" class="btn-close shadow-none" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-6 ps-0 mb-5">
                                        <label class="form-label" >First Name</label>
                                        <input type="text" class="form-control shadow-none" name="firstName" required>
                                    </div>
                                    <div class="col-md-6 p-0 mb-3 ">
                                        <label class="form-label">Last Name</label>
                                        <input type="text" class="form-control shadow-none" name="lastName" required">
                                    </div>
                                    <div class="col-md-6 ps-0 mb-5" style="margin-top: 30px">
                                        <label class="form-label">Email</label>
                                        <input type="email" class="form-control shadow-none" name="email" required">
                                    </div>
                                    <c:if test="${messEmail !=null}">
                                        <p class="text-danger">${messEmail}</p>
                                    </c:if>
                                    <div class="col-md-6 p-0 mb-5" style="margin-top: 30px">
                                        <label class="form-label">Phone number</label>
                                        <input type="number" class="form-control shadow-none" name="phone" id="phone" required>
                                        <div id="phone-error" class="text-danger"></div>
                                    </div>
                                    <div class="col-md-6 p-0 mb-5" style="margin-top: 30px">
                                        <label class="form-label">username</label>
                                        <input type="input" class="form-control shadow-none" name="username" id="username" required>
                                        <div  class="text-danger"></div>
                                    </div>
                                    <c:if test="${messUser !=null}">
                                        <p class="text-danger">${messUser}</p>
                                    </c:if>
                                    <div class="col-md-6 p-0 mb-5" style="margin-top: 30px">
                                        <label class="form-label">People ID</label>
                                        <input type="number" class="form-control shadow-none" name="cccd" required>
                                    </div>
                                    <div class="col-md-12 p-0 mb-3" style="margin-top: 30px">
                                        <label class="form-label">Address</label>
                                        <textarea class="form-control shadow-none" rows="1" name="address" required"></textarea>
                                    </div>
                                    <div class="col-md-6 ps-0 mb-5" style="margin-top: 30px">
                                        <label class="form-label">Password</label>
                                        <input type="password" class="form-control shadow-none" name="password" id="password" required>
                                    </div>
                                    <c:if test="${messPass !=null}">
                                        <p class="text-danger">${messPass}</p>
                                    </c:if>
                                    <div class="col-md-6 p-0 mb-5" style="margin-top: 30px">
                                        <label class="form-label">Confirm Password</label>
                                        <input type="password" class="form-control shadow-none" name="re_password" required>
                                    </div>
                                    <c:if test="${messRePass !=null}">
                                        <p class="text-danger">${messRePass}</p>
                                    </c:if>
                                </div>
                            </div>
                                    <div class="text-center my-1 mt-3" style="margin-top: 40px">
                                <button type="submit" class="btn btn-dark shadow-none">REGISTER</button>
                            </div>
                        </div>
                    </form>
                </div>


               

            </div>
        </div>


    </body>
    <script>
        function validateForm() {
            var selectElement = document.querySelector('select[name="hotel_ID"]');
            if (selectElement.value === "") {
                alert("Please select a hotel before submitting the form.");
                return false; // Prevent form submission
            }
            return true; // Allow form submission
        }
    </script>
    <!--   Core JS Files   -->
    <script src="assets/js/jquery.3.2.1.min.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

    <!--  Charts Plugin -->
    <script src="assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
    <script src="assets/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

    <!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
    <script src="assets/js/demo.js"></script>
    <!--    <script>
            function ShowMessUpdate(id){
                var option = confirm('Are You Sure ?');
                if(option === true){
                    window.location.href = 'actionUpdate?tour='+id;
                }
            }
        </script>-->

</html> 
