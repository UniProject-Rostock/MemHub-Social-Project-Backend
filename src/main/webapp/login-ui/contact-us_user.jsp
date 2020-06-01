<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <link rel="shortcut icon" type="image/png" href="img/logo.png">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/contact-us_user.css">
    <script src="https://kit.fontawesome.com/258052aeff.js"
            crossorigin="anonymous"></script>
    <title>Kontaktiere uns</title>
</head>
<body>

<nav aria-label="breadcrumb">
    <ol style="background-color: white" class="breadcrumb">
        <li title="Login Page" class="breadcrumb-item"><a style="color: #00a1b2; background-color: white; text-decoration: none; font-size: 18px" href="/login" id="home"><i class="fas fa-backward"></i> Login Page</a>
        </li>
    </ol>
</nav>

<div class="container mt-2 mb-4">
    <c:if test="${not empty successContact}">
        <div  class="alert alert-success alert-dismissible" role="alert">
            <button type="button" onclick="this.parentNode.parentNode.removeChild(this.parentNode);" class="close" data-dismiss="alert"><span aria-hidden="true">x</span><span class="sr-only">Close</span></button>
            <strong><i class="fa fa-success"></i> Erfolgreich!</strong> <p id="alert" style="font-family: sans-serif; ">Ihre Nachricht wurde uns erfolgreich gesendet</p>
        </div>
    </c:if>
</div>

<h3 style="margin-left: 550px; margin-bottom: 30px">Kontaktiere uns</h3>
<div class="container mt-2 mb-4" >
    <div class="col-sm-8 ml-auto mr-auto">

        <div class="col-sm-12 border  shadow rounded pt-2">

            <form action="/sendeNachricht">

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
                           placeholder="Geben Sie Ihre Email-Adresse ein" required>
                </div>


                <div class="form-group">
                    <label class="font-weight-bold">Nachricht <span class="text-danger">*</span></label>
                    <textarea name="nachricht" class="form-control" id="message" rows="5" placeholder="Nachricht verfassen..."></textarea>
                </div>

                <div class="form-group">
                    <input type="submit" name="send" value="Abschicken"
                           class="save btn btn-block btn-primary">
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>