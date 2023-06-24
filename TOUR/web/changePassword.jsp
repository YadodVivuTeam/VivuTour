<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<div class="form-gap"></div>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="text-center">
                        <h3><i class="fa fa-lock fa-4x"></i></h3>
                        <h2 class="text-center">Change Password</h2>
                        <p>You can reset your password here.</p>
                        <div class="panel-body">

                            <form id="register-form" role="form" autocomplete="off" class="form" action="changePassword" method="post">
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                                        <input type="password" name="oldPass" placeholder="old password" value="${oldPass}" class="form-control" type="oldPass" required>
                                    </div>
                                    <c:if test="${messOldPass != null}">
                                        <p class="text-danger">${messOldPass}</p>
                                    </c:if>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                                        <input type="password" name="newPass" placeholder="new password" value="${newPass}" class="form-control"  type="newPass" required>
                                    </div>
                                    <c:if test="${messPass != null}">
                                        <p class="text-danger">${messPass}</p>
                                    </c:if>

                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                                        <input type="password" name="re_new" placeholder="re-new password" value="${re_new}" class="form-control"   type="re_new" required>
                                    </div>
                                    <c:if test="${messRe != null}">
                                        <p class="text-danger">${messRe}</p>
                                    </c:if>
                                </div>
                                <div class="form-group">
                                    <input name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Reset Password" type="submit">
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style>
        .form-gap {
            padding-top: 70px;
        }
    </style>
</div>