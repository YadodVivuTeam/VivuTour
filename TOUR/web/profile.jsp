
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" />
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
    <body>
        !<!-- navbar include by components -->
        <%@include file="conponents/navbar.jsp" %>

        <div class="container rounded bg-white mt-5 mb-5">
            <div class="row">
                <div class="col-md-3 border-right">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span class="font-weight-bold">${user.getFullname()}</span><span class="text-black-50">${user.getEmail()}</span><span> </span></div>
                </div>
                <div class="col-md-5 border-right">
                    <div class="p-3 py-5">
                        <form action="profile" method="POST">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Profile Settings</h4>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-6">
                                    <label class="labels">Full name</label>
                                    <input type="text" class="form-control" placeholder="Full name" name="Fullname" value="${user.getFullname()}">
                                </div>
                                <div class="col-md-6">
                                    <label class="labels">National identify</label>
                                    <input type="text" class="form-control" placeholder="first name" name="cccd" value="${user.getCmnd()}">
                                </div>

                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <label class="labels">Username</label>
                                    <input type="text" class="form-control" placeholder="Username" name="user" value="${user.getUserName()}" readonly="">
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">Mobile Number</label>
                                    <input type="text" class="form-control" placeholder="enter phone number" name="phoe" value="${user.getPhone()}">
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">Email</label>
                                    <input type="text" class="form-control" placeholder="enter email" name="email" value="${user.getEmail()}">
                                </div>
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <input type="password" class="form-control" placeholder="Password" value="*************" name="password" id="password" readonly="">
                                        <div class="input-group-append">
                                            <a href="changePassword" class="btn btn-sy" style="width: 100%;">Change Password</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">Gender</label>
                                    <input type="" class="form-control" placeholder="education" name="userType" value="${user.isGender() ? 'male' : 'female'}" readonly="">
                                </div>

                                
                                <div class="col-md-12">
                                    <label class="labels">Date of birth</label>
                                    <input type="date" class="form-control" placeholder="enter address line 1" name="date" value="${user.getDate()}" readonly="">
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">Address</label>
                                    <input type="text" class="form-control" placeholder="enter address line 1" name="address" value="${user.getAddress()}">
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">User Type</label>
                                    <input type="" class="form-control" placeholder="education" name="userType" value="${user.getRoleName()}" readonly="">
                                </div>

                            </div>
                            <p class="text-danger">${mess}</p>
                            <div class="mt-5 text-center">
                                <input type="submit" class="btn btn-primary profile-button"value="Save profile" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</div>
</body>
</html>
