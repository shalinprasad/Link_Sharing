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
            <h4><a href="#"><strong> <u>Link Sharing</u></strong></a></h4>
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
    <div class="col-md-7">
      <div class="panel panel-default">
        <div class="panel-heading">Recent Searches</div>
        <div class="panel-body">
          <table  style="width:100%">
            <td rowspan="3" width=25%> <img src="https://i.stack.imgur.com/l60Hf.png" height=120px width=125px></td>
            <td width=275px class="text">Shalin</td>
            <td width=150px class="text-muted">@shalin</td>
            <td width=150px></td>
            <td width=150px></td>
            <td width=150px>
              <a href="#">
                Grails
              </td>
            </tr>
            <td colspan="5" </td>
          </tr>
          <td>Links</td>
          <td></td>
          <td></td>
          <td></td>
          <td><a href="#">View Post</td>
          </table>
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <div class="container">
            <div class="col-md-5">
              Top Posts</div>
              <div class="col-md-2">
                <div class="dropdown">
                  <button class="btn btn-basic dropdown-toggle" type="button" id="about-us" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Today  <span class="caret"></span>
                  </button>
                  <ul class="dropdown-menu" aria-labelledby="about-us">
                    <li><a href="#">One Week</a></li>
                    <li><a href="#">One Month</a></li>
                    <li><a href="#">One Year</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <div class="panel-body"> <table  style="width:100%">
            <td rowspan="3" width=25%> <img src="https://i.stack.imgur.com/l60Hf.png" height=120px width=125px></td>
            <td width=275px class="text">Shalin</td>
            <td width=150px class="text-muted">@shalin</td>
            <td width=150px></td>
            <td width=150px></td>
            <td width=150px><a href="#">Grails</td>
            </tr>
            <td colspan="5" height=100px> </td>
          </tr>
          <td>Links</td>
          <td></td>
          <td></td>
          <td></td>
          <td><a href="#">View Post</td>
          </table></div>
        </div>
      </div>
      <div class="col-md-5">
        <div class="panel panel-default">
          <div class="panel-heading">Login</div>
          <div class="panel-body">
            <g:form class="form-horizontal"url="[controller:'Signup',action:'login']">
              <div class="form-group">
                <text class="control-label col-md-4" for="email"  style="text-align: left;">Email*</text>
                <div class="col-md-8">
                  <input type="email" class="form-control" id="email" placeholder="Enter email" name="s_email">
                </div>
              </div>
              <div class="form-group">
                <text class="control-label col-md-4 " for="pwd" style="text-align: left;">Password *</text>
                <div class="col-md-8">
                  <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="s_pwd">
                <span>
                    <g:if test="${flash.message}">
                    <div class="message">
                      ${flash.message}
                      </div>
                      </g:if>
                    </span>
                </div>
              </div>
              <div class="form-group">
                <div class=" col-md-10">
                  <a href="#" class="control-label col-md-8" style="text-align: left;">Forget Password</a>
                </div>
                <div class=" offset-md-1">
                  <button type="submit" class="btn btn-basic">Login</button>
                </div>
              </div>
            </g:form>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">Register</div>
          <div class="panel-body">
            <g:uploadForm class="form-horizontal" url="[controller:'signup',action:'signup']" >
              <div class="form-group">
                <text class="control-label col-md-4" for="firstname" style="text-align: left;">First Name *</text>
                <div class="col-md-8">
                  <input type="text" class="form-control" id="firstname" placeholder="Enter firstname" name="firstname">
                </div>
              </div>
              <div class="form-group">
                <text class="control-label col-md-4" for="lastname" style="text-align: left;">Last Name *</text>
                <div class="col-md-8">
                  <input type="text" class="form-control" id="lastname" placeholder="Enter lastname" name="lastname">
                </div>
              </div>
              <div class="form-group">
                <text class="control-label col-md-4" for="email" style="text-align: left;">Email *</text>
                <div class="col-md-8">
                  <input type="email" class="form-control" id="sign_email" placeholder="Enter email" name="signup_email">
                </div>
              </div>
              <div class="form-group">
                <text class="control-label col-md-4" for="username" style="text-align: left;">Username *</text>
                <div class="col-md-8">
                  <input type="text" class="form-control" id="username" placeholder="username" name="username">
                </div>
              </div>
              <div class="form-group">
                <text class="control-label col-md-4" for="password" style="text-align: left;">Password *</text>
                <div class="col-md-8">
                  <input type="password" class="form-control" id="password" placeholder="Enter password" name="password">
                </div>
              </div>

             <div class="form-group">
                <text class="control-label col-md-4" for="password" style="text-align: left;">ConfirmPassword*</text>
                <div class="col-md-8">
                  <input type="password" class="form-control" id="confirmpassword" placeholder="Enter password again" name="confirmpassword">
                </div>
              </div>





              <div>
                <span id="matching"></span>
              </div>

              <div class="form-group">
                <text class="control-label col-md-4 " for="photo" style="text-align: left;">Photo</text>
                <div class="col-md-8">
                  <input type="file" class="form-control" id="photo" placeholder="choose" name="image">
                </div>
              </div>






              <div class="form-group">
                <div class=" col-md-8">
                <div class="container col-md-6">
                <br>
                </div>
                <div class="container col-md-6">

                                                            <span>
                                                                   <g:if test="${flash.message}">
                                                                   <div class="message">
                                                                     ${flash.message}
                                                                     </div>
                                                                     </g:if>
                                                                   </span>
                                                                   </div>

                </div>
                <div class=" col-md-4">
                  <button type="submit" class="btn btn-basic btn-block" width=100%>
                        Register
                  </button>
                </div>
              </div>


             </g:uploadForm>


          </div>


        </div>
      </div>
    </div>
  </body>
  </html>