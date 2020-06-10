<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <link rel="shortcut icon" type="image/png" href="img/logo.png">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <title>Dokumentation</title>

    <style>
        #reg-img{
            padding: 0px;
            margin: 0px;
            height:500px ;
            width: 800px;
        }
        #an-img{
            padding: 0px;
            margin: 0px;
            height:500px ;
            width: 900px;
        }
        #start-img{
            width: 600px;
            height: 500px;
        }
        #post-img{
            width: 700px;
            height: 400px;
        }
        #profile-img{
            height: 100%;
            width: 100%;
            margin: 0px;
        }
        #group-img{
            margin-top: 80px;
            height: 500px;
            width: 800px;
        }
        #pass-img{
            height: 600px;
            width: 1000px;
            margin-top:-80px;
        }
        #footer-content{
            background-color:  #00a1b2;
            color: white;

        }
        #footer-header{
            margin-top: -80px;
        }
        #team-list{
            font-size: large;
        }
        #icon1{
            position: relative;
            left : 70px;
            top: 10px;
        }
        #icon2{
            position: relative;
            left : 60px;
            top: 10px;

        }
        #icon3{
            position: relative;
            left : 75px;
            top: 10px;

        }
        #icon4{
            position: relative;
            left:20px;
            top: 10px;

        }
        #icon5{
            position: relative;
            left : 50px;
            top: 10px;
        }
    </style>
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
            <li class="nav-item">
                <a title="Abmelden" href="/doLogout" style="cursor: pointer" class="nav-link waves-effect waves-light">
                    <i class="fas fa-sign-out-alt"></i>
                </a>
            </li>
        </ul>
    </div>
</nav>

<div class="bg-white py-5">
    <div class="container py-5">
        <div class="row align-items-center mb-5">
            <div class="col-lg-6 order-2 order-lg-1">
                <h2 class="font-weight-light">Einfuehrung</h2>
                <p class="font-italic text-muted mb-4">
                    MemHub ist eine Website , die im Rahmen des Modules „Softwaretechnik“ an der Uni Rostock entwickelt wird.
                    Die Website bietet die Nutzer an, all ihre Erinnerungen an einem Ort zu sammeln, in dem sie immer Erinnerungen suchen, bearbeiten und teilen koennen.
                    In unserem Projekt kann jeder eine Gruppe fuer Familie / Freunde / Kontakte erstellen und besondere Erinnerungen in jeder Gruppe veroeffentlichen.
                </p>
            </div>
            <div class="col-lg-5 px-5 mx-auto order-1 order-lg-2"><img src="img/logo.png" alt="" class="img-fluid mb-4 mb-lg-0"></div>
        </div>
        <div class="row align-items-center">
            <div class="col-lg-6"><img src="img/reg.png" alt=""  id="reg-img"></div>
            <div class="col-lg-6">
                <h2 class="font-weight-light">1. Loslegen</h2>
                <h4 class="font-weight-light">1.1. Konto erstellen</h4>
                <p class="font-italic text-muted mb-4">Der erste Schritt ist , ein Konto zu erstellen.
                    Alles, was Sie brauchen, um ein Konto zu erstellen, ist eine E-Mail-Adresse .
                    Sie muessen nur Ihren Vor- / Nachnamen, Ihre E-Mail-Adresse, Ihr Geburtsdatum, Ihr Geschlecht und zuletzt ein sicheres Passwort eingeben.
                </p>
            </div>
        </div>
        <div class="row align-items-center mb-5">
            <div class="col-lg-6 order-2 order-lg-1">
                <h4 class="font-weight-light">1.2.Einloggen </h4>
                <p class="font-italic text-muted mb-4">
                    nach der Erstellung eines Kontos, koennen Sie sich sofort in Ihr Konto einloggen.
                    Sie sollen Ihre E-Mail und Ihr Passwort eingeben und einfach den „Anmelden“-Knopf klicken dann werden Sie zu einer Seite weitergeleitet, wo Sie Ihre Informationen vervollstaendigen sollten.
                </p>
            </div>
            <div class="col-lg-5  mx-auto order-1 order-lg-2"><img src="img/an.png" id="an-img" alt=""></div>
        </div>

        <div class="row align-items-center">
            <div class="col-lg-6"><img src="img/start.png"  alt=""  id="start-img"></div>
            <div class="col-lg-6">
                <h4 class="font-weight-light">1.3. Startseite</h4>
                <p class="font-italic text-muted mb-4">Nach dem Einloggen werden Sie zur Startseite weitergeleitet, wobei Sie neue Erinnerungen teilen koennen und dazu Bilder und Videos hinzufuegen. Ausserdem werden in der Startseite die Erinnerungen
                    bzw. Beitraege und die zugehoerige kommentare, die von Ihren Freunden geteilt wurden.
                </p>
            </div>
        </div>
        <div class="row align-items-center mb-5">
            <div class="col-lg-6 order-2 order-lg-1">
                <h4 class="font-weight-light">1.4. Beitrag oder Erinnerungen </h4>
                <p class="font-italic text-muted mb-4">
                    Sie koennen jederzeit einen neuen Beitrag verfassen, dazu neue Fotos oder Videos hinzufuegen und teilen.
                    Ihre Freunde koennen einen Textkommentar zu jedem Ihrer Beitraege hinterlassen. Sie koennen auch Beitraege von anderen kommentieren.


            </div>
            <div class="col-lg-5  mx-auto order-1 order-lg-2"><img src="img/posts.png" id="post-img" alt=""></div>
        </div>
        <div class="row align-items-center">
            <div class="col-lg-6"><img src="img/pro.png"  alt=""  id="profile-img"></div>
            <div class="col-lg-6">

                <h4 class="font-weight-light">1.5. Profilseite</h4>
                <p class="font-italic text-muted mb-4">In Ihrer Profilseite werden Sie Ihre Informationen die von Ihnen und geteilten Beitraege ansehen.
                    Es gibt auch die Moeglichkeit, Ihre Profil zu bearbeiten z.B. Ihre Infos aktualisieren und neues Profilbild hochladen.
                    Sie habe auch die Moeglichkeit die Profileseiten anderer Nutzer zu besuchen und ihre Beitraege ansehen und Freundschaftsanfrage schicken.


                </p>
            </div>
        </div>
        <div class="row align-items-center mb-5">
            <div class="col-lg-6 order-2 order-lg-1">
                <h4 class="font-weight-light">1.6. Gruppen erstellen </h4>
                <p class="font-italic text-muted mb-4">
                    MemHub bieten Ihnen an, Gruppen zu erstellen. Wenn Sie Ihre Beitraege nur an gewuenschten Personen z.B. die Familie teilen moecten ,dann
                    ist die Gruppe eine gute Option. Um eine Gruppe zu erstellen ,muessen Sie angemeldet sein. In dem Sidebar in der Startseite finden Sie
                    ein Button "Gruppe erstellen" wenn Sie den klicken werden Sie zu einer Seite weitergeleitet, wo Sie Ihre Gruppe
                    bennen und gewuenschten Personen hinzufuegen. In Gruppen wird nur Die Beitraege , die die Gruppen mitglieder in der Gruppen Teilen werden, gezeigt.
                    Die Gruppenseite sieht aehnlich zur Startseite.

            </div>
            <div class="col-lg-5  mx-auto order-1 order-lg-2"><img src="img/group.png" id="group-img" alt=""></div>
        </div>

        <div class="row align-items-center">
            <div class="col-lg-6"><img src="img/pass.png"  alt=""  id="pass-img"></div>
            <div class="col-lg-6">

                <h4 class="font-weight-light">1.7. Passwort vergessen</h4>
                <p class="font-italic text-muted mb-4">Das haeufig auftretende Problem besteht darin, das Passwort zu vergessen.
                    Wenn das passiert ist , dann ist es kein Problem ein neue Passwort anzufragen .
                    Sie muessen nur auf “Passwort  vergessen ”klicken und die Email Adresse eingeben nachher bekommen Sie eine Email an Ihrer Email-Adresse mit einem Link
                    zum zuruecksetzen des Passwortes.

                </p>
            </div>
        </div>
        <div >
            <p style="text-align: center;" class="font-italic text-muted mb-4">Viel Spass ;)</p>
        </div>
    </div>
