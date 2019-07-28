%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="4nonymous">
  <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
  <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
</head>
<body>
  <div class="container"><br>
    <div class="panel panel-default">
      <div class="panel-body">
        <div class="container">
          <div class="col-md-8">
            <h4><a href="/dashboard/index"><strong> <u>Link Sharing</u></strong></a></h4>
          </div>
          <div class="col-md-3">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Search" id="txtSearch"/>
              <div class="input-group-btn">
                <button class="btn btn-basic" type="submit">
                  <span class="glyphicon glyphicon-search"></span>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
<div class="container">
    <h2>Users List</h2>
    <p>The table represent the all users</p>
    <table id="example" class="table table-striped table-bordered">
        <thead>
            <tr>
                <th>Id</th>
                <th>Username</th>
                <th>Email</th>
                <th>FirstName</th>
                <th>LastName</th>
                <th>Active</th>
                <th>Manage</th>
            </tr>
        </thead>
        <tbody>
            <g:each var="user" in="${lol}">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td>${user.email}</td>
                    <td>${user.firstName}</td>
                    <td>${user.lastName}</td>
                    <td>${user.active}</td>
                    <td><button id="activate"></button></td>
                </tr>
            </g:each>
        </tbody>
    </table>
</div>
  <script>
  $(document).ready(function() {
      $('#example').DataTable();
      console.log("hi")
  } );
  </script>
</body>
</html>
