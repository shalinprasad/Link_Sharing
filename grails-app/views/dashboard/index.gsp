<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<div class="container"><br>

    <div class="row">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="container">
                    <div class="col-md-5">
                        <h4><a href="#"><strong> <u>Link Sharing</u></strong></a></h4>
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
                            <i class="material-icons" style="text-align:center;"> description
                            </i>
                            </button>
                            </td>


                            <td width=30px>

                                <div class="dropdown" >
                                    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">${userdata.firstName}
                                        <span class="caret" onclick="show()"></span></button>
                                    <ul class="dropdown-menu" id="drop">
                                        <li><a href="#">profile</a></li>
                                        <li><a href="/UserList/findUser">User</a></li>
                                        <li><a href="#">Topics</a></li>
                                        <li><a href="/Signup/logout">Logout</a></li>
                                    </ul>
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
                                    <img src="https://i.stack.imgur.com/l60Hf.png" height="100px" width="90px" style="margin-right: 10px;">
                                </td>
                                <td width=200px class="text" colspan="3">${userdata.firstName} ${userdata.lastName}</td>
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
                    <div style="float:left">Subscriptions</div>
                    <div style="margin-left:350px">View all</div>
                </div>
                <div class="panel-body">
                    <g:each in="${subscriptions}" var="us" status="i">
                        <li>
                            <div class="row">
                                <div class="col-md-4">
                                    <asset:image src="https://i.stack.imgur.com/l60Hf.png" style="width:60px;height:60px"/></div>
                                <div class="col-sm-8">
                                    <div style="font-size:23px;"><g:link controller="dashboard" action="index" params="[id: us.id]">${us.topics.name}</g:link></div>
                                    <div>@${us.topics.user.username}</div>
                                    <div class="col-sm-6">
                                        Subscriptions:
                                        <div>${subscount.getAt(i) }</div></div>
                                    <div class="col-sm-6">
                                        Posts:
                                        <div><a>${resourcecount.get(i)}</a></div></div>
                                    <a>Unsubscribe</a></div></div>
                            <g:if test  = "${us.topics.user.email==session.name}" >
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
                                                <g:form controller="topic" action="updateVisibility">
                                                    <g:field type="hidden" name="id" value="${us.topicId}"></g:field>
                                                    <g:select onChange="submit()" name="visibility" from="${['PUBLIC','PRIVATE']}"
                                                              value="${us.topics.visibility}" />
                                                </g:form>
                                            </li>
                                        </ul>
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
                    <div style="float:left">Trending Topics</div>
                    <div style="margin-left:350px">View all</div>
                </div>
                <div class="panel-body">
                    <g:each in="${trending}" var="us" status="i">
                        <li>
                            <div class="row">
                                <div class="col-md-4">
                                    <img src="images.jpeg"/></div>
                                <div class="col-sm-8">
                                    <div style="font-size:23px;"><b>${us.name}</b></div>
                                    <div>@${us.user.username}</div>
                                    <div class="col-sm-6">
                                        Subscriptions:
                                        <div>2</div></div>
                                    <div class="col-sm-6">
                                        Posts:
                                        <div><a>2</a></div></div>
                                </div>
                                <a>Unsubscribe</a></div>
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


        <div class="col-md-7">
            %{--inbox--}%
            <div class="panel panel-default">
                <div class="panel-heading">Inbox</div>
                <div class="panel-body">
                    <table style="width:100%" >
                        <tr>
                            <td rowspan="3" width=25%> <img src="https://i.stack.imgur.com/l60Hf.png" height=120px width=125px></td>
                            <td width=400px class="text">Uday Pratap Singh</td>
                            <td width=150px class="text-muted">@uday 5min</td>
                            <td width=150px></td>
                            <td width=150px></td>
                            <td width=150px>
                                <a href="#"><small>Grails</small></a></td>
                        </tr>
                        <tr>
                            <td colspan="5" height=100px>A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs.</td>
                        </tr>
                        <tr>

                            <td>Links</td>
                            <td><a href="#"><small><u>Downloads</u></small></a></td>
                            <td width=250px><a href="#"><small><u>View Full Site</u></small></a></td>
                            <td width=250px><a href="#"><small><u>Mark as read</u></small></a></td>
                            <td><a href="#"><small><u>View Post</u></small></a></td>
                        </tr>
                    </table>
                </div>
            </div>


            %{--Share link--}%

           <div class="modal fade" id="invite" role="dialog">
               <div class="modal-dialog">
                   <div class="modal-content">
                       <div class="modal-header">
                           <button type="button" class="close" data-dismiss="modal">&times;</button>
                           <h4 class="modal-title">Send Invite To</h4>
                       </div>
                       <div class="modal-body">
                           <g:form controller="Topics" action="addTopics" class="topicForm">
                               Email *:
                               <input class="form-control" type="text" name="topicName"/>
                               Topics *:
                               <select class="form-control" name="selection">
                                   <option>Option-1</option>
                                   <option>Option-2</option>
                               </select>
                               <input type="submit" class="btn btn-success" style="float: right; margin-top: 5px;"/>
                           </g:form>
                       </div>
                       <div class="modal-footer" style=" margin-top: 15px;">
                           <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                       </div>
                   </div>
               </div>
           </div>

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
                            <input type="text" class="form-control" id="linkres" placeholder="Link" name="linkres">
                            <br>
                            Description *:
                            <textarea class="form-control" id="selectlink" name="selectlink"></textarea>
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
                            <g:uploadForm  class="form-horizontal" controller="Document" action="save" name="documentcreate" enctype="multipart/form-data">>
                                Document *:
                                <input type="file" class="form-control" id="doc" placeholder="choose" name="document">
                                <br>
                                Description *:
                                <textarea class="form-control" id="select" name="select"></textarea>
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