</div>

<!-- Footer -->

<footer id="footer-content" class="page-footer font-small  pt-5">

    <!-- Footer Elements -->
    <div class="container">

        <!-- Call to action -->
        <ul  class="list-unstyled list-inline text-center py-2">
            <li class="list-inline-item">
                <h3 id="footer-header fa-3x" class="mb-1">Unser Team</h3>
            </li>
            <li id="team-list" class="list-inline-item">
            <li>
                <a style="color: white;" href="https://github.com/libhh"  target="_blank">Ali Behbudov</a>
                <i id="icon1" class="fa fa-github fa-3x" aria-hidden="true"></i>

            </li>
            <li>
                <a  style="color: white;" href="https://github.com/tammam22"  target="_blank">Tammam Azzam</a>
                <i id="icon2" class="fa fa-github fa-3x" aria-hidden="true"></i>

            </li>
            <li>
                <a  style="color: white;" href="https://github.com/farahn94"  target="_blank">Farah Nader</a>
                <i id="icon3" class="fa fa-github fa-3x" aria-hidden="true"></i>

            </li>
            <li>
                <a  style="color: white;" href="https://github.com/felipe-araya"  target="_blank">Felipe Andrés Araya Saldivar</a>
                <i id="icon4" class="fa fa-github fa-3x" aria-hidden="true"></i>

            </li>
            <li>
                <a  style="color: white;" href="https://github.com/pd1301994"  target="_blank">Paula De Dios Oliver</a>
                <i id="icon5" class="fa fa-github fa-3x" aria-hidden="true"></i>

            </li>
            </li>
        </ul>
        <!-- Call to action -->

    </div>
    <!-- Footer Elements -->
</footer>
<!-- Footer -->
<

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>