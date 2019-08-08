<%--
  Created by IntelliJ IDEA.
  User: shalin
  Date: 06/08/19
  Time: 5:36 PM
--%>


<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="4nonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
    .dropbtn {
        /*background-color: #d58512;*/
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
    <script>
        function display(){
            document.getElementById("droped").style.display="block";
        }
    </script>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="container col-md-12" style="background: #31b0d5">
                    <div class="col-md-5">
                        <h4 style="color: #a60000"><g:link controller="dashboard" action="index"><strong> <u><b>Link Sharing</b></u></strong></g:link></h4>
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
                                    ${flash.message4}

                                </div>
                            </td>
%{--                            <td width=10px style="text-align:center;"}>--}%
%{--                                <button type="button" class="btn btn-info btn-group-sm" data-toggle="modal" data-target="#topicModal">--}%
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

                            <td width=30px>

                                <div class="dropdown" >
                                    <button class="btn btn-primary" >${userdata.username}
                                    </button>
                                    <div class="dropdown-content">

                                        <g:if test="${userdata.admin==true}">
                                            <a href="/User/myaction">Profile</a>
                                            <a href="/user/findUser">User</a>
                                            <a href="/topic/topiclist">Topics</a>
                                            <a href="/resource/postlist">Posts</a>
                                            <a href="/Signup/logout">Logout</a>
                                        </g:if>
                                        <g:else>
                                            <a href="/User/myaction">Profile</a>
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
    <div class="modal fade"  id="linkresource" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Share Link</h4>
                </div>
                <div class="modal-body">
                    <g:uploadForm  controller="topic" action="saveLink" class="topicForm">
                        Link *:
                        <input type="text" class="form-control" id="linkres" placeholder="Link" name="linkres">
                        <br>
                        Description *:
                        <textarea class="form-control" id="selectlink" name="selectlink"></textarea>
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
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Share Document</h4>
                </div>
                <div class="modal-body">
                    <g:uploadForm  controller="topic" action="saveDoc" class="topicForm">
                        Document *:
                        <input type="file" class="form-control" id="doc" placeholder="choose" name="document">
                        <br>
                        Description *:
                        <textarea class="form-control" id="select" name="select"></textarea>
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


    <div class="modal fade" id="topicModal" role="dialog">
        <div class="modal-dialog">
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

    <div class="modal fade"  id="invite" role="dialog">
        <div class="modal-dialog">
            <!-- topic Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h3 class="modal-title" style="alignment: center;">Send Invitation</h3>
                </div>
                <div class="modal-body">
                    <g:uploadForm  controller="topic" action="sendInvite" class="topicForm">
                        Email *:
                        <input type="text" class="form-control" id="iemail" placeholder="Link" name="iemail">
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
    <div class="panel-default">
        <div class="panel-body">
            <h2>Topics List</h2>
            <p>The table represent the all users</p>
            <table id="example" class="table table-striped table-bordered">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Description</th>
                    <th>Created By</th>
                    <th>Topic</th>
                </tr>
                </thead>
                <tbody>
                <g:each var="res" in="${list}">
                    <tr>
                        <td>${res.id}</td>
                        <td>${res.description}</td>
                        <td>${res.createdBy.username}</td>
                        <td>${res.topics.name}</td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#example').DataTable( {
                "order": [[ 3, "desc" ]]
            } );
        } );
    </script>
</body>
</html>