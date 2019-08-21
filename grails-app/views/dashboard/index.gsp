<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<div class="container"><br>

    <div class="row">
        <div class="panel panel-default" style="background: #31b0d5">
            <div class="panel-body">
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

                            <td width=30px style="text-align:center;">
                                <button type="button" class="btn btn-info btn-group-sm" data-toggle="modal" data-target="#invite">
                                    <i class="material-icons">
                                        mail_outline
                                    </i></button>
                            </td>

                            <td width=30px>
                                <button type="button" class="btn btn-info btn-group-sm" data-toggle="modal"   data-target="#resource"><i class="material-icons" style="text-align:center;">
                                    attach_file
                                </i></button>
                            </td>

                            <td width=30px>
                                <button type="button" class="btn btn-info btn-group-sm" data-toggle="modal" data-target="#linkresource">
                                    <i class="material-icons" style="text-align:center;">description
                                    </i>
                                </button>
                            </td>

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
                <div class="panel panel-default">
                    <div class="panel-body">
                        <table   style="width:100%">
                            <tr>
                                <td rowspan="4" colspan="3" width="10%">
                                    <g:link controller="profile" action="userDetails"><asset:image src="${userdata.photo}" height= "100px" width:="100px" style="margin-right: 10px;"/> </g:link>
                                </td>
                                <td width=200px class="text" colspan="3">
                                    <g:link controller="profile"   action="userDetails">${userdata.firstName} ${userdata.lastName} </g:link></td>
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
            </div>

            %{--subscription Modal--}%
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div style="float:left">Subscriptions</div><br>
                    <div style="margin-left:350px"></div>
                </div>
                <div class="panel-body">
                    <g:each in="${subscriptions}" var="us" status="i">
                        <li>
                        <div class="row">
                            <div class="col-md-4">
                                <asset:image src="${us.topics.user.photo}" style="width:60px;height:60px"/></div>
                            <g:link controller="topic" action="topicshow" params="[id: us.id]"> ${us.topics.name} </g:link>
                        <div class="col-sm-8">
                            <div style="font-size:23px;">
                                <g:link controller="dashboard" action="index" params="[id: us.id]"></g:link></div>
                            <div>@${us.topics.user.username}</div>
                            <div class="col-sm-6">
                                Subscriptions:
                                <div>${subscount.getAt(i) }</div></div>
                            <div class="col-sm-6">
                                Posts:
                                <div><a>${resourcecount.get(i)}</a></div></div>




                            <g:if test="${us.topics.user.username==session.name}">

                            </g:if>
                            <g:else>
                                <g:link controller="Subscription" action="unsubscribe" params="[id:us.id, page:'dashboard']">  Unsubscribe </g:link></div></div>

                            </g:else>


                            <g:if test  = "${us.topics.user.username==session.name}" >
                                <div class="row">
                                    <div class="col-md-12">
                                        <ul class="list-inline">
                                            <li>
                                                <g:form controller="subscription" action="updateSerious">
                                                    <g:field type="hidden" name="id" value="${us.id}"></g:field>
                                                    <g:select onChange="submit()" name="seriousness" from="${['SERIOUS','CASUAL','VERY_SERIOUS']}"
                                                              value="${us.seriousness}" />
                                                </g:form>
                                            </li>
                                            <li>
                                                <g:form controller="Topic" action="updateVisibility">
                                                    <g:field type="hidden" name="id" value="${us.topics.id}"></g:field>
                                                    <g:select onChange="submit()" name="visibility" from="${['PUBLIC','PRIVATE']}"
                                                              value="${us.topics.visibilty}" />
                                                </g:form>
                                            </li>
                                        </ul>
                                        <g:link controller="topic" action="deleted" params="[id:us.topics.id]"><span class="glyphicon glyphicon-trash"></span></g:link>
                                    </div>
                                </div>
                            </g:if>
                            <g:else>
                                <g:form controller="subscription" action="updateSerious">
                                    <g:field type="hidden" name="id" value="${us.id}"></g:field>
                                    <g:select onChange="submit()" name="seriousness" from="${['SERIOUS','CASUAL','VERY_SERIOUS']}"
                                              value="${us.seriousness}" />
                                </g:form>
                            </g:else>
                        </li>
                    </g:each>

                </div>
            </div>


            %{--Trending topic List--}%

            <div class="panel panel-default">
                <div class="panel-heading">
                    <div style="float:left">Trending Topics</div><br>
                    <div style="margin-left:350px"></div>
                </div>
                <div class="panel-body">
                    <g:each in="${trending}" var="us" status="i">
                        <li>
                            <div class="row">
                                <div class="col-md-4">
                                    <g:link controller="profile" action="userDetails">       <asset:image src="${us.user.photo}"  style="width:70px;height:70px"/>   </g:link>   </div>
                                <div class="col-sm-8">
                                    <div style="font-size:23px;"><b>
                                        ${us.name}
                                    </b></div>
                                    <div>@${us.user.username}</div>
                                    <div class="col-sm-6">
                                        Subscriptions:
                                        <div>${subs2.get(i)}</div></div>
                                    <div class="col-sm-6">
                                        Posts:
                                        <div><a>${topic2.get(i)}</a></div></div>
                                </div>
                            %{--                                <g:link controller="Subscription" action="subscribe" params="[id:us.id, page:"dashboard"]">  Subscribe </g:link>--}%


                                <g:if test="${us.subscriptions.user.username.contains(session.name)}">
                                    <g:link controller="Subscription" action="unsubscribe" params="[id:us.id, page :'dashboard']">Unsubscribe</g:link><br>
                                </g:if>
                                <g:else>
                                    <g:link controller="Subscription" action="subscribe" params="[id:us.id, page:'dashboard']">Subscribe</g:link><br>
                                </g:else>
                        </li>
                    </g:each>
                </div>


                <script>
                    function show()
                    {
                        document.getElementById("drop").style.display="block";
                    }
                </script>


            </div>


        </div>
        <!-- this is for right side pannel -->

        <div class="panel panel-default" style="height:400px;overflow: auto;">
            <div class="panel-heading"><div style="float:left">Inbox</div><br>
                <div style="margin-left:350px"></div>
            </div>
            <div class="panel-body">
                <g:each in="${resource}" var="res" status="i">
                    <ul class="list-inline">
                        <li>
                            <div class="row">
                                <div class="col-md-3">
                                    <asset:image src="${res.createdBy.photo}"  style="width:70px;height:70px"/></div>
                                <div class="col-sm-9">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <b>${res.createdBy.firstName}&nbsp${res.createdBy.lastName}</b></div>
                                        <div class="col-sm-5">@${res.createdBy.username}</div>
                                        <a class=col-sm-3>${res.topics.name}</a></div>
                                    <div class="row">
                                        ${res.description}
                                    </div>
                                    <br>
                                <div class="row">
                                <div class="col-md-3">
                                    <g:if test="${res instanceof link_sharing.Link_Resource}">
                                        <a >Download</a>
                                        </div>
                                        <div class="col-md-3">
                                            <a href="${res.url}">View Full Site</a>
                                        </div>
                                    </g:if>
                                    <g:else>
                                        <g:link controller="Document" action="download" params="[id:res.id , tid:res.id ]" >Download</g:link>
                                        </div>
                                        <div class="col-md-3">
                                            <a >View Full Site</a>
                                        </div>
                                    </g:else>
                                    <div class="col-md-3">
                                        %{--                     <g:if test="${}">--}%
                                        <g:link controller="resource" action="editread" params="[id1:res.id]">Mark as read</g:link>
                                    </div>
                                    <div class="col-md-3">
                                        %{--<g:link controller="resource" action="index" params="[id: res.id]">View post</g:link>--}%
                                        %{--                                    <g:link controller="resource" action="index" params="[id: res.id]">View post</g:link>--}%
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <br>
                </g:each>
            </div>
        </div>
    </div>






    <div class="modal fade" id="invite" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" >Send Invitation</h4>
                </div>
                <div class="modal-body">
                    <g:form class="form-horizontal" controller="topic" action="sendInvite" name="invitation">
                        <div class="form-group">
                            <div class="col-sm-2 control-label">Email</div>
                            <div class="col-sm-10">
                                <input type="email"  required name="email" placeholder="Enter email"
                                       class="form-control col-sm-8" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2 control-label">Topic</div>
                            <div class="col-sm-10">
                                <g:select name="topicName" from="${subscriptions.topics.name}"
                                          class="dropdown-toggle btn btn-default col-sm-8">
                                </g:select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-default">Send</button>
                            </div>
                        </div>
                    </g:form>

                </div>
            </div>
        </div></div>















    %{--lastbutton right --}%

    <div class="modal fade"  id="linkresource" role="dialog">
        <div class="modal-dialog">
            <!-- topic Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Share Link</h4>
                </div>
                <div class="modal-body">
                    <g:uploadForm  controller="Document" action="saveLink" class="topicForm">
                        Link *:
                        <input type="url" class="form-control"  required id="linkres" placeholder="Link" name="linkres">
                        <br>
                        Description *:
                        <textarea class="form-control"  required id="selectlink" name="selectlink"></textarea>
                        <br>
                        <g:select class="btn dropdown-toggle col-sm-8 form-control" name="topics" from="${subscriptions.topics.name}"  optionValue="value" />
                        <br>
                        <br>
                        <input type="submit" value="share"   class="btn btn-success" style="float: right; margin-top: 5px;"/>
                    </g:uploadForm>
                </div>
                <div class="modal-footer" style=" margin-top: 15px;">

                </div>
            </div>
        </div>
    </div>
</div>
</div>

















%{--Shared Document--}%

<div class="modal fade"  id="resource" role="dialog">
    <div class="modal-dialog">
        <!-- topic Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Share Document</h4>
            </div>
            <div class="modal-body">
                <g:uploadForm  class="form-horizontal" controller="Document"   action="save" name="documentcreate" enctype="multipart/form-data">>
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

            </div>
        </div>
    </div>
</div>
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
                    <input class="form-control" maxlength="10" pattern="[A-Za-z0-9]+" required type="text" name="topicName" id="topicName"/>
                    Visibility *:
                    <select class="form-control" id="select" name="selection">

                        <option>PUBLIC</option>
                        <option>PRIVATE</option>
                    </select>
                    <input type="submit" class="btn btn-success" style="float: right; margin-top: 5px;"/>  <p>${flash.message4}</p>
                </g:form>
            </div>
            <div class="modal-footer" style=" margin-top: 15px;">

            </div>
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

    var resetTopicForm = function () {
        $(".topicsForm").trigger("reset");
    }
</script>
</body>
</html>