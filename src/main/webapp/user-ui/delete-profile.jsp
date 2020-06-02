<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>Delete your profile</title>
    <link rel="shortcut icon" type="image/png" href="img/logo.png">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
            crossorigin="anonymous"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/258052aeff.js"
            crossorigin="anonymous"></script>
    <style>

        h5 {
            font-size: 24px;
        }

        #closeBtn:hover {
            color: white;
        }
        p{
            font-size: 18px;
        }

    </style>
</head>

<body>

<form method="post" action="/userDeletesProfile">
    <div id="myModal" class="modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Delete profile</h5>
                    <button onclick="backToUserTable()" id="closeModalBtn" type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Are you sure to delete your profile?</p>
                </div>
                <div class="modal-footer">
                    <button onclick="backToUserTable()" id="closeBtn" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button id="blockBtn" type="submit" class="btn btn-danger">Delete</button>
                </div>
            </div>
        </div>
    </div>

    <input name="uid" type="text" hidden value="<%= request.getParameter("uid")%>">
</form>


<script type="text/javascript">
    $(window).on('load',function(){
        $('#myModal').modal('show');
    });

    function backToUserTable() {
        window.location.href = "/profile?uid=<%= request.getParameter("uid")%>";
    }

</script>

</body>
</html>

