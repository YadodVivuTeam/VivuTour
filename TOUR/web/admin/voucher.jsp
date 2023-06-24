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
                            <a href="getAccount">
                                <i class="pe-7s-user"></i>
                                <p>User Profile</p>
                            </a>
                        </li>
                        <li>
                        <li >
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
                        <li  class="active">
                            <a href="voucher">
                                <i class="pe-7s-news-paper"></i>
                                <p>Voucher</p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="main-panel">
                <nav class="navbar navbar-default navbar-fixed">
                    <div class="container-fluid">
                       
                        
                    </div>

                    <div class="container-fluid pt-4 px-4">
                        <div class="row g-4">
                            <div class="">
                                <div class="bg-secondary rounded h-100 p-4">
                                    <h4  style="margin-left: 1.5%; margin-top: 2% ">Add Voucher</h4>
                                    <div>
                                    <form action="voucher" method="POST" >
                                        <div class="content" style="margin-top: 5%" >
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="card">
                                                            <div class="header" style="display: flex">
                                                                <div class="col-md-6">
                                                                    <label class="form-label">Voucher Name</label>
                                                                    <input type="text" class="form-control col-4" name="name" >
                                                                </div>
                                                                 
                                                                <div class="col-md-6">
                                                                    <label class="form-label">Start </label>
                                                                    <input type="date" class="form-control col-3" name="start">
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label class="form-label">End </label>
                                                                    <input type="date" class="form-control col-3" name="end" >
                                                                </div>
                                                                <div class="col-md-3">  
                                                                    <label class="form-label">Discount</label>
                                                                    <select class="form-select form-select-sm form-control col-md-6" aria-label=".form-select-sm example" name="discount">
                                                                        <option  class="form-label" value="5">5%</option>
                                                                        <option  class="form-label" value="10">10%</option>
                                                                        <option  class="form-label" value="20">20%</option>
                                                                        <option  class="form-label" value="30">30%</option>
                                                                    </select>
                                                                </div>
                                                            
                                                                <div class="col-md-3">
                                                                    <label class="form-label">Quantity </label>
                                                                    <input type="number" class="form-control col-3" name="quantity" >
                                                                </div>
                                                                <button type="submit" class="btn btn-primary " style="margin-top: 1.8%">Add new voucher</button>
                                                            </div>
                                                            <div class="right-side" style="margin-left: 1%">
                                                                <div class="col-md-6">
                                                                    <label class="form-label">Voucher Code</label>
                                                                    <input type="text" class="form-control col-4" id="code-input" name="code">
                                                                </div>
                                                                <a class="btn btn-primary" onclick="generateCode()" style="margin-top: 1.8%"">Create Code</a>
                                                            </div>

                                                            </form>
                                                        </div> 
                                                        <div class="bg-secondary text-center rounded p-4">
                                                            <div class="d-flex align-items-center justify-content-between mb-4">
                                                                <h4  style="margin-left: 1.5%; margin-top: 2% ">List Voucher</h4>
                                                            </div>
                                                            <div class="table-responsive">
                                                                <table id="categoryTable" class="table text-start align-middle table-bordered table-hover mb-0">
                                                                    <thead>
                                                                        <tr class="text-white">
                                                                            <th scope="col">Voucher name</th>
                                                                            <th scope="col">Voucher Code</th>
                                                                            <th scope="col">Quantity Available</th>
                                                                            <th scope="col">Discount</th>
                                                                            <th scope="col">Start</th>
                                                                            <th scope="col">End</th>
                                                                            <th scope="col"></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <c:forEach var="v" items="${voucher}">
                                                                            <tr>
                                                                                <td>${v.getDescription()}</td>
                                                                                <td>${v.getDiscountCode()}</td>
                                                                                <td>${v.getQuantity()}</td>
                                                                                <td>${v.getDiscount()}%</td>
                                                                                <td>${v.getStartDate()}</td>
                                                                                <td>${v.getEndDate()}</td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div id="pagination"></div>
                                                        </div>
                                                    </div>
                                                </div>
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
                        <script>
                                                                    function generateCode() {
                                                                        var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
                                                                        var codeLength = 10;
                                                                        var generatedCode = '';

                                                                        for (var i = 0; i < codeLength; i++) {
                                                                            var randomIndex = Math.floor(Math.random() * characters.length);
                                                                            generatedCode += characters.charAt(randomIndex);
                                                                        }

                                                                        document.getElementById('code-input').value = generatedCode;
                                                                    }

                        </script>
                        </html>
