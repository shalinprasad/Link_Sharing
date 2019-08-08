<%@ page import="link_sharing.Resource1" %>
<html>
<head>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="4nonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<body>

<g:javascript>
            var resetPasswordUrl = "${createLink(controller: 'user', action: 'passreset')}";
</g:javascript>


<div class="container"><br>
  <div class="panel panel-default col-md-12">
    <div class="panel-body">
      <div class="container">
        <div class="col-md-8">
          <h4 style="color: #a60000"><g:link controller="#" action="#"><strong> <u><b>Link Sharing</b></u></strong></g:link></h4>
        </div>

      </button>
      </div>
    </div>
  </div>
</div>
</div>
</div>




<div class="row">
  <div class="col-md-7">
    <div class="panel panel-default" style="height:350px;overflow: auto;">
      <div class="panel-heading">Recent shares</div>
      <div class="panel-body">
        <g:each in="${resources}" var="res" status="i">
          %{--<ul class="list-inline">
            <li>--}%
              <div class="row">
                <div class="col-md-3">
                  <asset:image src="${res.createdBy.photo}"  style="width:90px;height:90px"/>
                </div>
                <div class="col-sm-9">
                  <div class="row">
                    <div class="col-sm-4">
                      <b>${res.createdBy.firstName}&nbsp${res.createdBy.lastName}</b>
                    </div>
                    <div class="col-sm-4">@${res.createdBy.username}
                    </div>
                    <div class="col-sm-4" style="font-size: medium; float: right">
                      ${res.topics.name}
                    </div>
                    %{--<div class="col-sm-12" style="font-size: medium; float: right">
                      <g:link controller="resource" action="index" params="[id: res.id]">View post</g:link>
                    </div>--}%
                  </div>
                  <div class="col-md-8"><br></div>
                  <div class="col-md-4" style="font-size: medium; float: right">
                    <g:link controller="resource" action="index" params="[id: res.id]">View post</g:link>
                  </div>

                  <br>
                  <div class="row">
                    <div class="col-md-12">
                      ${res.description}
                    </div>
                  </div>
                  <br>
                  %{--<div class="row">
                    <div class="col-md-offset-8" style="font-size: medium;">
                      <g:link controller="resource" action="index" params="[id: res.id]">View post</g:link>
                    </div>
                  </div>--}%
                  <br>
                </div>
              </div>
           %{-- </li>
          </ul>--}%
          <hr style="color: black" size="100" color="black">
        </g:each>
      </div>
    </div>



    <div class="panel panel-default" style="height:350px;overflow: auto;">
      <div class="panel-heading">Top posts</div>
      <div class="panel-body">
        <g:each in="${posts}" var="res" status="i">
%{--          <ul class="list-inline">--}%
%{--            <li>--}%
              <div class="row">
                <div class="col-md-3">
                  <asset:image src="${Resource1.get(res).createdBy.photo}"  style="width:90px;height:90px"/></div>
                <div class="col-sm-9">
                  <div class="row">
                    <div class="col-sm-4">
                      <b>${link_sharing.Resource1.get(res).createdBy.firstName}&nbsp${Resource1.get(res).createdBy.lastName}</b>
                    </div>
                    <div class="col-sm-5">@${Resource1.get(res).createdBy.username}</div>

                    <a class=col-sm-3 style="font-size: medium"><u>${Resource1.get(res).topics.name}</u></a>
                  </div>
                  <br>
                  <div class="row">
                    <div class="col-md-9"><br></div>
                    <div class="col-md-3 "style="float: right">
                      <g:link controller="resource" action="index" params="[id: res]">View post</g:link>
                    </div>

                  </div>

                  <div class="row">
                    ${Resource1.get(res).description}
                  </div>
                  <br>
%{--                  <div class="row">--}%
%{--                    <div class="col-md-8"><br></div>--}%
%{--                    <div class="col-md-4 "style="float: right">--}%
%{--                      <g:link controller="resource" action="index" params="[id: res]">View post</g:link>--}%
%{--                    </div>--}%

%{--                  </div>--}%
                </div>
              </div>



