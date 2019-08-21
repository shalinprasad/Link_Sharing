<html>
<head>

    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="4nonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
    <style>
    .topnav {
        overflow: hidden;
        /*background-color: #333;*/
        height: 53px;
    }
    .topnav a {
        float: left;
        display: block;
        color: white;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
        font-size: 17px;
    }
    /*.topnav a:hover {*/
    /*    background-color: #ddd;*/
    /*    color: black;*/
    /*}*/
    /*.topnav a.active {*/
    /*    background-color: #4CAF50;*/
    /*    color: white;*/
    /*}*/
    .topnav .search-container {
        float: right;
    }
    .topnav input[type=text] {
        padding: 6px;
        margin-top: 8px;
        font-size: 17px;
        border: none;
    }
    .topnav .search-container button {
        float: right;
        padding: 6px 10px;
        margin-top: 8px;
        margin-right: 16px;
        /*background: #ddd;*/
        font-size: 17px;
        border: none;
        cursor: pointer;
    }
    /*.topnav .search-container button:hover {*/
    /*    background: #ccc;*/
    /*}*/
    .topnav .search-container button {
        height: 36px;
    }
    </style>
</head>
<body>
<d<div class="container"><br>
    <div class="panel panel-default">
        <div class="panel-body" style="background: #31b0d5">
            <div class="container">
                <div class="col-md-8">
                    <h4 style="color: #a60000"><g:link controller="dashboard" action="index"><strong> <u><b>Link Sharing</b></u></strong></g:link></h4>
                </div>
            </div>
        </div>
    </div>

    Users List
    <p>The table represent the all users</p>
    <table id="example" class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>Id</th>
            <th>Topicname</th>
            <th>Username</th>
            <th>Visibility</th>
            <th>Manage</th>

        </tr>
        </thead>
        <tbody>
        <g:each var="topic" in="${topiclists}">
            <tr>
                <td>${topic.id}</td>
                <td>${topic.name}</td>
                <td>${topic.user.username}</td>
                <td>${topic.visibilty}</td>
                <td>
                    <button class="btn btn-success">
                        <g:link controller="topic" action="delete" params="[id:topic.id]">Delete</g:link>
                    </button>
                </td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <script>
        $(document).ready(function() {
            $('#example').DataTable();
            console.log("hi")
        } );
    </script>
</body>
</html>