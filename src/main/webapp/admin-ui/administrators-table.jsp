<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>Users</title>
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
    <link type="text/css" rel="stylesheet" href="/css/user-table.css">
</head>
<body>
<div class="loader">
    <div class="loading">
    </div>
    <p id="loading">Loading...</p>
</div>

<div class="whole-page">

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li title="Menu" class="breadcrumb-item"><a style="font-size: 19px" href="/admin-menu" id="home"><i class="fas fa-angle-double-left"></i> Menu</a>
            </li>
        </ol>
    </nav>

    <div id="tableDiv" class="container">
        <div class="row">
            <div class="col-lg-12">
                <table id="table_id" class="display">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Surname</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Blocked</th>
                        <th>Block admin</th>
                        <th>Unblock admin</th>
                        <th>Delete admin</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${admins}" var="u">
                        <tr class="mainTr">
                            <td>${u.vorname}</td>
                            <td>${u.nachname}</td>
                            <td>${u.email}</td>

                            <td class="role">${u.roles}</td>
                            <td class="blocked">${u.blocked}</td>

                            <td>
                                <a title="Block admin" class="block btn btn-light"
                                   href="blockUser?uid=${u.uid}"
                                   type="submit"><i class="fas fa-lock fa-2x"></i>
                                </a>
                            </td>
                            <td>
                                <a title="Unblock admin" class="block btn btn-light"
                                   href="unblockUser?uid=${u.uid}"
                                   type="submit"><i class="fas fa-unlock fa-2x"></i>
                                </a>
                            </td>
                            <td>
                                <a title="Delete admin" class="block btn btn-light"
                                   href="deleteAdmin?uid=${u.uid}"
                                   type="submit"><i class="fas fa-minus-circle fa-2x"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <hr>
            </div>
        </div>
    </div>
</div>

<script src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>

<script type="text/javascript">
    $(window).on('beforeunload', function () {
        $(window).scrollTop(0);
    });

    $(document).ready(function () {
        $('#table_id').DataTable({
            language: {search: ""},
            paging: false
        });
    });

    $(document).ready(function () {
        $(".role").each(function () {
            if ($(this).text().includes("ROLE_ADMIN")) {
                $(this).text("ADMIN")
            }
        });

        $(".blocked").each(function () {
            if ($(this).text().includes("0")) {
                $(this).text("No")
            } else {
                $(this).text("Yes")
            }
        });

        $("#table_id_filter").find("input").addClass("form-control").attr("placeholder", "Search..").width(230).addClass("search-input");
    });


    var rowCount = $('#table_id >tbody >tr').length;

    $(".environments").click(function () {
        document.getElementsByClassName("loader")[0].style.display = "block";
        document.getElementsByClassName("whole-page")[0].style.display = "none";
    });

    window.onbeforeunload = function (e) {
        document.getElementsByClassName("loader")[0].style.display = "block";
        document.getElementsByClassName("whole-page")[0].style.display = "none";
    };

</script>

</body>
</html>

