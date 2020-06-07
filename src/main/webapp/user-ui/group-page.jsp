<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description"
          content="Responsive sidebar template with sliding effect and dropdown menu based on bootstrap 3">
    <title>Gruppenseite</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">

    <link rel="stylesheet" href="/css/group-page.css">

</head>

<body>

<div class="page-wrapper chiller-theme toggled">

    </a>
    <nav id="sidebar" class="sidebar-wrapper">
        <div class="sidebar-content">
            <div class="sidebar-brand">
                <a href="/startseite?uid=<%= request.getParameter("uid")%>">MemHub</a>
                <div id="close-sidebar">
                    <i class="fas fa-times"></i>
                </div>
            </div>
            <div class="sidebar-header">
                <div class="user-pic">
                    <img class="img-responsive img-rounded" src="img/profile.png"
                         alt="User picture">
                </div>
                <div class="user-info">
                    <a style="color: white" href="/profile?uid=<%= request.getParameter("uid")%>"
                       class="user-name">Jhon</a>
                    <span class="user-role">Benutzer</span>
                    <span class="user-status">
              <i class="fa fa-circle"></i>
              <span>Online</span>
            </span>
                </div>
            </div>
            <!-- sidebar-header  -->
            <div class="sidebar-search">
                <div>
                    <div class="input-group">
                        <input type="text" class="form-control search-menu" placeholder="Suche...">
                        <div class="input-group-append">
                <span class="input-group-text">
                  <i class="fa fa-search" aria-hidden="true"></i>
                </span>
                        </div>
                    </div>
                </div>
            </div>
            <!-- sidebar-search  -->
            <div class="sidebar-menu">
                <ul>

                    <li class="sidebar-item">
                        <a href="/startseite?uid=<%= request.getParameter("uid")%>">
                            <i class="fa fa-home"></i>
                            <span>Startseite</span>
                        </a>
                    </li>

                    <li class="sidebar-item">
                        <a href="/profile?uid=<%= request.getParameter("uid")%>">
                            <i class="fa fa-user"></i>
                            <span>Profil</span>

                        </a>
                    </li>

                    <li class="sidebar-dropdown">
                        <a href="#">
                            <i class="fa fa-users"></i>
                            <span>Gruppenmitglieder</span>
                        </a>
                        <div class="sidebar-submenu">
                            <ul>
                                <c:forEach items="${members}" var="m">
                                    <li>
                                        <a class="gruppe" href="/profile?fid=${m.groupId}&uid=<%= request.getParameter("uid")%>">${m.vorname} ${m.nachname}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>

                    </li>
                    <li class="sidebar-dropdown">
                        <a href="#">
                            <i class="fa fa-users"></i>
                            <span>Gruppen</span>
                            <span id="groupLength" class="badge badge-pill badge-danger"></span>
                        </a>
                        <div class="sidebar-submenu">
                            <ul>
                                <li>
                                    <a href="/gruppeErstellen?uid=<%= request.getParameter("uid")%>">Gruppe erstellen

                                    </a>
                                </li>
                                <c:forEach items="${gruppen}" var="g">
                                    <li>
                                        <a class="gruppe"
                                           href="/group?gid=${g.groupId}&uid=<%= request.getParameter("uid")%>">${g.groupName}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
            <!-- sidebar-menu  -->
            <div class="sidebar-footer">


                <a href="/doLogout">
                    <i class="fa fa-power-off"></i>
                </a>
            </div>
        </div>
        <!-- sidebar-content  -->
    </nav>

    <!-- sidebar-wrapper  -->
    <main class="page-content">
        <nav style="background-color: #00a1b2; width: 100%;"
             class="mb-1 navbar navbar-expand-lg navbar-dark default-color fixed-top ">
            <a id="show-sidebar" class="btn btn-sm btn-dark" href="#">
                <i class="fas fa-bars"></i>
                <a class="navbar-brand" href="/startseite?uid=<%= request.getParameter("uid")%>"> MemHub</a>

                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent-3" aria-controls="navbarSupportedContent-3"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent-3">


                </div>
        </nav>

        <div class="container-fluid gedf-wrapper">
            <div class="d-flex justify-content-center">
                <div class="col-md-7 gedf-main">
                    <!--- \\\\\\\Post-->
                    <div class="card gedf-card">
                        <div class="card-header">
                            <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="posts-tab" data-toggle="tab" href="#posts" role="tab"
                                       aria-controls="posts" aria-selected="true">Erinnierung Teilen
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="images-tab" data-toggle="tab" role="tab"
                                       aria-controls="images" aria-selected="false" href="#images">Foto/Video</a>
                                </li>

                            </ul>
                        </div>
                        <div class="card-body">
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="posts" role="tabpanel"
                                     aria-labelledby="posts-tab">
                                    <div class="form-group">
                                        <label class="sr-only" for="message">post</label>
                                        <textarea class="form-control" id="message" rows="3"
                                                  placeholder="In (Gruppenname..) Beitrag teilen"></textarea>
                                    </div>

                                </div>
                                <div class="tab-pane fade" id="images" role="tabpanel" aria-labelledby="images-tab">
                                    <div class="form-group">
                                        <div class="custom-file">
                                            <input type="file" class="custom-file-input" id="customFile">
                                            <label class="custom-file-label" for="customFile">Foto/Video
                                                hochladen</label>
                                        </div>
                                    </div>
                                    <div class="py-4"></div>
                                </div>
                            </div>
                            <div class="btn-toolbar justify-content-between">
                                <div class="btn-group">
                                    <button style="background-color: #00a1b2; color: white;" type="submit" class="btn ">
                                        Teilen
                                    </button>
                                </div>
                                <div class="btn-group">

                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- Post /////-->

                    <!--- \\\\\\\Post-->
                    <div class="card gedf-card">
                        <div class="card-header">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="mr-2">
                                        <img class="rounded-circle" width="30" height="30" src="img/profile.png" alt="">
                                    </div>
                                    <div class="ml-2">
                                        <div class="h5 m-0">Mustermann</div>

                                    </div>
                                </div>
                                <div>
                                    <div class="dropdown">
                                        <button class="btn btn-link dropdown-toggle" type="button" id="gedf-drop1"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="gedf-drop1">
                                            <div class="h6 dropdown-header">Optionen</div>

                                            <a class="dropdown-item" href="#">Verbergen
                                                <i class="fas fa-eye-slash"></i>
                                            </a>
                                            <a class="dropdown-item" href="#">Privat
                                                <i class="fas fa-user"></i>
                                            </a>
                                            <a class="dropdown-item" href="#">Öffentlich
                                                <i class="fas fa-globe"></i>
                                            </a>


                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="card-body">
                            <div class="text-muted h7 mb-2"><i class="fa fa-clock-o"></i>10 min ago</div>


                            <p class="card-text">
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo recusandae nulla rem eos
                                ipsa praesentium esse magnam nemo dolor
                                sequi fuga quia quaerat cum, obcaecati hic, molestias minima iste voluptates.
                            </p>
                        </div>
                        <div class="card-footer">
                            <textarea class="form-control" placeholder="Kommentar schriben..." rows="3"></textarea>
                            <br>
                            <button style="background-color: #00a1b2;" type="button" class="btn btn-info  pull-right">
                                Kommentieren
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
                                        <img class="rounded-circle" width="30" height="30" src="profile.png" alt="">
                                    </div>
                                    <div class="ml-2">
                                        <div class="h5 m-0">Mustermann_2</div>

                                    </div>
                                </div>
                                <div>
                                    <div class="dropdown">
                                        <button class="btn btn-link dropdown-toggle" type="button" id="gedf-drop2"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="gedf-drop2">
                                            <div class="h6 dropdown-header">Optionen</div>

                                            <a class="dropdown-item" href="#">Verbergen
                                                <i class="fas fa-eye-slash"></i>
                                            </a>
                                            <a class="dropdown-item" href="#">Privat
                                                <i class="fas fa-user"></i>
                                            </a>
                                            <a class="dropdown-item" href="#">Öffentlich
                                                <i class="fas fa-globe"></i>
                                            </a>

                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="card-body">
                            <div class="text-muted h7 mb-2"><i class="fa fa-clock-o"></i>10 min ago</div>


                            <p class="card-text">
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo recusandae nulla rem eos
                                ipsa praesentium esse magnam nemo dolor
                                sequi fuga quia quaerat cum, obcaecati hic, molestias minima iste voluptates.
                            </p>
                        </div>
                        <div class="card-footer">
                            <textarea class="form-control" placeholder="Kommentar schriben..." rows="3"></textarea>
                            <br>
                            <button style="background-color: #00a1b2;" type="button" class="btn btn-info   pull-right">
                                Kommentieren
                            </button>
                            <div class="clearfix"></div>

                        </div>
                    </div>
                    <div class="card gedf-card">
                        <div class="card-header">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="mr-2">
                                        <img class="rounded-circle" width="30" height="30" src="profile.png" alt="">
                                    </div>
                                    <div class="ml-2">
                                        <div class="h5 m-0">Mustermann_3</div>

                                    </div>
                                </div>
                                <div>
                                    <div class="dropdown">
                                        <button class="btn btn-link dropdown-toggle" type="button" id="gedf-drop3"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="gedf-drop3">
                                            <div class="h6 dropdown-header">Optionen</div>

                                            <a class="dropdown-item" href="#">Verbergen
                                                <i class="fas fa-eye-slash"></i>
                                            </a>
                                            <a class="dropdown-item" href="#">Privat
                                                <i class="fas fa-user"></i>
                                            </a>
                                            <a class="dropdown-item" href="#">Öffentlich
                                                <i class="fas fa-globe"></i>
                                            </a>

                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="card-body">
                            <div class="text-muted h7 mb-2"><i class="fa fa-clock-o"></i>10 min ago</div>


                            <p class="card-text">
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo recusandae nulla rem eos
                                ipsa praesentium esse magnam nemo dolor
                                sequi fuga quia quaerat cum, obcaecati hic, molestias minima iste voluptates.
                            </p>
                        </div>
                        <div class="card-footer">
                            <textarea class="form-control" placeholder="Kommentar schriben..." rows="3"></textarea>
                            <br>
                            <button style="background-color: #00a1b2;" type="button" class="btn btn-info   pull-right">
                                kommentieren
                            </button>
                            <div class="clearfix"></div>

                        </div>
                    </div>


                </div>
            </div>
        </div>

    </main>
    <!-- page-content" -->
