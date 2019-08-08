<%--
  Created by IntelliJ IDEA.
  User: shalin
  Date: 01/08/19
  Time: 12:40 AM
--%>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="4nonymous">
</head>
<body>
<div class="container"><br>
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="container">
                <div class="col-md-8">
                    <h4><a href="/index"><strong> <u>Link Sharing</u></strong></a></h4>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-5">
        <div class="panel panel-default">
            <div class="panel-heading">Reset Password</div>
            <div class="panel-body">
                <g:form class="form-horizontal" url="[controller:'User',action:'changepassword']">
                    <div class="form-group">
                        <text class="control-label col-md-4" for="email"  style="text-align: left;">Email/Username *</text>
                        <div class="col-md-8">
                            <input type="text" class="form-control" required id="loginemail"  name="email" value="${email}">
                        </div>
                    </div>
                    <div class="form-group">
                        <text class="control-label col-md-4 " for="password" style="text-align: left;">Password *</text>
                        <div class="col-md-8">
                            <input type="password" class="form-control" required id="loginpassword" placeholder="Enter password" name="password">
                        </div>
                    </div>
                    <div class=" offset-md-1">
                        <button type="submit" required class="btn btn-basic">Change Password</button>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>