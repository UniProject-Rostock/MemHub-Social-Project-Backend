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
    <a class="navbar-brand" href="/startseite?uid=<%= request.getParameter("uid")%>">MemHub</a>
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
                    <a class="dropdown-item waves-effect waves-light" href="#">Dokumentation</a>
                    <a class="dropdown-item waves-effect waves-light" href="/doLogout">Abmelden <i
                            class="fas fa-sign-out-alt"></i></a>
                </div>
            </li>
            <li class="nav-item">
                <a style="cursor: pointer" class="nav-link waves-effect waves-light">
                    <i class="fa fa-bell"></i>
                </a>
            </li>


        </ul>
    </div>
</nav>

<div class="wrapper">
    <div class="container">

        <div class="wraper">
            <div class="row">
                <div class="col-sm-12">
                    <div class="bg-picture text-center">
                        <div class="bg-picture-overlay"></div>
                        <div class="profile-info-name">

                            <img src="img/profile.png" class="thumb-lg img-circle img-thumbnail pro"
                                 alt="profile-image" height="300" width="200">

                        </div>
                        <div class="col-lg-6 col-md-3 col-sm-3 hidden-xs">
                            <div class="pull-right">
                                <div style="margin-top: 20px" class="dropdown">
                                    <a style=" background-color: #00a1b2; color: white; margin-right: -110px;"
                                       data-toggle="dropdown"
                                       class="dropdown-toggle btn-rounded btn  waves-effect waves-light" href="#"><i
                                            class="fas fa-camera"></i> Bild aktualisieren</a>
                                    <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                        <li><a type="file" class="dropdown-item waves-effect waves-light"
                                               href="/changePhoto?uid=<%=request.getParameter("uid")%>">Bild
                                            aktualisieren</a></li>
                                        <li><a class="dropdown-item waves-effect waves-light" href="#">Bild loeschen</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--/ meta -->
                </div>
            </div>
            <div class="row user-tabs">
                <div class="col-lg-6 col-md-9 col-sm-9">
                    <ul class="nav nav-tabs tabs" style="width: 100%;">
                        <li class="active tab" style="width: 25%;">
                            <a id="ta1" href="#home-2" data-toggle="tab" aria-expanded="false" class="active">
                                <span class="visible-xs"><i style="color:#00a1b2;" class="fa fa-user"></i></span>
                                <span style="color: #00a1b2; font-weight: bold;" class="hidden-xs">Info</span>
                            </a>
                        </li>
                        <li class="tab" style="width: 25%;">
                            <a id="ta2" href="#profile-2" data-toggle="tab" aria-expanded="false">
                                <span class="visible-xs"><i style="color:#00a1b2;" class="far fa-keyboard"></i></span>
                                <span style="color: #00a1b2; font-weight: bold;" class="hidden-xs">Beitraege</span>
                            </a>
                        </li>

                        </li>
                        <li class="tab" style="width: 25%;">
                            <a id="ta3" href="#settings-2" data-toggle="tab" aria-expanded="false">
                                <span class="visible-xs"><i style="color:#00a1b2;" class="fa fa-cog"></i></span>
                                <span style="color: #00a1b2; font-weight: bold;" class="hidden-xs">Einstellungen</span>
                            </a>
                        </li>

                    </ul>
                </div>
                <div class="col-lg-6 col-md-3 col-sm-3 hidden-xs">
                    <div class="pull-right">
                        <div class="dropdown">
                            <a style=" background-color: #00a1b2; color: white" data-toggle="dropdown"
                               class="dropdown-toggle btn-rounded btn  waves-effect waves-light" href="#"> Optionen
                                <span class="caret"></span></a>
                            <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                <li><a class="dropdown-item waves-effect waves-light" href="#">Folgen</a></li>
                                <li><a class="dropdown-item waves-effect waves-light" href="#">Nicht mehr folgen</a>
                                </li>
                                <li><a class="dropdown-item waves-effect waves-light" href="#">Blokieren</a></li>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">

                    <div class="tab-content profile-tab-content">
                        <div class="tab-pane active" id="home-2">
                            <div class="row">
                                <div class="col-md-4">
                                    <!-- Personal-Information -->
                                    <div class="panel panel-default panel-fill">
                                        <div class="panel-heading">
                                            <p style="font-size: 20px"><i style="color:#00a1b2;"
                                                                          class="fas fa-globe-americas"></i> Steckbrief
                                            </p>
                                        </div>


                                        <div class="panel-body">
                                            <c:forEach items="${user}" var="u">
                                            <div class="about-info-p">
                                                <strong><i class="fas fa-signature"></i> Name</strong>
                                                <br>
                                                <p class="text-muted">${u.vorname} ${u.nachname}</p>
                                            </div>
                                            <div class="about-info-p m-b-0">
                                                <strong><i class="fas fa-birthday-cake"></i> Alter</strong>
                                                <br>
                                                <p id="age" class="text-muted">${u.geburtsDatum}</p>
                                            </div>
                                            <div class="about-info-p m-b-0">
                                                <strong><i class="fas fa-map-marker-alt"></i> Wohnort</strong>
                                                <br>
                                                <p class="text-muted">${u.wohnort}</p>
                                            </div>
                                            <div class="about-info-p m-b-0">
                                                <strong><i class="fas fa-user"></i> Geschlecht</strong>
                                                <br>
                                                <p class="text-muted">${u.geschlecht}</p>
                                            </div>
                                            <div class="about-info-p m-b-0">
                                                <strong><i class="fas fa-people-arrows"></i> Beziehungsstatus</strong>
                                                <br>
                                                <p class="text-muted">${u.beziehungsstatus}</p>
                                            </div>
                                            <div class="about-info-p m-b-0">
                                                <strong><i class="far fa-calendar-alt"></i> Beigetreten</strong>
                                                <br>
                                                <p id="beigetreten" class="text-muted">${u.beigetreten}</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Personal-Information -->
                                </div>

                                <div class="col-md-8">
                                    <!-- Personal-Information -->
                                    <div class="panel panel-default panel-fill">
                                        <div class="panel-heading">
                                            <h3 style="font-size: 20px" class="panel-title">Beschreibung</h3>
                                        </div>
                                        <div class="panel-body">
                                            <p>${u.beschreibung}</p>
                                        </div>
                                    </div>
                                    </c:forEach>
                                    <!-- Personal-Information -->
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane" id="profile-2">
                            <!-- Personal-Information -->
                            <div class="panel panel-default panel-fill">

                                <div class="panel-body">
                                    <!--- \\\\\\\Post-->
                                    <div class="card gedf-card">
                                        <div class="card-header">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <div class="mr-2">
                                                        <img class="rounded-circle" width="45" src="profile.png" alt="">
                                                    </div>
                                                    <div class="ml-2">
                                                        <div class="h5 m-0">Mustermann</div>

                                                    </div>
                                                </div>
                                                <div>
                                                    <div class="dropdown">
                                                        <button style="color: #00a1b2;"
                                                                class="btn btn-link dropdown-toggle" type="button"
                                                                id="gedf-drop2" data-toggle="dropdown"
                                                                aria-haspopup="true" aria-expanded="false">

                                                        </button>
                                                        <div class="dropdown-menu dropdown-menu-right"
                                                             aria-labelledby="gedf-drop2">
                                                            <div class="h6 dropdown-header">Konfiguration</div>

                                                            <a class="dropdown-item" href="#">Verbergen</a>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="card-body">
                                            <div class="text-muted h7 mb-2"><i class="fa fa-clock-o"></i>10 min ago
                                            </div>


                                            <p class="card-text">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo recusandae
                                                nulla rem eos ipsa praesentium esse magnam nemo dolor
                                                sequi fuga quia quaerat cum, obcaecati hic, molestias minima iste
                                                voluptates.
                                            </p>
                                        </div>
                                        <div class="card-footer">
                                            <textarea class="form-control" placeholder="write a comment..."
                                                      rows="3"></textarea>
                                            <br>
                                            <button style="background-color: #00a1b2;" type="button"
                                                    class="btn btn-info  pull-right">Kommentieren
                                            </button>
                                            <div class="clearfix"></div>

                                        </div>
                                    </div>
                                    <!-- Post /////-->


                                    <!--- \\\\\\\Post-->
                                    <div class="card gedf-card">
                                        <div class="card-header">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <div class="mr-2">
                                                        <img class="rounded-circle" width="45" src="profile.png" alt="">
                                                    </div>
                                                    <div class="ml-2">
                                                        <div class="h5 m-0">Mustermann</div>

                                                    </div>
                                                </div>
                                                <div>
                                                    <div class="dropdown">
                                                        <button style="color: #00a1b2;"
                                                                class="btn btn-link dropdown-toggle" type="button"
                                                                id="gedf-drop1" data-toggle="dropdown"
                                                                aria-haspopup="true" aria-expanded="false">

                                                        </button>
                                                        <div class="dropdown-menu dropdown-menu-right"
                                                             aria-labelledby="gedf-drop1">
                                                            <div class="h6 dropdown-header">Konfiguration</div>

                                                            <a class="dropdown-item" href="#">Verbergen</a>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="card-body">
                                            <div class="text-muted h7 mb-2"><i class="fa fa-clock-o"></i>10 min ago
                                            </div>


                                            <p class="card-text">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo recusandae
                                                nulla rem eos ipsa praesentium esse magnam nemo dolor
                                                sequi fuga quia quaerat cum, obcaecati hic, molestias minima iste
                                                voluptates.
                                            </p>
                                        </div>
                                        <div class="card-footer">
                                            <textarea class="form-control" placeholder="write a comment..."
                                                      rows="3"></textarea>
                                            <br>
                                            <button style="background-color: #00a1b2;" type="button"
                                                    class="btn btn-info   pull-right">Kommentieren
                                            </button>
                                            <div class="clearfix"></div>

                                        </div>
                                    </div>
                                    <div class="card gedf-card">
                                        <div class="card-header">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <div class="mr-2">
                                                        <img class="rounded-circle" width="45" src="profile.png" alt="">
                                                    </div>
                                                    <div class="ml-2">
                                                        <div class="h5 m-0">Mustermann</div>

                                                    </div>
                                                </div>
                                                <div>
                                                    <div class="dropdown">
                                                        <button style="color: #00a1b2;"
                                                                class="btn btn-link dropdown-toggle" type="button"
                                                                id="gedf-drop3" data-toggle="dropdown"
                                                                aria-haspopup="true" aria-expanded="false">

                                                        </button>
                                                        <div class="dropdown-menu dropdown-menu-right"
                                                             aria-labelledby="gedf-drop3">
                                                            <div class="h6 dropdown-header">Konfiguration</div>

                                                            <a class="dropdown-item" href="#">Verbergen</a>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="card-body">
                                            <div class="text-muted h7 mb-2"><i class="fa fa-clock-o"></i>10 min ago
                                            </div>


                                            <p class="card-text">
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo recusandae
                                                nulla rem eos ipsa praesentium esse magnam nemo dolor
                                                sequi fuga quia quaerat cum, obcaecati hic, molestias minima iste
                                                voluptates.
                                            </p>
                                        </div>
                                        <div class="card-footer">
                                            <textarea class="form-control" placeholder="write a comment..."
                                                      rows="3"></textarea>
                                            <br>
                                            <button style="background-color: #00a1b2;" type="button"
                                                    class="btn btn-info   pull-right">kommentieren
                                            </button>
                                            <div class="clearfix"></div>

                                        </div>
                                    </div>

                                </div>
                            </div>
                            <!-- Personal-Information -->
                        </div>

                        <div class="tab-pane" id="messages-2">
                            <!-- Personal-Information -->
                            <div class="panel panel-default panel-fill">
                                <div class="panel-heading">


                                </div>
                            </div>
                            <!-- Personal-Information -->
                        </div>

                        <div class="tab-pane" id="settings-2">
                            <!-- Personal-Information -->
                            <div class="panel panel-default panel-fill">
                                <div class="panel-heading">
                                    <h3 style="font-size: 20px" class="panel-title">Konto bearbeiten</h3>
                                </div>
                                <div class="panel-body">
                                    <c:forEach items="${user}" var="u">
                                        <form action="/editUser" role="form">
                                            <input name="uid" value="<%= request.getParameter("uid")%>" type="text"
                                                   hidden>
                                            <div class="form-group">
                                                <label for="firstName"><strong>Vorname</strong></label>
                                                <input name="vorname" value="${u.vorname}" style="height: 50px;"
                                                       type="text" id="firstName" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="lastName"><strong>Nachname</strong></label>
                                                <input name="nachname" value="${u.nachname}" style="height: 50px;"
                                                       type="text" id="lastName" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="email"><strong>Email-Adresse</strong></label>
                                                <input name="email" value="${u.email}" style="height: 50px;"
                                                       type="email" id="email" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="wohnort"><strong>Wohnort</strong></label>
                                                <input name="wohnort" value="${u.wohnort}" style="height: 50px;"
                                                       type="text" id="wohnort" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <div class="form-group">
                                                    <label for="beziehungsstatus"><strong>Beziehungsstatus</strong></label>
                                                    <select name="beziehungsstatus" class="form-control"
                                                            id="beziehungsstatus">
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
                                            <input type="text" hidden id="beziehungsstatusText"
                                                   value="${u.beziehungsstatus}">
                                            <div class="form-group">
                                                <label for="aboutMe"><strong>Beschreibung</strong></label>
                                                <textarea name="beschreibung" style="height: 125px" id="aboutMe"
                                                          class="form-control">${u.beschreibung}</textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="password1"><strong>Altes Passwort</strong></label>
                                                <input onkeyup="checkPass()" name="old-password" style="height: 50px;"
                                                       type="password"
                                                       id="password1" class="form-control">
                                            </div>
                                            <p style="display: none; color: red" id="oldPassWarning">Falsche
                                                Eingabe!</p>
                                            <div class="form-group">
                                                <label for="password2"><strong>Neues Passwort</strong></label>
                                                <input oninvalid="checkPass1(this)" oninput="checkPass1(this)"
                                                       onkeyup="checkPasses();" name="new-password"
                                                       style="height: 50px;" type="password"
                                                       id="password2" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="rePassword"><strong>Passwort wiederholen</strong></label>
                                                <input oninvalid="checkPass1(this)" oninput="checkPass1(this)"
                                                       onkeyup="checkPasses();" style="height: 50px;" type="password"
                                                       id="rePassword"
                                                       class="form-control">
                                            </div>
                                            <p style="display: none; color: red" id="passwordWarning">Passwörter stimmen
                                                nicht überein</p>

                                            <div class="form-group">
                                                <input hidden value="${u.geschlecht}" id="geschlecht">
                                                <label><strong>Geschlecht</strong></label>
                                                <div class="col-md-8 ">
                                                    <label>
                                                        <input id="maennlich" value="maennlich" type="radio"
                                                               name="geschlecht" checked>
                                                        Maennlich
                                                    </label>
                                                    <label>
                                                        <input id="weiblich" value="weiblich" type="radio"
                                                               name="geschlecht">
                                                        Weiblich
                                                    </label>
                                                    <label>
                                                        <input id="divers" value="divers" type="radio"
                                                               name="geschlecht">
                                                        Divers
                                                    </label>
                                                </div>
                                            </div>

                                            <button id="saveBtn" style="background-color: #00a1b2; color: white;"
                                                    class="btn  waves-effect waves-light w-md" type="submit">Speichern
                                            </button>
                                            <hr>
                                            <a href="/deleteYourProfile?uid=<%= request.getParameter("uid")%>"
                                               type="button" class="btn btn-danger">Konto loeschen</a>


                                        </form>
                                    </c:forEach>

                                </div>
                            </div>
                            <!-- Personal-Information -->
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer -->

            <!-- End Footer -->
        </div>
        <!-- end container -->
    </div>
    <!-- end wrapper -->
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
    $(document).ready(function () {
        var beziehungsstatus = $("#beziehungsstatusText").val();
        $('#beziehungsstatus option[value="' + beziehungsstatus + '"]').prop("selected", true);


        var gender = $("#geschlecht").val();
        if (gender === "maennlich") {
            $("#maennlich").prop("checked", true);

        } else if (gender === "weiblich") {
            $("#weiblich").prop("checked", true);

        } else {
            $("#divers").prop("checked", true);
        }

        const getAge = birthDate => Math.floor((new Date() - new Date(birthDate).getTime()) / 3.15576e+10);
        var birthDate = $("#age").text();

        birthDate = birthDate.slice(0, 10);

        var age = getAge(birthDate);

        $("#age").text(age);

        var beigetreten = $("#beigetreten").text();


        beigetreten = beigetreten.slice(0, 10);

        $("#beigetreten").text(beigetreten);


    });
</script>

</body>
</html>