<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Yadovuvi-ROOMS</title>
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
            .pop:hover {
                border-top-color: var(--teal) !important;
                transform: scale(1.03);
                transition: all 0.3s;
            }
        </style>
    </head>

    <body class="bg-light">
        !<!-- navbar include by components -->
        <%@include file="conponents/navbar.jsp" %>
        
        
        <div class="modal fade" id="loginModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
             aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="">
                        <div class="modal-header">
                            <h5 class="modal-title d-flex align-items-lg-center">
                                <i class="bi bi-person-circle fs-3 me-2"></i>User Login
                            </h5>
                            <button type="reset" class="btn-close shadow-none" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label class="form-label">Email address</label>
                                <input type="email" class="form-control shadow-none">
                            </div>
                            <div class="mb-4">
                                <label class="form-label">Password</label>
                                <input type="password" class="form-control shadow-none">
                                <!-- <span id="passwordHelpInline" class="form-text">
                                    Must be 8-20 characters long.
                                </span> -->
                            </div>
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <button type="submit" class="btn btn-dark shadow-none">LOGIN</button>
                                <a href="javascript: void(0)" class="text-secondary text-decoration-none">Forgot
                                    Password</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="modal fade" id="registerModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
             aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <form>
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
                                    <div class="col-md-6 ps-0 mb-3">
                                        <label class="form-label">First Name</label>
                                        <input type="text" class="form-control shadow-none">
                                    </div>
                                    <div class="col-md-6 p-0 mb-3 ">
                                        <label class="form-label">Last Name</label>
                                        <input type="text" class="form-control shadow-none">
                                    </div>
                                    <div class="col-md-6 ps-0 mb-3">
                                        <label class="form-label">Email</label>
                                        <input type="email" class="form-control shadow-none">
                                    </div>
                                    <div class="col-md-6 p-0 mb-3">
                                        <label class="form-label">Phone number</label>
                                        <input type="number" class="form-control shadow-none">
                                    </div>
                                    <div class="col-md-12 p-0 mb-3">
                                        <label class="form-label">Address</label>
                                        <textarea class="form-control shadow-none" rows="1"></textarea>
                                    </div>
                                    <div class="col-md-6 ps-0 mb-3">
                                        <label class="form-label">Pincode</label>
                                        <input type="number" class="form-control shadow-none">
                                    </div>
                                    <div class="col-md-6 p-0 mb-3">
                                        <label class="form-label">Date of birth</label>
                                        <input type="date" class="form-control shadow-none">
                                    </div>
                                    <div class="col-md-6 ps-0 mb-3">
                                        <label class="form-label">Password</label>
                                        <input type="password" class="form-control shadow-none">
                                    </div>
                                    <div class="col-md-6 p-0 mb-3">
                                        <label class="form-label">Confirm Password</label>
                                        <input type="password" class="form-control shadow-none">
                                    </div>

                                </div>
                            </div>
                            <div class="text-center my-1">
                                <button type="submit" class="btn btn-dark shadow-none">REGISTER</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="my-5 px-4">
            <h2 class="fw-bold h-font text-center">OUR ROOMS</h2>
            <div class="h-line bg-dark"></div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-12 mb-lg-0 mb-4 px-lg-0">
                    <nav class="navbar navbar-expand-lg navbar-light bg-white rounded shadow">
                        <div class="container-fluid flex-lg-column align-items-stretch">
                            <h4 class="mt-4">FILTERS</h4>
                            <button class="navbar-toggler shadow-none" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#filterDropdown" aria-controls="navbarNav" aria-expanded="false"
                                    aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse flex-column align-items-stretch mt-2" id="filterDropdown">
                                <div class="border bg-light p-3 rounded mb-3">
                                    <h5 class="mb-3" style="font-size: 18px;">CHECK AVAILABILITY</h5>
                                    <label class="form-label">Check-in</label>
                                    <input type="date" class="form-control shadow-none mb-3">
                                    <label class="form-label">Check-out</label>
                                    <input type="date" class="form-control shadow-none">
                                </div>
                                <div class="border bg-light p-3 rounded mb-3">
                                    <h5 class="mb-3" style="font-size: 18px;">FACITILIES</h5>
                                    <div class="mb-2">
                                        <input type="checkbox" id="f1" class="form-check-input shadow-none me-1">
                                        <label class="form-label" for="f1"> Facility one</label>
                                    </div>
                                    <div class="mb-2">
                                        <input type="checkbox" id="f2" class="form-check-input shadow-none me-1">
                                        <label class="form-label" for="f2"> Facility two</label>
                                    </div>
                                    <div class="mb-2">
                                        <input type="checkbox" id="f3" class="form-check-input shadow-none me-1">
                                        <label class="form-label" for="f3"> Facility three</label>
                                    </div>

                                </div>
                                <div class="border bg-light p-3 rounded mb-3">
                                    <h5 class="mb-3" style="font-size: 18px;">GUESTS</h5>
                                    <div class="d-flex">
                                        <div class="me-3">
                                            <label class="form-label">Adults</label>
                                            <input type="number" class="form-control shadow-none">
                                        </div>
                                        <div>
                                            <label class="form-label">Children</label>
                                            <input type="number" class="form-control shadow-none">
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </nav>
                </div>

                <div class="col-lg-9 col-md-12 px-4">
                    <div class="card mb-4 border-0 shadow">
                        <div class="row g-0 p-3 align-items-center">
                            <div class="col-md-5 mb-lg-0 mb-md-0 mb-3">
                                <img src="images/rooms/1.jpg" class="img-fluid rounded">
                            </div>
                            <div class="col-md-5 px-lg-3 px-md-3 px-0">
                                <h5>Simple Room Name</h5>
                                <div class="features mb-3">
                                    <h6 class="mb-1">Features</h6>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> 2 Rooms</span>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> 1 Bathroom</span>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> 1 Balcony</span>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> 3 sofa</span>
                                </div>
                                <div class="facitilites mb-3">
                                    <h6 class="mb-1">Facitilies</h6>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> wifi</span>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> Television</span>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> AC</span>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> Room heater</span>
                                </div>
                                <div class="guests mb-3">
                                    <h6 class="mb-1">Guests</h6>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> 5 Adusts</span>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> 4 Children</span>
                                </div>
                            </div>
                            <div class="col-md-2 text-center">
                                <h6 class="mb-">500000 VND/1 ÄÃªm</h6>
                                <a href="#" class="btn btn-sm w-100 text-white custom-bg shadow-none mb-2">Book Now</a>
                                <a href="#" class="btn btn-sm w-100 btn-outline-dark shadow-none">More details</a>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-4 border-0 shadow">
                        <div class="row g-0 p-3 align-items-center">
                            <div class="col-md-5 mb-lg-0 mb-md-0 mb-3">
                                <img src="images/rooms/1.jpg" class="img-fluid rounded">
                            </div>
                            <div class="col-md-5 px-lg-3 px-md-3 px-0">
                                <h5>Simple Room Name</h5>
                                <div class="features mb-3">
                                    <h6 class="mb-1">Features</h6>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> 2 Rooms</span>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> 1 Bathroom</span>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> 1 Balcony</span>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> 3 sofa</span>
                                </div>
                                <div class="facitilites mb-3">
                                    <h6 class="mb-1">Facitilies</h6>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> wifi</span>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> Television</span>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> AC</span>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> Room heater</span>
                                </div>
                                <div class="guests mb-3">
                                    <h6 class="mb-1">Guests</h6>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> 5 Adusts</span>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> 4 Children</span>
                                </div>
                            </div>
                            <div class="col-md-2 mt-lg-0 mt-md-0 mt4 text-center">
                                <h6 class="mb-">500000 VND/1 ÄÃªm</h6>
                                <a href="#" class="btn btn-sm w-100 text-white custom-bg shadow-none mb-2">Book Now</a>
                                <a href="#" class="btn btn-sm w-100 btn-outline-dark shadow-none">More details</a>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-4 border-0 shadow">
                        <div class="row g-0 p-3 align-items-center">
                            <div class="col-md-5 mb-lg-0 mb-md-0 mb-3">
                                <img src="images/rooms/1.jpg" class="img-fluid rounded">
                            </div>
                            <div class="col-md-5 px-lg-3 px-md-3 px-0">
                                <h5>Simple Room Name</h5>
                                <div class="features mb-3">
                                    <h6 class="mb-1">Features</h6>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> 2 Rooms</span>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> 1 Bathroom</span>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> 1 Balcony</span>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> 3 sofa</span>
                                </div>
                                <div class="facitilites mb-3">
                                    <h6 class="mb-1">Facitilies</h6>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> wifi</span>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> Television</span>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> AC</span>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> Room heater</span>
                                </div>
                                <div class="guests mb-3">
                                    <h6 class="mb-1">Guests</h6>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> 5 Adusts</span>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap"> 4 Children</span>
                                </div>
                            </div>
                            <div class="col-md-2 text-center">
                                <h6 class="mb-">500000 VND/1 ÄÃªm</h6>
                                <a href="#" class="btn btn-sm w-100 text-white custom-bg shadow-none mb-2">Book Now</a>
                                <a href="#" class="btn btn-sm w-100 btn-outline-dark shadow-none">More details</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- footer -->
        <div class="container-fluid bg-white mt-5">
            <div class="row">
                <div class="col-lg-4 p-4">
                    <h3 class="h-font fw-bold fs-3">Yadovuvi</h3>
                    <p> Lorem ipsum dolor sit amet consectetur adipiscing elit.
                        Id nemo excepturi incidunt qui libero at
                        omnis iure magni tempora ea.</p>
                </div>
                <div class="col-lg-4 p-4">
                    <h5 class="mb-3">Links</h5>
                    <a href="#" class="d-inline-block mb-2 text-dark text-decoration-none">KhÃ¡ch sáº¡n</a><br>
                    <a href="#" class="d-inline-block mb-2 text-dark text-decoration-none">Tours</a><br>
                    <a href="#" class="d-inline-block mb-2 text-dark text-decoration-none">Cáº©m Nang du lá»ch </a><br>
                    <a href="#" class="d-inline-block mb-2 text-dark text-decoration-none">Others</a>
                </div>
                <div class="col-lg-4 p-4">
                    <h5 class="mb-3">Follow us</h5>
                    <a href="#" class="d-inline-block text-dark text-decoration-none mb-2"><i
                            class="bi bi-twitter me-1"></i> Twitter</a><br>
                    <a href="#" class="d-inline-block text-dark text-decoration-none mb-2"><i
                            class="bi bi-facebook me-1"></i> Facebook</a><br>
                    <a href="#" class="d-inline-block text-dark text-decoration-none mb-2"><i
                            class="bi bi-instagram me-1"></i> Instagram</a><br>
                </div>
            </div>
        </div>
        <h6 class="text-center bg-dark text-white p-3 m-0">Design and development by Yadovuvi team</h6>

    </body>

</html>