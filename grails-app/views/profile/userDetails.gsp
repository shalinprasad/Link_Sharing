<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<div class="container"><br>

    <div class="row">
        <div class="panel panel-default">
            <div class="panel-body" style="background: #31b0d5">

                <div class="container">
                    <div class="col-md-5">
                        <h4 style="color: #a60000"><g:link controller="dashboard" action="index"><strong> <u><b>Link Sharing</b></u></strong></g:link></h4>
                    </div>
                    <div class="col-md-7">
                        <table class="table">
                            <td width=200px>
                                <g:form controller="search" action="search">
                                    <div class="input-group">

                                        <g:textField id="mytext" class="form-control" name="q" placeholder="Search" value="${q}"/>
                                        <div class="input-group-btn">
                                            <button class="btn btn-basic" type="submit">
                                                <span class="glyphicon glyphicon-search"></span>

                                            </button>
                                        </div>
                                    </div>
                                    <p>${flash.message4}
                                    <p>${flash.message6}
                                </g:form>

                            </td>
                            <td width=10px style="text-align:center;">
                                <button type="button" class="btn btn-info btn-group-sm" data-toggle="modal"    data-target="#topicModal">
                                    <i class="material-icons">chat_bubble_outline</i></button>

                            </td>

%{--                            <td width=30px style="text-align:center;">--}%
%{--                                <button type="button" class="btn btn-info btn-group-sm" data-toggle="modal" data-target="#invite">--}%
%{--                                    <i class="material-icons">--}%
%{--                                        mail_outline--}%
%{--                                    </i></button>--}%
%{--                            </td>--}%

%{--                            <td width=30px>--}%
%{--                                <button type="button" class="btn btn-info btn-group-sm" data-toggle="modal"   data-target="#resource"><i class="material-icons" style="text-align:center;">--}%
%{--                                    attach_file--}%
%{--                                </i></button>--}%
%{--                            </td>--}%

