<!DOCTYPE html>
<html>
<head>
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
    <g:javascript>
    var url="${createLink(controller:'Resource_Rating',action:'save')}"
    </g:javascript>
    <style>
    /*body{*/
    /*    background: #5D5C61;*/
    /*}*/
    </style>
</head>
<body onload="Ratingsprint('${value}')">
<div class="container"><br>
    <div class="panel panel-default" style="height:70px">
        <div class="panel-body">
            <div class="container">
                <div class="col-md-6">
                    <h4 style="color: #a60000"><g:link controller="dashboard" action="index"><strong> <u><b>Link Sharing</b></u></strong></g:link></h4>
                </div>
                <div class="col-md-4">
                    <g:form controller="search" action="search">
                        <div class="input-group">
                            <input type="text" name="search" class="form-control" placeholder="Search" id="txtSearch"/>
                            <div class="input-group-btn">
                                <button class="btn btn-basic" type="submit">
                                    <span class="glyphicon glyphicon-search"></span>
                                </button>
                            </div>
                        </div>
                    </g:form>
                </div>



                <div class ="col-md-2">
                    ${session.name}

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
    <div class="container">
        <div class="row">
            <div class="col-md-7">


                <div class="panel panel-default">


                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-2">
                                <asset:image src="${resource.createdBy.photo}"  style="width:70px;height:70px"/></div>
                            <div class="col-md-6">
                                <div style="font-size:18px;"><b>${resource.createdBy.firstName}&nbsp${resource.createdBy.lastName}</b></div>
                                <div>@${resource.createdBy.username}</div></div>
                            <div class="col-md-4">
                                <g:link controller="topic" action="index" params="[id: resource.topics.id]">${resource.topics.name}</g:link><br>
                                ${resource.dateCreated}
                            </div></div>
                        <div class="row">
                            <div class="col-md-9">
                                ${resource.description}</div>
                            <div class="col-md-3">
                                <span id="1" onclick="Rating('${session.name}' , '${resource.id}' , '${1}')"class="glyphicon glyphicon-star"></span>
                                <span id="2" onclick="Rating('${session.name}' , '${resource.id}' , '${2}')"class="glyphicon glyphicon-star"></span>
                                <span id="3" onclick="Rating('${session.name}' , '${resource.id}' , '${3}')"class="glyphicon glyphicon-star"></span>
                                <span id="4" onclick="Rating('${session.name}' , '${resource.id}' , '${4}')"class="glyphicon glyphicon-star"></span>
                                <span id="5" onclick="Rating('${session.name}' , '${resource.id}' , '${5}')"class="glyphicon glyphicon-star"></span>
                            </div>
                        </div><br><br><br>
                        <p id="test"></p>


                    <div class="row">
                        <div class="col-md-4"></div>
                    <div class="col-md-2">
                        <g:if test="${resource.createdBy.username==session.name}">
                            <div class="col-md-4"><g:link controller="resource" action="delete" params="[id:resource.id]">Delete</g:link></div>
                            </div>
                            <div class="col-md-2">
%{--                                <a>Edit</a>--}%
                            </div></g:if>
                        <g:else>

%{--                            <g:link controller="resource" action="delete" params="[id: resource.id]">Delete</g:link>--}%
                            </div>
                            <div class="col-md-2">
%{--                                <a>Edit</a>--}%
                            </div>
                        </g:else>


                        <div class="col-md-2">
                            <g:if test="${resource instanceof link_sharing.Link_Resource}"><a>Download</a></g:if>
                            <g:else>
%{--                            <g:link controller="document" action="download">Download</g:link>--}%
                        <g:link controller="Document" action="download" params="[id:resource.id]">Download</g:link>
                            </g:else>
                                </div>

                        <div class="col-md-2">
%{--                            View full site inside a tag--}%
                            <a></a>   </div>
                    </div>

                </div>
            </div></div>

        <div class ="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading"><div style="float:left">Trending Topics</div><br>

                </div>
                <div class="panel-body">
                    <g:each in="${trending}" var="us" status="i">
                        <li>
                            <div class="row">
                                <div class="col-md-4">
                                    <asset:image src="${us.user.photo}"  style="width:70px;height:70px"/></div>
                                <div class="col-sm-8">
                                    <div style="font-size:23px;"><b>${us.name}</b></div>
                                    <div>@${us.user.username}</div>

                                    <div class="col-sm-6">
                                        Subscriptions:
                                        <div>${countforsubs.getAt(i)}</div></div>
                                    <div class="col-sm-6">

                                        Posts:
                                        <div><a>${countforposts.getAt(i)}</a></div></div>
                                </div>

                                <g:if test="${us.subscriptions.user.username.contains(session.name)}">
                                    <g:link controller="Subscription" action="unsubscribe" params="[id:us.id, page :'dashboard']">Unsubscribe</g:link><br>
                                </g:if>
                                <g:else>
                                    <g:link controller="Subscription" action="subscribe" params="[id:us.id, page:'dashboard']">Subscribe</g:link><br>
                                </g:else>



                        </li>
                    </g:each>

                </div>

            </div>
        </div>

    </div>



    <script>
        function Rating(username , resourceId , value)
        {

            for(var i=1;i<=5;i++)
            {
                document.getElementById(i).style.color="black";
            }

            for(var i=1;i<=value;i++)
            {
                document.getElementById(i).style.color="red";
            }

            %{--var url="${createLink(controller:'ResourceRating',action:'save')}"--}%

            $.ajax({
                "url":     url,
                "type":    "get",
                "data":    {username : username , resourceId : resourceId , value : value},
                success: function(resp){
                    document.getElementById("test").innerHTML=resp.success
                }
            });

        }
        function Ratingsprint(value)
        {
            for(var i=1;i<=5;i++)
            {
                document.getElementById(i).style.color="black";
            }

            for(var i=1;i<=value;i++)
            {
                document.getElementById(i).style.color="orange";
            }
        }
    </script>
</div>

</div>
</body>
</html>