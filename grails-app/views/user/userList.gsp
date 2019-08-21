<html>
<head>

    <div class="container"><br>
        <div class="panel panel-default" >
                <div class="container">
                    <div class="col-md-8">
                        <h4 style="color: #a60000"><g:link controller="dashboard" action="index"><strong> <u><b>Link Sharing</b></u></strong></g:link></h4>
                    </div>
                </div>
            </div>
        </div>


	<title>
		User List
	</title>

	<style>
		table {
  			font-family: arial, sans-serif;
  			border-collapse: collapse;
  			width: 100%;
		}

		td, th {
  			border: 1px solid #dddddd;
  			text-align: left;
  			padding: 8px;
		}

		tr:nth-child(even) {
  			background-color: #dddddd;
		}
	</style>

</head>

<body>

<table>
  <tr>
    <th>Id</th>
    <th>Username</th>
    <th>Email</th>
    <th>FirstName</th>
    <th>LastName</th>
    <th>Active</th>
    <th>Activate/Deactivate<th>
    <th>Admin Control<th>
  </tr>

    <g:each var="User" in="${listAll1}">
        <tr>
            <td>${User.id}</td>
            <td>${User.username}</td>
            <td>${User.email}</td>
            <td>${User.firstName}</td>
            <td>${User.lastName}</td>
            <td>${User.active}</td>

           <td>
                <button>
                    <g:link action="changeAdminPermission" params="${[variable1: User.email]}">Activate/Deactivate</g:link>
                </button>
            </td>
            <td>${User.admin}</td>
            <td>
                <button>
                    <g:link action="makeAdmin" params="${[variable2: User.email]}">Make Admin</g:link>
                </button>
            </td>



        </tr>
    </g:each>

</table>
</body>
</html>