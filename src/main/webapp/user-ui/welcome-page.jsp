<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" type="image/png" href="img/logo.png">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/user-profile.css">
    <script src="https://kit.fontawesome.com/258052aeff.js"
            crossorigin="anonymous"></script>
    <title>User profile</title>
    <style>
        #ta1, #ta2, #ta3 {

            text-decoration: none;
            position: relative;
            transition: color 0.1s, background-color 0.1s;
        }

        #ta1::before, #ta2::before, #ta3::before {
            content: '';
            display: block;
            position: absolute;
            bottom: 3px;
            left: 0;
            height: 3px;
            width: 100%;
            background-color: #00a1b2;
            transform-origin: right top;
            transform: scale(0, 1);
            transition: color 0.1s, transform 0.2s ease-out;
        }

        #ta1:active::before, #ta2:active::before, #ta3:active::before {
            background-color: #00a1b2;
        }

        #ta1:hover::before, #ta1:focus::before {
            transform-origin: left top;
            transform: scale(0.7, 1);
            margin-left: 20px;
            margin-right: 20px;
        }

        #ta2:hover::before, #ta2:focus::before {
            transform-origin: left top;
            transform: scale(0.8, 1);
            margin-left: 20px;
            margin-right: 20px;
        }

        #ta3:hover::before, #ta3:focus::before {
            transform-origin: left top;
            transform: scale(1.2, 1);
            margin-left: 20px;
            margin-right: 20px;
        }

        #saveBtn:hover {
            background-color: #00848e;
        }
    </style>

    <title></title>
</head>
<body>
<nav style="background-color: #00a1b2;" class="mb-1 navbar navbar-expand-lg navbar-dark default-color fixed-top">
    <a class="navbar-brand" href="#">MemHub</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-3"
            aria-controls="navbarSupportedContent-3" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent-3">

        <ul class="navbar-nav ml-auto nav-flex-icons">
            <li class="nav-item dropdown">
                <a style="cursor: pointer" class="nav-link dropdown-toggle waves-effect waves-light"
                   id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                </a>
                <div class="dropdown-menu dropdown-menu-right dropdown-default"
                     aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item waves-effect waves-light" href="/doLogout">Abmelden <i class="fas fa-sign-out-alt"></i></a>
                </div>
            </li>
        </ul>
    </div>
</nav>


<h3 style="margin-left: 240px; margin-bottom: 30px; margin-top: 100px">Willkommen zu MemHub. Vervollstaendigen Sie bitte Ihre Informationen</h3>
<div class="container mt-2 mb-4" >
    <div class="col-sm-8 ml-auto mr-auto">
        <div class="col-sm-12 border  shadow rounded pt-2">
            <form id="welcome-form" action="/confirmWelcomeInfos">
                <input type="text" value="<%= request.getParameter("uid")%>" name="uid" hidden>

                <div class="form-group">
                    <label class="font-weight-bold"><strong>Wohnort </strong><span class="text-danger">*</span></label>
                    <input type="text" name="wohnort" id="wohnort" class="form-control"
                           placeholder="Wohnort" required>
                </div>

                <div class="form-group">
                    <div class="form-group">
                        <label class="font-weight-bold" for="beziehungsstatus"><strong>Beziehungsstatus </strong><span class="text-danger">*</span></label>
                        <select name="beziehungsstatus" class="form-control" id="beziehungsstatus">
                            <option value="Single">Single</option>
                            <option value="In einer Beziehung">In einer Beziehung</option>
                            <option value="Verlobt">Verlobt</option>
                            <option value="Verheiratet">Verheiratet</option>
                            <option value="Getrennt">Getrennt</option>
                            <option value="Geschieden">Geschieden</option>
                            <option value="Verwitwet">Verwitwet</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="aboutMe"><strong>Beschreibung </strong><span class="text-danger">*</span></label>
                    <textarea placeholder="Schreiben Sie mal kurz ueber Ihre Hobbies und Ihr Interesse" name="beschreibung" style="height: 125px" id="aboutMe"
                              class="form-control"></textarea>
                </div>

                <div class="form-group">
                    <input style="background-color: #00a1b2" type="submit" value="Weiter zu meinem Konto"
                           class="save btn btn-block btn-primary">
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>


<script>

</script>

</body>
</html>