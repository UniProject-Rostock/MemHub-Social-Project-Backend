<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="de">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="shortcut icon" type="image/png" href="img/logo.png">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
          integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/loginPage.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
            integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
            integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
            crossorigin="anonymous"></script>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment-with-locales.min.js"></script>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.21/moment-timezone-with-data-2012-2022.min.js"></script>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.0-alpha14/js/tempusdominus-bootstrap-4.min.js"></script>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.0-alpha14/css/tempusdominus-bootstrap-4.min.css"/>
    <title>Anmelden</title>


</head>

<body>


<c:if test="${not empty error}">
    <div class="alert alert-danger">
        <p>You have entered an invalid email or password</p>
        <br/>
    </div>
</c:if>

<c:if test="${not empty success}">
    <div class="alert alert-success">
        <p>You have registered successfully</p>
        <br/>
    </div>
</c:if>

<div class="container mt-2 mb-4">
    <div class="col-sm-8 ml-auto mr-auto">
        <ul class="nav nav-pills nav-fill mb-1" id="pills-tab" role="tablist">
            <li class="nav-item"><a class="nav-link active" id="pills-signin-tab" data-toggle="pill"
                                    href="#pills-signin" role="tab" aria-controls="pills-signin" aria-selected="true">Anmelden</a>
            </li>
            <li class="nav-item"><a class="nav-link" id="pills-signup-tab" data-toggle="pill" href="#pills-signup"
                                    role="tab" aria-controls="pills-signup" aria-selected="false">Registrieren</a></li>
        </ul>
        <div class="tab-content" id="pills-tabContent">
            <div class="tab-pane fade show active" id="pills-signin" role="tabpanel" aria-labelledby="pills-signin-tab">
                <div class="col-sm-12 border border-primary shadow rounded pt-2">
                    <div class="text-center"><img src="../img/logo.png" class="rounded-circle border p-1"></div>

                    <form action="/doLogin" method="post">
                        <div class="form-group">
                            <label class="font-weight-bold">Email-Adresse <span class="text-danger">*</span></label>
                            <input type="email" name="username" id="anmelde-email" class="form-control"
                                   placeholder="Geben Sie Ihre Email-Adresse ein" required>
                        </div>
                        <div class="form-group">
                            <label class="font-weight-bold">Password <span class="text-danger">*</span></label>
                            <input type="password" name="password" id="anmelde-password" class="form-control"
                                   placeholder="Geben Sie Ihr Passwort ein" required>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="remember-button">
                                        <label class="custom-control-label" for="remember-button">Erinnere mich</label>
                                    </div>
                                </div>
                                <div class="col text-right"><a id="forgot-pass" href="javascript:;" data-toggle="modal"
                                                               data-target="#forgotPass">Passwort vergessen?</a></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" value="Anmelden" class="btn btn-block btn-primary">
                        </div>
                    </form>

                </div>
            </div>


            <div class="tab-pane fade" id="pills-signup" role="tabpanel" aria-labelledby="pills-signup-tab">
                <div class="col-sm-12 border border-primary shadow rounded pt-2">
                    <div class="text-center"><img src="../img/logo.png" class="rounded-circle border p-1"></div>

                    <form action="/addUser">

                        <div class="form-group">
                            <label class="font-weight-bold">Vorname <span class="text-danger">*</span></label>
                            <input type="text" name="vorname" id="signupusername" class="form-control"
                                   placeholder="Vorname" required>

                        </div>
                        <div class="form-group">
                            <label class="font-weight-bold">Nachname <span class="text-danger">*</span></label>
                            <input type="text" name="nachname" class="form-control" placeholder="Nachname" required>

                        </div>
                        <div class="form-group">
                            <label class="font-weight-bold">Email-Adresse<span class="text-danger">*</span></label>
                            <input type="email" name="email" id="signupemail" class="form-control"
                                   placeholder="Geben Sie eine gueltige Email-Adresse ein" required>
                        </div>
                        <p style="display: none" id="emailWarning">This email is already registered</p>

                        <div class="form-group">
                            <label class="font-weight-bold">Passwort <span class="text-danger">*</span></label>
                            <input type="password" name="passwort1" id="signuppassword" class="form-control"
                                   placeholder="Geben Sie Passwort ein" pattern="^\S{6,}$"
                                   onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Mindestens 6 Zeichen' : ''); if(this.checkValidity()) form.password_two.pattern = this.value;"
                                   required>
                        </div>
                        <div class="form-group">
                            <label class="font-weight-bold">Passwort wiederholen <span
                                    class="text-danger">*</span></label>
                            <input type="password" name="passwort2" id="signupcpassword" class="form-control"
                                   pattern="^\S{6,}$"
                                   onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Das Passwort stimmt nicht überein' : '');"
                                   placeholder="Wiederholen Sie das Passwort" required>
                        </div>

                        <div class="form-group">
                            <label class="font-weight-bold">Geburtsdatum <span class="text-danger">*</span></label>

                            <div class="input-group date" id="datetimepicker4" data-target-input="nearest">
                                <input name="geburtsdatum" type="text" class="form-control datetimepicker-input"
                                       data-target="#datetimepicker4" placeholder="Wählen Sie Ihr Geburtsdatum aus"
                                       required/>
                                <div class="input-group-append" data-target="#datetimepicker4"
                                     data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="font-weight-bold">Geschlecht <span class="text-danger">*</span></label>
                            <div class="col-md-8 ">
                                <label>
                                    <input value="maennlich" type="radio" name="geschlecht" checked>
                                    Maennlich
                                </label>
                                <label>
                                    <input value="weiblich" type="radio" name="geschlecht">
                                    Weiblich
                                </label>
                                <label>
                                    <input value="divers" type="radio" name="geschlecht">
                                    Divers
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <input type="submit" name="signupsubmit" value="Registrieren"
                                   class="save btn btn-block btn-primary">
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>


    <!-- Modal -->
    <div class="modal fade" id="forgotPass" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <form method="post" id="forgotpassForm">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Passwort vergessen</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <p>Geben Sie Ihre Email ein und wir werden Sie kontaktieren</p>
                            <label class="font-weight-bold">Email <span class="text-danger">*</span></label>
                            <input type="email" name="forgotemail" id="forgotemail" class="form-control"
                                   placeholder="Geben Sie Ihre Email-Adresse ein" required>
                        </div>
                        <div class="form-group">
                        </div>
                    </div>
                    <div class="modal-footer">

                        <button type="submit" name="forgotPass" class="btn btn-primary"><i class="fa fa-envelope"></i>Anfrage senden
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<!-- jQuery first, then Popper.js, then Bootstrap JS -->


<script type="text/javascript">
    $(function () {
        $('#datetimepicker4').datetimepicker({
            format: 'L',
            maxDate: moment()
        });
    });

    function checkEmailExist() {
        var xhttp = new XMLHttpRequest();
        var email = document.getElementById('signupemail').value;
        xhttp.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                if (this.responseText === "Email is not available" && $('#emailWarning').css('display') === 'block') {
                    $("#emailWarning").css("margin-top", "50px");
                    $('#emailWarning').css("display", "block");
                    $('#save').attr("disabled", "disabled");
                    return false;

                } else {
                    $("form").css("margin-top", "0");
                    $('#emailWarning').css("display", "none");
                    $('#save').removeAttr("disabled");
                    return true;
                }
            }
            return false;
        };
        try {
            xhttp.open("POST", "http://localhost:8083/checkEmail/" + email, true);
            xhttp.send();
        } catch (e) {
            alert("unable to connect to server");
        }
    }
</script>
</body>

</html>

