<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                        <li class="active">
                            <a href="getAccount">
                                <i class="pe-7s-user"></i>
                                <p>User Profile</p>
                            </a>
                        </li>
                        <li>
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

                <form  action="getAccount">
                    <div class="content" style="margin-top: 5%">                          
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">
                                        <div>
                                            <div class="header">
                                                <div>
                                                    <h4 class="title">User Manager</h4>
                                                    <p class="category">Here is a subtitle for this table</p>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="content table-responsive table-full-width">
                                            <table class="table table-hover table-striped">
                                                <thead>
                                                <th>ID</th>
                                                <th>Full Name</th>
                                                <th>CMND</th>
                                                <th>Email</th>
                                                <th>Gender</th>
                                                <th>UserName</th>
                                                <th>Phone</th>                                               
                                                <th>Role</th>
                                                <th>Is Delete</th>

                                                </thead>
                                                <tbody>
                                                    <c:forEach var="k" items="${requestScope.listAcc}">
                                                        <c:if test="${  k.getRoleName() != 1}">
                                                            <tr>
                                                                <td>${k.getUserID()}</td>
                                                                <td>${k.getFullname()}</td>
                                                                <td>${k.getCmnd()}</td>
                                                                <td>${k.getEmail()}</td>
                                                                <td>
                                                                    <c:if test="${k.isGender() == true}">
                                                                        <span>Male</span>  
                                                                    </c:if>
                                                                    <c:if test="${k.isGender() == false}">
                                                                        <span>FeMale</span>
                                                                    </c:if>
                                                                </td>                                                       
                                                                <td>${k.getUserName()}</td>
                                                                <td>${k.getPhone()}</td>
                                                                <td>${k.getRoleName()}</td>                                                    
                                                                <td>

                                                                    <c:if test="${k.isIsBlocked() == true}">
                                                                        <a href="actionUpdateUser?userID=${k.getUserID()}&isBlocked=False">
                                                                            <button type="button" class="btn  btn-fill btn-danger " >Ban</button>
                                                                            <div class="clearfix"></div>  
                                                                        </a>

                                                                    </c:if>
                                                                    <c:if test="${k.isIsBlocked() == false}">
                                                                        <a href="actionUpdateUser?userID=${k.getUserID()}&isBlocked=True">
                                                                            <button type="button" class="btn  btn-fill btn-success" >Active</button>
                                                                            <div class="clearfix"></div>
                                                                        </a>

                                                                    </c:if>
                                                                </td> 
                                                            </c:if>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>



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

</html>
