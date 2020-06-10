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

    #addFreundeBtn {
        background-color: #00a1b2;
        border-color: #00a1b2;
        height: 50px;
        width: 170px;
    }

    #addFreundeBtn:hover {
        background-color: #00848e;
    }

    .einladungBtn {
        background-color: #00a1b2;
        border-color: #00a1b2;
        height: 35px;
    }

    .einladungBtn:hover {
        background-color: #00848e;
        border-color: #00848e;
    }

    #modal-p {
        font-size: 20px;
        font-style: oblique;
        margin-bottom: 35px;
        text-align: left;
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

    <h3 style="text-align: center;"> Gruppe erstellen Schritt 2</h3>
    <div class="col-sm-8 ml-auto mr-auto">
        <div class="col-sm-12 border  shadow rounded pt-2">
            <form action="/addGroup">
                <input name="uid" type="text" hidden value="<%= request.getParameter("uid")%>">
                <input name="group-name" type="text" hidden value="<%= request.getParameter("group-name")%>">
                <c:forEach items="${gid}" var="gi">
                    <input id="gid" hidden type="text" value="${gi}" name="gid">
                </c:forEach>

                <div class="form-group">
                    <button id="addFreundeBtn" type="button" class="btn btn-primary" data-toggle="modal"
                            data-target="#exampleModalCenter">
                        Freunde einladen
                    </button>

                    <!-- Modal -->
                    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
                         aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalCenterTitle">Zu dieser Gruppe hinzufuegen</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <p id="modal-p">Fuege deine Freunde zu der Gruppe</p>

                                    <div id="friendsList"></div>
                                </div>
                                <div class="modal-footer">
                                    <button style="background-color: #00a1b2; border-color: #00a1b2" type="button"
                                            class="btn btn-secondary" data-dismiss="modal">Schliessen
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="form-group">
                    <input style="background-color: #00a1b2; color: white;" type="submit" name="creGroup"
                           value="Zur Gruppe"
                           class="save btn btn-block ">
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        var url_string = window.location.href; //window.location.href
        var url = new URL(url_string);
        var uid = url.searchParams.get("uid");

        $.ajax({
            type: "post",
            data: {"uid": uid},
            url: "/friends",
            success: function (data) {
                for (var i = 0; i < data.length; i = i + 2) {
                    $("#friendsList").append("<div class='fullFriendInfo container'><div class='row'><div class='col-sm'><p style='text-align: left'>" + data[i] + "</p></div> <div class='col-sm'><button onclick='sendeEinladung(this)' value='" + data[i + 1] + "' type='button' class='einladungBtn btn btn-primary'> <i class=\"fas fa-plus\"></i> </button></div></div></div>")
                }
            }
        });
    });

    function sendeEinladung(btn) {
        var url_string = window.location.href; //window.location.href
        var url = new URL(url_string);
        var uid = url.searchParams.get("uid");
        var groupName = url.searchParams.get("group-name");
        var friendId = $(btn).val();
        var gid = $("#gid").val();

        $.ajax({
            type: "post",
            data: {"uid": uid, "friendId": friendId, "groupName": groupName, "gid": gid},
            url: "/gruppeEinladung",
            success: function (data) {

                if (data === "gesendet") {
                    $(btn).closest(".fullFriendInfo").empty().append("<p>Erfolgreich hinzugefuegt <i class=\"fas fa-check\"></i></p>");
                }
            }
        });
    }

</script>
</body>
</html>