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
                        </li>
                    </ul>
                </div>
            </div>

            <div class="main-panel">
               


                <div class="content">
                    <form action="tourDetail" method="post">  
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="card">
                                        <div class="header">
                                            <h3 class="title" style="font-weight:400">Tour Detail</h3>
                                        </div>

                                        <div class="content"> 
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">Tour Name</label>
                                                        <input type="text" class="form-control" placeholder="TOUR NAME" name="tourName" value="${tourDetail.getTourName()}">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Tour ID</label>
                                                        <input type="text" class="form-control" placeholder="Company" name="tour_ID" readonly="" value="${tourDetail.getTour_ID()}">

                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Start Date</label>
                                                        <input type="text" class="form-control" placeholder="YYYY-MM-dd" name="startDate" value="${tourDetail.getStartDate()}">
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">End Date</label>
                                                        <input type="text" class="form-control" placeholder="YYYY-MM-dd" name="endDate" value="${tourDetail.getEndDate()}">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>City</label>
                                                        <input type="text" class="form-control" placeholder="City" readonly="" value="${city.getCityName()}">
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Hotel</label>
                                                        <select class="form-control" placeholder="Hotel" name="hotel_ID">
                                                            <c:forEach var="h" items="${requestScope.hotel}">
                                                                <option ${tourDetail.getHotel_ID() == h.getHotel_ID() ? "selected": ""} value="${h.getHotel_ID()}">${h.getHotel_Name()}</option>
                                                            </c:forEach>
                                                        </select> 
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Type</label>
                                                        <select class="form-control" placeholder="Type" name="Type_ID">
                                                            <c:forEach var="t" items="${requestScope.type}">
                                                                <option value="${t.getType_ID()}" ${tourDetail.getType_name() == t.getType_ID() ? "selected" : ""}>${t.getType_Name()}</option>
                                                            </c:forEach>
                                                        </select>                                                                                                         
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Number People</label>
                                                        <input type="number" class="form-control" placeholder="Number People" name="numberPeople" value="${tourDetail.getNumberPeople()}">
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>IMG</label>
                                                        <input type="text" class="form-control" placeholder="Link Img" name="img" value="${tourDetail.getImg()}">
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Total Price</label>
                                                        <input type="text" class="form-control" placeholder="Total Price" name="totalPrice" value="${tourDetail.getTotalPrice()}">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label>Content</label>
                                                        <textarea rows="5" class="form-control"placeholder="Here can be your Content" name="content" style="height: 300px">${tourDetail.getContent()}</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div style=" display: flex; margin-top: 8%">
                                                <div class="header" style="width: 20%">
                                                    <h5 class="title" style=" font-size: 20px; font-weight:400;">List Activity</h5>
                                                </div>
                                               
                                            </div>
                                            <div class="content table-responsive table-full-width">
                                                <table class="table table-hover table-striped">
                                                    <thead>
                                                    <th style="display: none">ID Tour</th>
                                                    <th style="display: none">Activity ID</th>
                                                    <th>STT</th>
                                                    <th>IS Active</th>
                                                    <th>Activity Name</th>
                                                    <th>Landscape Address</th>
                                                    <th>Time</th> 
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="k" items="${requestScope.listActivity}" varStatus="index">
                                                            <tr>
                                                                <td style="display: none">${k.getTour_ID()}</td>
                                                                <td style="display: none">${k.getActivity_ID()}</td> 
                                                                <td>${index.count}</td>                                                              
                                                                <td>    
                                                                    <input type="checkbox" ${k.isIsActive() == true ? "checked":""} id="isAcitive" name="activity" value="${k.getActivity_ID()}">
                                                                    <!--<input type="hidden" name="isActive${index.index}" value="${k.isIsActive() == true ? 'yes' : 'no'}">-->
                                                                </td>
                                                                <td>${k.getActivityName()}</td>
                                                                <td>${k.getLandscape_Address()}</td>
                                                                <td>${k.getTime()}</td>                                                        
                                                            </tr>
                                                        </c:forEach>
                                                    <script>
                                                        // Your script here
                                                    </script>
                                                    </tbody>
                                                </table>
                                            </div>

                                            <div style="display: flex">
                                                <c:if test="${tourDetail.getIsDelete() == false}">
                                                    <button type="submit" class="btn  btn-fill " style="margin-right: 5%" name="isDelete" value="false">Ban Tour</button>
                                                    <div class="clearfix"></div>  
                                                </c:if>
                                                <c:if test="${tourDetail.getIsDelete() == true}">
                                                    <button type="submit" class="btn  btn-fill " style="margin-right: 5%; background-color: red; border-color: red" name="isDelete" value="true">UnBan Tour</button>
                                                    <div class="clearfix"></div>
                                                </c:if>
                                                <button type="submit" class="btn btn-info btn-fill pull-right" >Update Tour</button>
                                                <div class="clearfix"></div>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card card-user">
                                        <div class="image">
                                            <img src="https://ununsplash.imgix.net/photo-1431578500526-4d9613015464?fit=crop&fm=jpg&h=300&q=75&w=400" alt="..."/>
                                        </div>
                                        <div class="content">
                                            <div class="author">
                                                <a href="#">
                                                    <img class="avatar border-gray" src="assets/img/faces/face-3.jpg" alt="..."/>
                                                    <h4 class="title">Mike Andrew<br />
                                                        <small>michael24</small>
                                                    </h4>
                                                </a>
                                            </div>
                                            <p class="description text-center"> "Lamborghini Mercy <br>
                                                Your chick she so thirsty <br>
                                                I'm in that two seat Lambo"
                                            </p>
                                        </div>
                                        <hr>
                                        <div class="text-center">
                                            <button href="#" class="btn btn-simple"><i class="fa fa-facebook-square"></i></button>
                                            <button href="#" class="btn btn-simple"><i class="fa fa-twitter"></i></button>
                                            <button href="#" class="btn btn-simple"><i class="fa fa-google-plus-square"></i></button>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </form>
                </div>


                <footer class="footer">
                    <div class="container-fluid">
                        <nav class="pull-left">
                            <ul>
                                <li>
                                    <a href="#">
                                        Home
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        Company
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        Portfolio
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        Blog
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </footer>

            </div>
        </div>


    </body>

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
