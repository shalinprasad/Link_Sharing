<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="grails.util.Holders"%>
<!doctype html>
<html>
<head>
    <script>
        function display(){
            document.getElementById("droped").style.display="block";
        }
    </script>


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="4nonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script>
        function display(){
            document.getElementById("droped").style.display="block";
        }
    </script>
    <style>
    /*body{*/
    /*    background: #555555;*/
    /*}*/
    </style>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
    .dropbtn {
        background-color: #d58512;
        color: white;
        padding: 16px;
        font-size: 16px;
        border: none;
    }
    .dropdown {
        position: relative;
        display: inline-block;
    }
    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f1f1f1;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
    }
    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }
    .dropdown-content a:hover {background-color: #ddd;}
    .dropdown:hover .dropdown-content {display: block;}
    .dropdown:hover .dropbtn {background-color: #3e8e41;}
    </style>

</head>
<body>
<div class="container"><br>
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="container col-md-12" style="background: #31b0d5">
                    <div class="col-md-5">
                        <h4 style="color: #a60000"><g:link controller="dashboard" action="index"><strong> <u>Link Sharing</u></strong></g:link></h4>
                    </div>
                    <div class="col-md-7">
                        <table class="table">
                            <td width=200px>
                                <div class="input-group">
                                    <g:form controller="search" action="search">
                                        <div class="input-group">
                                            <g:textField id="mytext" class="form-control" name="q" placeholder="Search" value="${q}"/>
                                            <div class="input-group-btn">
                                                <button class="btn btn-basic" type="submit">
                                                    <span class="glyphicon glyphicon-search"></span>
                                                </button>
                                            </div>
                                        </div>
                                    </g:form>

                                </div>
                            </td>
%{--                            <td width=10px style="text-align:center;"}>--}%
%{--                                <button type="button" class="btn btn-info btn-group-sm" data-toggle="modal"    data-target="#topicModal">--}%
%{--                                    <i class="material-icons">chat_bubble_outline</i></button>--}%

%{--                            </td>--}%

%{--                            <td width=30px style="text-align:center;"><button type="button" class="btn btn-info btn-group-sm" data-toggle="modal" style="caret-color: #48802c"   data-target="#invite"><i class="material-icons">--}%
%{--                                mail_outline--}%
%{--                            </i></button>--}%
%{--                            </td>--}%

%{--                            <td width=30px> <button type="button" class="btn btn-info btn-group-sm" data-toggle="modal"   data-target="#resource"><i class="material-icons" style="text-align:center;">--}%
%{--                                attach_file--}%
%{--                            </i></button>--}%
%{--                            </td>--}%

%{--                            <td width=30px><button type="button" class="btn btn-info btn-group-sm" data-toggle="modal"   data-target="#linkresource"><i class="material-icons" style="text-align:center;">description--}%
%{--                            </i></button>--}%
%{--                            </td>--}%

                            %{-- <td width=40px style="text-align:right;"><i class="material-icons">face</i>
                             </td>--}%

                            <td width=30px>

                                <div class="dropdown" >
                                    <button class="btn btn-primary" >${userdata.username}
                                    </button>
                                    <div class="dropdown-content">

                                        <g:if test="${userdata.admin==true}">
                                            <a href="/user/myaction">profile</a>
                                            <a href="/user/findUser">User</a>
                                            <a href="/topic/topiclist">Topics</a>
                                            <a href="/Signup/logout">Logout</a>
                                        </g:if>
                                        <g:else>
                                            <a href="/user/myaction">profile</a>
                                            <a href="/Signup/logout">Logout</a>
                                        </g:else>
                                    </div>
                                </div>
                            </td>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-5">
        <div class="panel panel-default">
            <div class="panel-heading">Recent Searches</div>
            <div class="panel-body">
                <table  style="width:100%">
                    <td rowspan="3" width=15% align="center"> <asset:image src="${userdata.photo}"  style="width:60px;height:60px"/></td>
                    <td width=275px class="text"></td>
                    <td width=150px class="text-muted"></td>
                    <td width=150px></td>
                    <td width=150px></td>
                    <td width=150px>
                        <a href="#"></a>

                    </td>
                </tr>
                    <td colspan="5" ></td>
                </tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><a href="#"></a></td>
                </table>
            </div>
        </div>

        <!-- write here for left column pannels-->
    </div>

    <!-- right side pannel elements starts here-->
    <div class="col-md-7">

    <div class="panel panel-default">
        <div class="panel-heading">Profile</div>
        <div class="panel-body">
            <g:form class="form-horizontal"  controller="profile" action="profile" enctype="multipart/form-data">
                <div class="form-group">
                    <text class="control-label col-md-4" for="email" style="text-align: left;">First Name *</text>
                    <div class="col-md-8">
                        <input type="text" class="form-control" required id="fname" placeholder="Enter firstname" name="fname" value=" ${userdata.firstName}">
                    </div>
                </div>
                <div class="form-group">
                    <text class="control-label col-md-4" for="email" style="text-align: left;">Last Name *</text>
                    <div class="col-md-8">
                        <input type="text" class="form-control" required name="lname" id="lname" placeholder="Enter lastname" value=" ${userdata.lastName}">
                    </div>
                </div>
                <div class="form-group">
                    <text class="control-label col-md-4" for="email" style="text-align: left;">Username *</text>
                    <div class="col-md-8">
                        <input type="text" class="form-control" required id="username" name="username" placeholder="Enter Username" value=" ${userdata.username}" >
                    </div>
                </div>
                <div class="form-group">
                    <text class="control-label col-md-4 " for="photo" style="text-align: left;">Photo</text>
                    <div class="col-md-8">
                        <input type="file" class="form-control"  id="inputphoto" placeholder="choose" name="inputphoto"value=" ${userdata.photo}">
                    </div>


                </div>
                <div class="form-group">
                    <div class=" col-md-8">
                    </div>
                    <div class=" col-md-4">
                        <button type="submit" class="btn btn-basic btn-block" width=100%>Update</button>
                    </div>
                </div>
            </g:form>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">Change Password</div>
        <div class="panel-body">
            <g:form class="form-horizontal"  controller="Profile" action="password" >

                <div class="form-group">
                    <text class="control-label col-md-4" for="pwd" style="text-align: left;">Password *</text>
                    <div class="col-md-8">
                        <input type="password" required class="form-control" id="email" placeholder="Password" name="password">
                    </div>
                </div>
%{--                <div class="form-group">--}%
%{--                    <text class="control-label col-md-4" for="pwd" style="text-align: left;">ConfirmPassword*</text>--}%
%{--                    <div class="col-md-8">--}%
%{--                        <input type="password" class="form-control" id="email" placeholder="Confirm password" name="confirmpass">--}%
%{--                    </div>--}%
%{--                </div>--}%
                <div class="form-group">
                    <div class=" col-md-8">
                    </div>
                    <div class=" col-md-4">
                        <button type="submit" class="btn btn-basic btn-block" width=100%>Update</button>
                    </div>
                </div>
                <p>${flash.message5}</p>
            </g:form>
        </div>
    </div>

    <div class="modal fade"  id="invite" role="dialog">
        <div class="modal-dialog">
            <!-- topic Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h3 class="modal-title" style="alignment: center;">Send Invitation</h3>
                </div>
                <div class="modal-body">
                    <g:uploadForm  controller="topic" action="invite" class="topicForm">
                        Email *:
                        <input type="text" class="form-control" required id="iemail" placeholder="Link" name="iemail">
                        <br>
                        <g:select class="btn dropdown-toggle col-sm-8 form-control" name="topics" from="${subscriptions.topics.name}"  optionValue="value" />
                        <br>
                        <br>
                        <input type="submit" value="share"   class="btn btn-success" style="float: right; margin-top: 5px;"/>




                    </g:uploadForm>
                </div>
                <div class="modal-footer" style=" margin-top: 15px;">
                    <button type="button" class="btn btn-warning" onclick="resetTopicForm()">Reset</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade"  id="linkresource" role="dialog">
        <div class="modal-dialog">
            <!-- topic Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Share Link</h4>
                </div>
                <div class="modal-body">
                    <g:uploadForm  controller="topic" action="saveLink" class="topicForm">
                        Link *:
                        <input type="text" class="form-control" required id="linkres" placeholder="Link" name="linkres">
                        <br>
                        Description *:
                        <textarea class="form-control" required id="selectlink" required name="selectlink"></textarea>
                        <br>
                        <g:select class="btn dropdown-toggle col-sm-8 form-control" name="topic" from="${subscriptions.topics.name}"  optionValue="value" />
                        <br>
                        <br>
                        <input type="submit" value="share"   class="btn btn-success" style="float: right; margin-top: 5px;"/>

                    </g:uploadForm>
                </div>
                <div class="modal-footer" style=" margin-top: 15px;">
                    <button type="button" class="btn btn-warning" onclick="resetTopicForm()">Reset</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade"  id="resource" role="dialog">
        <div class="modal-dialog">
            <!-- topic Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Share Document</h4>
                </div>
                <div class="modal-body">
                    <g:uploadForm  controller="document" action="save" class="topicForm">
                        Document *:
                        <input type="file" class="form-control" required id="doc" placeholder="choose" name="document">
                        <br>
                        Description *:
                        <textarea class="form-control" required id="select" name="select"></textarea>
                        <br>
                        <g:select class="btn dropdown-toggle col-sm-8 form-control" name="topics" from="${subscriptions.topics.name}"  optionValue="value" />
                        <br>
                        <br>
                        <input type="submit" value="share"   class="btn btn-success" style="float: right; margin-top: 5px;"/>

                    </g:uploadForm>
                </div>
                <div class="modal-footer" style=" margin-top: 15px;">
                    <button type="button" class="btn btn-warning" onclick="resetTopicForm()">Reset</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>

    </div>


    <div class="modal fade" id="topicModal" role="dialog">
        <div class="modal-dialog">
            <!-- topic Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Create Topic</h4>
                </div>
                <div class="modal-body">
                    <g:form  controller="topic" action="save" class="topicForm">
                        Name *:
                        <input class="form-control" type="text" name="topicName" id="topicName"/>
                        Visibility *:
                        <select class="form-control" id="select" name="selection">
                            <option>PUBLIC</option>
                            <option>PRIVATE</option>
                        </select>
                        <input type="submit" class="btn btn-success" style="float: right; margin-top: 5px;"/>
                    </g:form>
                </div>
                <div class="modal-footer" style=" margin-top: 15px;">
                    <button type="button" class="btn btn-warning" onclick="resetTopicForm()">Reset</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

</div>

</div>






</body>
</html>