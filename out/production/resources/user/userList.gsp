<html>
<head>
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

</head>>

<body>

<table>
  <tr>
    <th>Id</th>
    <th>Username</th>
    <th>Email</th>
    <th>FirstName</th>
    <th>LastName</th>
    <th>Active</th>
    <th>Manage<th>
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
                <button type="button" onclick="">
                    Activate/Deactivate
                </button>
            <td>
        </tr>
    </g:each>

</table>
</body>
</html>