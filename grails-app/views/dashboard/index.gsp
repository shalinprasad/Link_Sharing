<!doctype html>
<%@ page import="rx.bootcamp.*" %>
<html>
<head>
    <meta charset="utf-8" />
           <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
           <meta name="description" content="" />
           <meta name="author" content="" />
           <!--[if IE]>
               <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
               <![endif]-->
           <title>LINK SHARING APPLICATION</title>
           <!-- BOOTSTRAP CORE STYLE  -->
           <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"></link>

           <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
           <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
       	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
   <div class="container"><br>
       <div class="panel panel-default" style="height:70px">
         <div class="panel-body">
           <div class="container">
             <div class="col-md-4">
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
             <div class= "col-md-3">
              <ul class="nav navbar-nav">

                     <li><a href="" data-toggle="modal" data-target="#createtopic"  ><span class="glyphicon glyphicon-comment"></span></a></li>
                     <li><a href="" data-toggle="modal" data-target="#sendinvitation" ><span class="glyphicon glyphicon-envelope"></span></a></li>
                     <li><a href="" data-toggle="modal" ><span class="glyphicon glyphicon-link"></span></a></li>
                     <li><a href="" data-toggle="modal" ><span class="glyphicon glyphicon-file"></span></a></li>

                 </ul>

             </div>

<div class="modal fade" id="createtopic">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" >Create Topic</h4>
        </div>
        <div class="modal-body">
        <g:form class="form-horizontal" controller="topic" action="create" name="topicCreate">
                                         <div class="form-group">
                                             <div class="col-sm-2 control-label">Name</div>
                                             <div class="col-sm-10">
                                                 <input type="text" name="topicName" placeholder="Topic Name"
                                                              class="form-control col-sm-8" />
                                             </div>
                                         </div>
                                         <div class="form-group">
                                             <div class="col-sm-2 control-label">visibility</div>
                                             <div class="col-sm-10">
                                                 <g:select name="visibility" from="${['public' , 'private']}"
                                                           class="dropdown-toggle btn btn-default col-sm-8"  />
                                             </div>
                                         </div>
                                         <div class="form-group">
                                             <div class="col-sm-offset-2 col-sm-10">
                                                 <button type="submit" class="btn btn-default">Save</button>
                                             </div>
                                         </div>
                                     </g:form>

      </div>
      </div>
      </div></div>









      <div class="modal fade" id="sendinvitation">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" >Send Invitation</h4>
              </div>
              <div class="modal-body">
              <g:form class="form-horizontal" controller="topic" action="create" name="topicCreate">
                                               <div class="form-group">
                                                   <div class="col-sm-2 control-label">Email</div>
                                                   <div class="col-sm-10">
                                                       <input type="email" name="topicName" placeholder="Topic Name"
                                                                    class="form-control col-sm-8" />
                                                   </div>
                                               </div>
                                               <div class="form-group">
                                                   <div class="col-sm-2 control-label">Topic</div>
                                                   <div class="col-sm-10">
                                                       <g:select name="visibility" from="${['public' , 'private']}"
                                                                 class="dropdown-toggle btn btn-default col-sm-8"  />
                                                   </div>
                                               </div>
                                               <div class="form-group">
                                                   <div class="col-sm-offset-2 col-sm-10">
                                                       <button type="submit" class="btn btn-default">Save</button>
                                                   </div>
                                               </div>
                                           </g:form>

            </div>
            </div>
            </div></div>
























             <div class ="col-md-2">
             ${user.username}
             <li class="fa fa-caret-down"  onclick="Show()"></li>
             <ul class="nav nav-pills nav-stacked" id="drop" style="display:none">
               <li style="height:20px"><a href="#">Profile</a></li>
               <li style="height:20px"><a href="#">Users</a></li>
               <li style="height:20px"><a href="#">Topics</a></li>
               <li style="height:20px"><a href="#">Posts</a></li>
               <li style="height:20px"><a href="">Logout</a></li>
             </ul>

             </div>
           </div>
         </div>
       </div>
       <div class="col-md-5">

        <div class="panel panel-default">

                <div class="panel-body">
               // <g:img uri="${user.photo}"/>
                <div style="font-size:23px;"><b>${user.firstName} &nbsp ${user.lastName}</b></div>
                <div>@${user.username}</div>


                </div>
              </div>


       <div class="panel panel-default">
         <div class="panel-heading">Subscriptions</div>
         <div class="panel-body">
          dvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv  jb jhb jb jb jh

         </div>
         <div class="panel-body">
        n knk nk nk

                  </div>
       </div>
       <div class="panel panel-default">
                <div class="panel-heading">Top posts</div>
                <div class="panel-body">Panel Content</div>





              </div>

       </div>
       <div class="col-md-5">

        </div>
              </div>

       </div>

</body>
<script>
function Show()
{
document.getElementById("drop").style.display="block";
}
</script>
</html>