<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Yadovuvi-facitilies</title>
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
            .pop:hover{
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
            <h2 class="fw-bold h-font text-center">OUR FACITILIES</h2>
            <div class="h-line bg-dark"></div>
            <p class="text-center mt-3">
                Lorem ipsum dolor sit amet consectetur adipiscing elit.Id nemo excepturi incidunt qui libero at
                omnis iure magni tempora ea.
            </p>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6 mb-5 px-4">
                    <div class="bg-white rounded shadow p-4 border-top border-4 border-dark pop">
                        <div class="d-flex align-items-center mb-2">
                            <img src="images/features/wifi.svg" width="40px">
                            <h5 class="m-0 ms-3">Wifi</h5>
                        </div>

                        <p> 
                            Lorem ipsum dolor sit amet consectetur adipiscing elit.Id nemo excepturi incidunt qui libero at
                            omnis iure magni tempora ea.
                        </p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-5 px-4">
                    <div class="bg-white rounded shadow p-4 border-top border-4 border-dark pop">
                        <div class="d-flex align-items-center mb-2">
                            <img src="images/features/wifi.svg" width="40px">
                            <h5 class="m-0 ms-3">Wifi</h5>
                        </div>

                        <p> 
                            Lorem ipsum dolor sit amet consectetur adipiscing elit.Id nemo excepturi incidunt qui libero at
                            omnis iure magni tempora ea.
                        </p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-5 px-4">
                    <div class="bg-white rounded shadow p-4 border-top border-4 border-dark pop">
                        <div class="d-flex align-items-center mb-2">
                            <img src="images/features/wifi.svg" width="40px">
                            <h5 class="m-0 ms-3">Wifi</h5>
                        </div>

                        <p> 
                            Lorem ipsum dolor sit amet consectetur adipiscing elit.Id nemo excepturi incidunt qui libero at
                            omnis iure magni tempora ea.
                        </p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-5 px-4">
                    <div class="bg-white rounded shadow p-4 border-top border-4 border-dark pop">
                        <div class="d-flex align-items-center mb-2">
                            <img src="images/features/wifi.svg" width="40px">
                            <h5 class="m-0 ms-3">Wifi</h5>
                        </div>

                        <p> 
                            Lorem ipsum dolor sit amet consectetur adipiscing elit.Id nemo excepturi incidunt qui libero at
                            omnis iure magni tempora ea.
                        </p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-5 px-4">
                    <div class="bg-white rounded shadow p-4 border-top border-4 border-dark pop">
                        <div class="d-flex align-items-center mb-2">
                            <img src="images/features/wifi.svg" width="40px">
                            <h5 class="m-0 ms-3">Wifi</h5>
                        </div>

                        <p> 
                            Lorem ipsum dolor sit amet consectetur adipiscing elit.Id nemo excepturi incidunt qui libero at
                            omnis iure magni tempora ea.
                        </p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-5 px-4">
                    <div class="bg-white rounded shadow p-4 border-top border-4 border-dark pop">
                        <div class="d-flex align-items-center mb-2">
                            <img src="images/features/wifi.svg" width="40px">
                            <h5 class="m-0 ms-3">Wifi</h5>
                        </div>

                        <p> 
                            Lorem ipsum dolor sit amet consectetur adipiscing elit.Id nemo excepturi incidunt qui libero at
                            omnis iure magni tempora ea.
                        </p>
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
                    <a href="#" class="d-inline-block mb-2 text-dark text-decoration-none">cáº©m Nang du lá»ch </a><br>
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