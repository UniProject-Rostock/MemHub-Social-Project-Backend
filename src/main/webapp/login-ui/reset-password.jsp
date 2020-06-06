<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" type="image/png" href="img/logo.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <title>Passwort zuruecksetzen</title>
</head>


<style>
    p{
        text-align: center;
    }
    .alert{
        text-align: center;
    }
    a{
        text-decoration: underline;
    }
    h4{
        text-align: center;
    }
    #nPass , #cPass{
        height: 50px;
    }

</style>
<body>


    <div class="col-sm-8 ml-auto mr-auto">
        <h4>Passwort zuruecksetzen</h4>

        <div class="col-sm-12 border  shadow rounded pt-2">

            <form action="/newPassword" onsubmit="return validate()">
                <input type="text" hidden name="uid" value="<%= request.getParameter("uid")%>">
                <input type="text" hidden name="token" value="<%= request.getParameter("token")%>">

                <div class="form-group">
                    <label class="font-weight-bold">Neues Passwort <span class="text-danger">*</span></label>
                    <input placeholder="Neues Passwort" type="password" name="newPass" id="nPass" class="form-control" value="" required>

                </div>
                <div class="form-group">
                    <label class="font-weight-bold">Passwort wiederholen <span class="text-danger">*</span></label>
                    <input placeholder="Passwort wiederholen" type="password" name="confirmPass" class="form-control" id="cPass" value="" required>

                </div>


                <div class="form-group">
                    <input style="background-color: #00a1b2;" type="submit" name="resetPass" value="Zuruecksetzen"
                           class="save btn btn-block btn-primary">
                </div>
            </form>
        </div>

    </div>
</div>

<script type="text/javascript">
    function validate() {
        var password = document.getElementById("nPass").value;
        var confirmPassword = document.getElementById("cPass").value;
        if (password !== confirmPassword) {
            alert("Passwörter müssen gleich sein! Versuchen Sie bitte es erneut");
            return false;
        }
        return true;
    }
</script>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>