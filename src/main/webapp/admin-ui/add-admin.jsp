<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="de">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="shortcut icon" type="image/png" href="img/logo.png">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
          integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script
            src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
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
    <title>Neuer Admin registrieren</title>
    <script src="js/login.js"></script>
    <script src="https://kit.fontawesome.com/258052aeff.js"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/add-admin.css">
</head>

<body>

<nav aria-label="breadcrumb">
    <ol style="background-color: white" class="breadcrumb">
        <li title="Menu" class="breadcrumb-item"><a style="color: #00a1b2; background-color: white; font-size: 19px" href="/admin-menu" id="home"><i class="fas fa-angle-double-left"></i> Menu</a>
        </li>
    </ol>
</nav>


<h3 style="margin-left: 450px; margin-bottom: 30px">Registration for  new Adminstrator</h3>
<div class="container mt-2 mb-4" >
    <div class="col-sm-8 ml-auto mr-auto">
        <div class="col-sm-12 border  shadow rounded pt-2">
            <form id="registration-form" action="/newAdmin">

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
                <p style="display: none; color: red" id="emailWarning">This email is already registered</p>

                <div class="form-group">
                    <label class="font-weight-bold">Passwort <span class="text-danger">*</span></label>
                    <input type="password" name="passwort1" id="signuppassword" class="form-control"
                           placeholder="Geben Sie Passwort ein" pattern="^\S{6,}$"
                           required>
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
                            <input  value="weiblich" type="radio" name="geschlecht">
                            Weiblich
                        </label>
                        <label>
                            <input value="divers" type="radio" name="geschlecht">
                            Divers
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <input onclick="checkEmailExist()" type="button" name="signupsubmit" value="Registrieren"
                           class="save btn btn-block btn-primary">
                </div>
            </form>
        </div>
    </div>
</div>

<!-- jQuery first, then Popper.js, then Bootstrap JS -->

<script>
    function checkEmailExist() {
        var email = document.getElementById('signupemail').value;
        $.ajax
        (
            {
                url: '/checkEmail',
                data: {"email": email},
                type: 'post',
                cache: false,
                success: function (data) {
                    if (data === "Email is not available") {
                        $('#emailWarning').css("display", "block");
                        $('#save').attr("disabled", "disabled");
                        return false;
                    } else if (data === "Email is available") {
                        $('#emailWarning').css("display", "none");
                        $('#save').removeAttr("disabled");
                        $("#registration-form").submit();
                        return true;
                    }
                },
                error: function () {
                    alert('error');
                }
            }
        );
    }

    $(function () {
        $('#datetimepicker4').datetimepicker({
            format: 'L',
            maxDate: moment()
        });
    });

</script>

</body>
</html>