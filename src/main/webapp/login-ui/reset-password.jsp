<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <link rel="shortcut icon" type="image/png" href="img/telekomspace.png">
    <meta charset="utf-8">
    <title>Reset password</title>
    <link rel="shortcut icon" type="image/png" href="img/telekomspace.png">
    <link rel="stylesheet" href="login-ui/loginPage_style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <style media="screen">
        body {
            margin: 0;
            padding: 0;
        }

        .main {
            margin: 0 auto;
            width: 400px;
            margin-top: 10%;
            padding-bottom: 34px;
        }

        input[type="submit"] {
            float: right;
            border: 1px solid black;
            border-radius: 3px;
            padding-left: 15px;
            padding-right: 15px;
            width: auto;
            height: 37px;
            color: #fff;
            text-decoration: none;
            background-color: #00a1b2;
            display: inline-block;
            line-height: 32px;
            vertical-align: middle;
            text-align: center;
            overflow: hidden;
            font-size: 14px;
            white-space: nowrap;
            box-sizing: border-box;
        }

        input[type="submit"]:hover {
            background-color: #00848e;
        }

        .link {
            float: right;
            color: #00a1b2;
            margin-right: -3.7%;
            font-size: 12px;
            margin-top: 7px;
        }

        .link:hover {
            color: #00848e;
            text-decoration: none;
        }

        h3 {
            text-align: center;
            font-size: 18px;
            margin-bottom: -160px;
            margin-top: 10%;
            margin-right: 10.5%;
        }

        p {
            text-align: center;
        }

        .alert {
            display: none;
            height: 50px;
            width: 31.8%;
            margin: 0 auto;
            margin-top: 50px;
        }

        label {
            text-align: center;
            margin-bottom: 22px;
            font-size: 17px;
            font-weight: 300;
            display: block;
            padding-bottom: 8px;
        }

        @media (max-width: 1600px) {
            h3 {
                margin-bottom: -90px;
                margin-right: 21.3%;
            }

            .link {
                margin-right: -5%;
            }

            #alert {
                width: 35%;
            }
        }
    </style>
</head>

<body>




<div class="header">
    <h3>Reset password</h3>
</div>


<div class="main">

    <form id="resetform" action="/changePass">
        <input value="<%= request.getParameter("token")%>" type="text" name="token" hidden>

        <div class="form-group">
            <input id="pass1" name="password" type="password" class="form-control" placeholder="New password" oninvalid="checkPass1(this);" oninput="checkPass1(this);"
                   required="required">
        </div>
        <div class="form-group">
            <input id="pass2" type="password" class="form-control" placeholder="Confirm password" onkeyup="checkPasses();" oninvalid="checkPass1(this);" oninput="checkPass1(this);"
                   required="required">
        </div>

        <input id="submit" type="submit" value="Save">
    </form>
</div>

<div class="footer">
    <a class="link" href="/login" disabled>Return to sign-in page</a>
</div>

<div id="passAlert" class="alert alert-danger" role="alert">
    <label id="error_password2" class="errors">Passwords don't match!</label>
</div>

<script>
    document.getElementById('pass1').value = "";
    document.getElementById('pass2').value = "";

    function checkEmpty(textbox) {
        if (textbox.value.trim() === '') {
            textbox.setCustomValidity('Please fill all fields');
        } else {
            textbox.setCustomValidity('');
        }
        return true;
    }

    function checkPass1(textbox) {
        if (textbox.value.trim().length < 7 || textbox.value.search(/[A-Z]/) === -1) {
            textbox.setCustomValidity("Password should contain at least 7 characters and one capital letter!");
            return false;
        }
        if (textbox.value.trim().length < 7 || textbox.value.search(/[A-Z]/) === -1) {
            textbox.setCustomValidity("Password should contain at least 7 characters and one capital letter!");
            return false;
        } else {
            textbox.setCustomValidity('');
        }
        return true;
    }

    function checkPass2(textbox) {
        if (textbox.value.trim().length < 7 || textbox.value.search(/[A-Z]/) === -1) {
            textbox.setCustomValidity("Password should contain at least 7 characters and one capital letter!");
            return false;
        } else {
            textbox.setCustomValidity('');
        }
        return true;
    }

    function checkPasses() {
        var pass1 = document.getElementById('pass1').value;
        var pass2 = document.getElementById('pass2').value;


        if (pass1.trim() === pass2.trim()) {
            $("#passAlert").hide();


            return true;
        } else {
            $("#passAlert").show();


            return false;
        }
    }

    function validateForm() {
        var valid = true;
        valid = valid && checkPasses();
        return valid;
    }

    $('#resetform').submit(validateForm);
</script>

</body>

</html>