%{--                            <td width=30px>--}%
%{--                                <button type="button" class="btn btn-info btn-group-sm" data-toggle="modal" data-target="#linkresource">--}%
%{--                                    <i class="material-icons" style="text-align:center;">description--}%
%{--                                    </i>--}%
%{--                                </button>--}%
%{--                            </td>--}%

                            <td width=30px>

                                <div class="dropdown" >
                                    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">${userdata.firstName}
                                        <span class="caret" onclick="show()"></span></button>
                                    <g:if test="${userdata.admin}">
                                        <ul class="dropdown-menu" id="drop">
                                            <li><a href="/user/myaction">profile</a></li>
                                            <li><a href="/user/findUser">User</a></li>
                                            <li><a href="/Topic/topiclist">Topics</a></li>
                                            <li><a href="/resource/postlist">Posts</a></li>
                                            <li><a href="/Signup/logout">Logout</a></li>
                                        </ul>
                                    </g:if>
                                    <g:else>
                                        <ul class="dropdown-menu" id="drop">
                                            <li><a href="/user/myaction">profile</a></li>
                                            <li><a href="/Signup/logout">Logout</a></li>
                                        </ul>
                                    </g:else>
                                </div>
                            </td>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- for left pannel elements -->

    <div class="row">
        <div class="col-md-5">

            %{--user details panel--}%
            <div class="panel panel-default">
                    <div class="panel-body">
                        <table   style="width:100%">
                            <tr>
                                <td rowspan="4" colspan="3" width="10%">
                                    <asset:image src="${userdata.photo}" height= "100px" width:="100px" style="margin-right: 10px;"/>
                                </td>
                                <td width=200px class="text" colspan="3">
                                   ${userdata.firstName} ${userdata.lastName} </td>
                            </tr>
                            <tr>
                                <td width=150px class="text-muted" colspan="3">@${userdata.username}</td>
                            </tr>
                            <tr>
                                <td width=150px>Subscriptions</td>
                                <td width="150px">Topics</td>
                            </tr>
                            <tr>
                                <td width=150px>${count_subscribe}</td>
                                <td width=150px>${count_topic }</td>
                            </tr>
                        </table>
                    </div>
                </div>

    <div class="panel panel-default">
        <div class="panel-heading">Topics:</div>
        <div class="panel-body">
            <g:each in="${topics}" var="us" status="i">
                <div class="row">
                    <div class="col-md-4">
                        <div style="font-size:15px;">
                            <g:link><b>${us.name}</g:link></b>
                        </div>
                    </div>
                    <div class="col-md-4">
                        Subscriptions:
                        <div>${subs1.get(i)}</div>&nbsp
                    </div>
                    <div class="col-md-4">
                        Posts:
                        <div>${topic1.getAt(i)}</div>
                    </div>
                </div>
            </g:each>
        </div>
    </div>



    <div class="panel panel-default">
        <div class="panel-heading">Subscriptions:</div>
        <div class="panel-body">
            <g:each in="${allTopics}" var="us" status="i">
                %{--<ul class="list-inline">
                    <li>--}%
                        <div class="row">
                            <div class="col-md-4">
                                <div style="font-size:15px;">
                                    <g:link><b>${us.name}</g:link></b>
                                </div>
                            </div>
                            <div class="col-md-4">
                                Subscriptions:
                                <div>${allSubs1.get(i)}</div>
                            </div>
                            <div class="col-md-4" >
                                Posts:
                                <div>${allTopics1.getAt(i)}</div>
                            </div>
                        </div>
                   %{-- </li>
                </ul>--}%
            </g:each>
        </div>
    </div>

            <!-- create topic -->
            <div class="modal fade" id="topicModal" role="dialog">
                <div class="modal-dialog">
                    <!-- topic Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Create Topic</h4>
                        </div>
                        <div class="modal-body">
                            <g:form  controller="topic" action="create" class="topicForm">
                                Name *:
                                <input class="form-control" maxlength="10" pattern="[A-Za-z]+" required type="text" name="topicName" id="topicName"/>
                                Visibility *:
                                <select class="form-control" id="select" name="selection">

                                    <option>PUBLIC</option>
                                    <option>PRIVATE</option>
                                </select>
                                <input type="submit" class="btn btn-success" style="float: right; margin-top: 5px;"/>  <p>${flash.message4}</p>
                            </g:form>
                        </div>
                        <div class="modal-footer" style=" margin-top: 15px;">
                            %{--                <button type="button" class="btn btn-warning" onclick="resetTopicForm()">Reset</button>--}%
                            %{--                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--}%
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <div class="col-md-7">
        <div class="panel panel-default" >
            <div class="panel-heading">Posts:</div>
            <div class="panel-body" style="overflow: auto;height: 280px">
                <g:each in="${resources}" var="res" status="i">
                    <div class="row" style="margin-left: 2%;font-size: medium;text-transform: capitalize"><u>${res.topics.name}</u>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <asset:image src="${res.createdBy.photo}" style="width:90px;height:90px"/>
                        </div>
                        <div class="col-md-8">${res.description}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2"><br></div>
                        <div class="col-md-3">
                            <g:link controller="Resource" action="index" params="[id:res.id]" >View post</g:link>
                        </div>
                        <div class="col-md-4">
                            <g:if test="${res instanceof link_sharing.Link_Resource}">
                               <a href="${res.url}" target="_blank">View Full Site</a>
                            </g:if>
                        </div>
                        <div class="col-md-3">
                            <g:if test="${res instanceof link_sharing.Document_Resource}">
                                <g:link controller="Document" action="download" params="[id:res.id , tid:res.topics.id]" >Download</g:link>
                            </g:if>
                        </div>

                        %{--<div class="col-md-3">
                            <g:link controller="Resource" action="index" params="[id:res.id]" >View post</g:link>
                        </div>--}%
                    </div>
                </g:each>
                <br>
            </div>
        </br>
        </div>
    </div>
</div>
</div>






















        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script>
            function display(){
                document.getElementById("drop").style.display="block";
            }
            function displaydocument(){
                document.getElementById("drop").style.display="block";
            }
            function displayinvite(){
                document.getElementById("drop").style.display="block";
            }
            // var showHideTopicModal = function() {
            //     var currentDisplay = document.getElementById("topicModal").style.display;
            //     if(currentDisplay === "none"){
            //         document.getElementById("topicModal").style.display = "block";
            //     }
            //     else {
            //         document.getElementById("topicModal").style.display = "none";
            //     }
            // }
            var resetTopicForm = function () {
                $(".topicsForm").trigger("reset");
            }
        </script>
</body>
</html>