</div>
<!-- page-wrapper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script>
    jQuery(function ($) {

        $(".sidebar-dropdown > a").click(function () {
            $(".sidebar-submenu").slideUp(200);
            if (
                $(this)
                    .parent()
                    .hasClass("active")
            ) {
                $(".sidebar-dropdown").removeClass("active");
                $(this)
                    .parent()
                    .removeClass("active");
            } else {
                $(".sidebar-dropdown").removeClass("active");
                $(this)
                    .next(".sidebar-submenu")
                    .slideDown(200);
                $(this)
                    .parent()
                    .addClass("active");
            }
        });

        $("#close-sidebar").click(function () {
            $(".page-wrapper").removeClass("toggled");
        });
        $("#show-sidebar").click(function () {
            $(".page-wrapper").addClass("toggled");
        });


    });
    $(".dropdown-menu li a").click(function () {
        var selText = $(this).text();
        $(this).parents('.btn-group').find('.dropdown-toggle').html(selText + ' <span class="caret"></span>');
    });

    $(".dropdown-menu li a").click(function () {
        var selText = $(this).text();

        $(this).parents('.btn-group').find('.dropdown-toggle').html(selText + ' <span class="caret"></span>');

    });

    $(document).ready(function() {
        var gLength = $(".gruppe").length;

        $("#groupLength").text(gLength);
    })


</script>
</body>

</html>