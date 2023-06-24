<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light bg-white px-lg-3 py-lag-3 py-lg-2 shadow-sm sticky-top">
            <div class="container-fluid">
                <a class="navbar-brand me-5 fw-blod fs-3 h-font" href="home">Yadovuvi</a>
                <button class="navbar-toggler shadow-non" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link me-2" href="home">Tours</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link me-2" href="#">Cẩm nang du lịch</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false">
                                Others
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item me-2" href="#">Ưu đãi đặc biệt</a></li>
                                <li><a class="dropdown-item me-2" href="#">Giới thiệu</a></li>
                                <li><a class="dropdown-item me-2" href="#">Hỗ trợ</a></li>
                            </ul>
                        </li>
                    </ul>
                    <c:if test="${user != null}">
                        <div class="d-flex">
                            <button class="btn btn-outline-primary shadow-none me-lg-3 me-2" type="button"   aria-expanded="true">
                                <a href="MyBooking">Booking</a>
                            </button>
                        </div>
                        <div class="d-flex">
                            <button class="btn btn-outline-primary shadow-none me-lg-3 me-2" type="button"   aria-expanded="true">
                                <a href="MyTicket">My Ticket</a>
                            </button>
                        </div>
                    </c:if>  

                    <div class="d-flex">
                        <!-- <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"> -->
                        <!-- <button class="btn btn-outline-success" type="submit">Search</button> -->
                        <c:if test="${user != null}">
                            <div class="dropdown">
                                <button class="btn btn-outline-dark shadow-none me-lg-3 me-2 dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                    ${user.getFullname()}
                                    <span class="dropdown-arrow"></span>
                                </button>

                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <li><a class="dropdown-item" href="profile">Profile</a></li>
                                        <c:if test="${user.getRoleName() eq 'admin'}">
                                        <li><a class="dropdown-item" href="admin/adminSite">Admin Manager</a></li>
                                        </c:if>  
                                    <li><a class="dropdown-item" href="signout">Sign out</a></li>

                                </ul>
                            </div>

                        </c:if>

                        <c:if test="${user == null}">
                            <button type="button" class="btn btn-outline-dark shadow-none me-lg-3 me-2" data-bs-toggle="modal"
                                    data-bs-target="#loginModal">
                                Login
                            </button>
                            <button type="button" class="btn btn-outline-dark shadow-none" data-bs-toggle="modal"
                                    data-bs-target="#registerModal">
                                Register
                            </button>
                        </c:if>
                    </div>
                </div>
            </div>
        </nav>

        <!-- navbar.jsp -->
        <!-- Your other HTML code -->
        <!-- navbar.jsp -->
        <!-- Your other HTML code -->

        <!-- Place the modal code here -->
        <div class="modal fade" id="loginModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
             aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="signin" method="post">
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
                                <input type="input" class="form-control shadow-none" name="email" required>
                            </div>
                            <div class="mb-4">
                                <label class="form-label">Password</label>
                                <input type="password" class="form-control shadow-none" name="password" required>
                                <span id="passwordHelpInline" class="form-text">
                                    Must be 8-20 characters long.
                                </span>
                            </div>
                            <p class="text-danger">${mess}</p> <!-- Place the ${mess} attribute here -->
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <button type="submit" class="btn btn-dark shadow-none" id="loginButton">LOGIN</button>
                                <a href="forgot" class="text-secondary text-decoration-none">Forgot
                                    Password</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Your other HTML code -->


        <!-- Your other HTML code -->


        <div class="modal fade" id="registerModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
             aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <form method="post" action="signup">
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
                                        <label class="form-label" >First Name</label>
                                        <input type="text" class="form-control shadow-none" name="firstName" required>
                                    </div>
                                    <div class="col-md-6 p-0 mb-3 ">
                                        <label class="form-label">Last Name</label>
                                        <input type="text" class="form-control shadow-none" name="lastName" required">
                                    </div>
                                    <div class="col-md-6 ps-0 mb-3">
                                        <label class="form-label">Email</label>
                                        <input type="email" class="form-control shadow-none" name="email" required">
                                    </div>
                                    <c:if test="${messEmail !=null}">
                                        <p class="text-danger">${messEmail}</p>
                                    </c:if>
                                    <div class="col-md-6 p-0 mb-3">
                                        <label class="form-label">Phone number</label>
                                        <input type="number" class="form-control shadow-none" name="phone" id="phone" required>
                                        <div id="phone-error" class="text-danger"></div>
                                    </div>
                                    <div class="col-md-6 p-0 mb-3">
                                        <label class="form-label">username</label>
                                        <input type="input" class="form-control shadow-none" name="username" id="username" required>
                                        <div  class="text-danger"></div>
                                    </div>
                                    <c:if test="${messUser !=null}">
                                        <p class="text-danger">${messUser}</p>
                                    </c:if>
                                    <div class="col-md-6 p-0 mb-3">
                                        <label class="form-label">Căn cước công dân</label>
                                        <input type="number" class="form-control shadow-none" name="cccd" required>
                                    </div>
                                    <div class="col-md-12 p-0 mb-3">
                                        <label class="form-label">Address</label>
                                        <textarea class="form-control shadow-none" rows="1" name="address" required"></textarea>
                                    </div>
                                    <div class="col-md-6 ps-0 mb-3">
                                        <label class="form-label">Password</label>
                                        <input type="password" class="form-control shadow-none" name="password" id="password" required>
                                    </div>
                                    <c:if test="${messPass !=null}">
                                        <p class="text-danger">${messPass}</p>
                                    </c:if>
                                    <div class="col-md-6 p-0 mb-3">
                                        <label class="form-label">Confirm Password</label>
                                        <input type="password" class="form-control shadow-none" name="re_password" required>
                                    </div>
                                    <c:if test="${messRePass !=null}">
                                        <p class="text-danger">${messRePass}</p>
                                    </c:if>
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

    </body>
    <!-- JavaScript code -->
    <script>
        <c:if test="${showModal}">
            <c:set var="showModalJS_login" value="true" />
        </c:if>

        <c:if test="${showModalJS_login}">
        window.addEventListener('DOMContentLoaded', (event) => {
            document.querySelector('button[data-bs-target="#loginModal"]').click();
        });
        </c:if>
        var passwordInput = document.getElementById("password");

        passwordInput.addEventListener("input", function () {
            var password = this.value;
            var errorMessage = document.getElementById("password-error");

            if (password.length < 8) {
                errorMessage.textContent = "Password must be at least 8 characters long.";
                passwordInput.setCustomValidity("Password must be at least 8 characters long.");
            } else {
                errorMessage.textContent = "";
                passwordInput.setCustomValidity("");
            }
        });

    </script>
    !<!-- modal register show -->

    <script>
        <c:if test="${showModalRegister}">
            <c:set var="showModalJS_register" value="true" />
        </c:if>
        <c:if test="${showModalJS_register}">
        window.addEventListener('DOMContentLoaded', (event) => {
            document.querySelector('button[data-bs-target="#registerModal"]').click();
        });
        </c:if>
    </script>
    <script>
        // JavaScript validation
        const phoneInput = document.getElementById('phone');
        const phoneError = document.getElementById('phone-error');

        phoneInput.addEventListener('input', function () {
            // Remove any existing error message
            phoneError.textContent = '';

            // Validate phone number
            const phoneNumber = phoneInput.value.trim();
            const phoneRegex = /^\d{10}$/; // Assuming a 10-digit phone number

            if (!phoneRegex.test(phoneNumber)) {
                phoneError.textContent = 'Please enter a valid 10-digit phone number';
            }
        });
    </script>

</html>