%{--            </li>--}%
%{--          </ul>--}%
          <hr style="color: black" size="100" color="black">
        </g:each>
      </div>
    </div>


  </div>

  <div class="col-md-5">
        <div class="panel panel-default">
          <div class="panel-heading">Login</div>

          <div class="panel-body">
            <g:form class="form-horizontal"url="[controller:'Signup',action:'login']">
              <div class="form-group">
                <text class="control-label col-md-4" required for="email"  style="text-align: left;">Email*</text>
                <div class="col-md-8">
                  <input type="email"  required class="form-control" id="e" placeholder="Enter email" name="s_email">
                </div>
              </div>
              <div class="form-group">
                <text class="control-label col-md-4 " for="pwd" style="text-align: left;">Password *</text>
                <div class="col-md-8">
                  <input type="password" required class="form-control" id="pwd" placeholder="Enter password" name="s_pwd">
                <span>

                    <div class="message">
                      ${flash.message}
                      <p id="message"></p>
                      </div>


                    </span>
                </div>
              </div>
              <div class="form-group">
                <div class=" col-md-10">
                  <a href="#" onclick="changepass()">Forgot Password?</a>
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
            <g:form class="form-horizontal" url="[controller:'signup',action:'signup']" enctype="multipart/form-data">
              <div class="form-group">
                <text class="control-label col-md-4"  required for="firstname" style="text-align: left;">First Name *</text>
                <div class="col-md-8">
                  <input type="text" class="form-control" required id="firstname" maxlength="10" placeholder="Enter firstname" name="firstname" pattern="[A-Za-z]*">
                </div>
              </div>
              <div class="form-group">
                <text class="control-label col-md-4" for="lastname" style="text-align: left;">Last Name *</text>
                <div class="col-md-8">
                  <input type="text" class="form-control" required id="lastname" maxlength="10" placeholder="Enter lastname" name="lastname" pattern="[A-Za-z]*" >
                </div>
              </div>
              <div class="form-group">
                <text class="control-label col-md-4" for="email" style="text-align: left;">Email *</text>
                <div class="col-md-8">
                  <input type="email" class="form-control" required id="sign_email" placeholder="Enter email" name="signup_email">
                </div>
              </div>
              <div class="form-group">
                <text class="control-label col-md-4" for="username" style="text-align: left;">Username *</text>
                <div class="col-md-8">
                  <input type="text" class="form-control"  required id="username" placeholder="username" name="username">
                </div>
              </div>
              <div class="form-group">
                <text class="control-label col-md-4" required for="password" style="text-align: left;">Password *</text>
                <div class="col-md-8">
                  <input type="password" class="form-control" id="password" minlength="5" length="10"placeholder="Enter password" name="password">
                </div>
              </div>

             <div class="form-group">
                <text class="control-label col-md-4" required for="password" style="text-align: left;">ConfirmPassword*</text>
                <div class="col-md-8">
                  <input type="password" class="form-control" id="confirmpassword" minlength="5"  placeholder="Enter password again" name="confirmpassword">
                </div>
              </div>





              <div>
                <span id="matching"></span>
              </div>

              <div class="form-group">
                <text class="control-label col-md-4 " for="photo" style="text-align: left;">Photo</text>
                <div class="col-md-8">
                  <input type="file" class="form-control" id="photo" placeholder="choose" name="inputphoto">
                </div>
              </div>






              <div class="form-group">
                <div class=" col-md-8">
                <div class="container col-md-6">
                <br>
                </div>
                <div class="container col-md-6">

                  <p>${flash.message3}</p>
                                                            <span>
                                                                   <g:if test="${flash.message}">
                                                                   <div class="message">
                                                                     <p id="message"></p>

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


             </g:form>


          </div>

          <script>
          function changepass(){

          var email=$('#e').val();
          console.log(email, resetPasswordUrl);
          $.ajax({
          "url": resetPasswordUrl,
          "type": "get",
          "data": {email: email},
          success: function(){
          document.getElementById("message").innerHTML="Change password Link has been send your gmail account"
          }
          });
          }
          </script>

        </div>
      </div>
    </div>
  </body>
  </html>