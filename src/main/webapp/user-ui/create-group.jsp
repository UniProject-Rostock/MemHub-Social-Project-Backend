<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="de">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
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
    <title>Gruppe erstellen</title>

</head>
<style>
    p {
        text-align: center;
    }

    a {
        text-decoration: underline;
    }

    #gName {
        height: 50px;
    }
    .save {
        height: 50px;
    }

    .save:hover {
        background-color: #00848e;
        border-color: #00848e;
    }
</style>

<body>

<div class="container mt-2 mb-4">

    <h3 style="text-align: center;"> Gruppe erstellen Schritt 1</h3>
    <div class="col-sm-8 ml-auto mr-auto">
        <div class="col-sm-12 border  shadow rounded pt-2">
            <form action="/addFriendsToGroup">
                <input name="uid" type="text" hidden value="<%= request.getParameter("uid")%>">

                <div class="form-group">
                    <label class="font-weight-bold">Gruppenname <span class="text-danger">*</span></label>
                    <input type="text" name="group-name" id="gName" class="form-control"
                           placeholder="Benennen Sie Ihre Gruppe" required>

                </div>
                <div class="form-group">
                    <input style="background-color: #00a1b2; color: white;" type="submit" name="creGroup"
                           value="Weiter"
                           class="save btn btn-block ">
                </div>
            </form>
        </div>
    </div>
</div>

<div class="added-friends"></div>

<script>

</script>
</body>
</html>