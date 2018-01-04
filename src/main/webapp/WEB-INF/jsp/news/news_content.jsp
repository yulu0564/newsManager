<%@page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid" style="margin: 0 auto">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <div class="row">
                <div class="container-fluid">
                    <div class="row" style="width: 100%">
                        <div class="col-md-8" style="margin: 0 auto">
                            <h2>${newsinf.title }</h2>
                            <div>
                                <c:if test="${collects==null}">
                                    <button type="button" class="btn btn-sm btn-warning pull-right"
                                            onclick="collect(this)">
                                        收藏
                                    </button>
                                </c:if>
                                <c:if test="${collects!=null}">
                                    <button type="button" class="btn btn-sm btn-warning pull-right"
                                            onclick="delete_do(this)">
                                        取消收藏
                                    </button>
                                </c:if>
                            </div>
                            <p>
                                <small>${newsinf.fromuser}<cite
                                        style="margin-left: 10px">${newsinf.time}</cite><br>${newsinf.fromto}
                                </small>
                            </p>
                            ${newsinf.contect}
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 80px">
                <div class="col-md-12">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#">全部评论</a></li>
                    </ul>
                    <div class="media" id="commentslist_id">

                        <c:if test="${commentslist ne null}">
                            <c:forEach items="${commentslist}" var="commentslist"
                                       varStatus="vs">
                                <div style="margin-top: 30px">
                                    <a href="#" class="pull-left"><img
                                            alt="暂无头像"
                                            src="${pageContext.request.contextPath}/res/images/head.jpg"
                                            class="media-object" style="height: 30px"/></a>
                                    <div class="media-body">
                                        <h4 style="margin-left: 30px"
                                            class="media-heading">${commentslist.user.username}</h4>
                                            ${commentslist.contects}
                                        <p style="position: absolute; right: 10px">
                                            <small><cite>--${commentslist.time}</cite></small>
                                        </p>
                                    </div>
                                    <div style="width:800px; border:1px solid black;"></div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>
            <c:if test="${userid==null}">
                <center>
                    <h3>登录后才能评论</h3>
                    <button id="modal-181250" href="#modal-container-181250"
                            class="btn btn-success" data-toggle="modal">登录
                    </button>
                    <button id="modal-181251" href="#modal-container-181251"
                            class="btn btn-default" data-toggle="modal">注册
                    </button>
                </center>
            </c:if>
            <c:if test="${userid!=null}">
                <form id="add_comments" method="post">
                    <input type="hidden" name="userid" value="${userid }"> <input
                        type="hidden" name="newsid" value="${newsinf.id }">
                    <textarea rows="6" class="col-md-12" style="margin-top: 80px"
                              maxlength="100" name="contects"></textarea>
                    <button type="buttom" style="margin-top: 10px; width: 100px"
                            class="btn btn-primary pull-right" onclick="add_comments()">发表评论
                    </button>
                </form>
            </c:if>
        </div>
        <div class="col-md-1"></div>
    </div>
</div>

<script>
    function collect(obj) {
        if ("${newsinf.id}" != "") {
            var AjaxURL = "${pageContext.request.contextPath}/collect/collect?newsid=${newsinf.id}";
            var objFu = $(obj).parent();
            $.ajax({
                type: 'get',
                url: AjaxURL,
                cache: false,
                dataType: 'json',
                success: function (data) {
                    if (data["code"] == 0) {
                        alert(data["msg"]);
                        objFu.empty();
                        objFu.append($("<button type=\"button\" class=\"btn btn-sm btn-warning pull-right\" onclick=\"delete_do(this)\">\n" +
                            "                                    取消收藏\n" +
                            "                                </button>"));
                    }
                }
            });
        } else {
            alert("请先登录");
        }
    }

    function delete_do(obj) {
        var AjaxURL = "${pageContext.request.contextPath}/collect/delete_do?id=${collects.id}&userid=${userid}";
        var objFu = $(obj).parent();
        $.ajax({
            type: 'get',
            url: AjaxURL,
            cache: false,
            dataType: 'json',
            success: function (data) {
                if (data["code"] == 0) {
                    alert(data["msg"]);
                    objFu.empty();
                    objFu.append($(" <button type=\"button\" class=\"btn btn-sm btn-warning pull-right\"\n" +
                        "                                            onclick=\"collect(this)\">\n" +
                        "                                        收藏\n" +
                        "                                    </button>"));
                }
            }
        });
    }

    function add_comments() {
        var obj = $("#commentslist_id");
        var AjaxURL = "${pageContext.request.contextPath}/comment/add_comments";
        var dataParam = $("#add_comments").serializeArray();
        $.ajax({
            type: 'post',
            url: AjaxURL,
            cache: false,
            data: dataParam,
            dataType: 'json',
            success: function (data) {
                if (data["code"] == 0) {
                    alert(data["msg"]);
                    var comment = data["data"];
                    var appendValue = "<div style=\"margin-top: 30px\">\n" +
                        "                                    <a href=\"#\" class=\"pull-left\"><img\n" +
                        "                                            alt=\"暂无头像\"\n" +
                        "                                            src=\"${pageContext.request.contextPath}/res/images/head.jpg\"\n" +
                        "                                            class=\"media-object\" style=\"height: 30px\"/></a>\n" +
                        "                                    <div class=\"media-body\" >\n" +
                        "                                        <h4 style=\"margin-left: 30px\"class=\"media-heading\">";
                    appendValue += comment["user"]["username"];
                    appendValue += "</h4>";
                    appendValue += comment["contects"];
                    appendValue += " <p style=\"position: absolute; right: 10px\">\n" +
                        "                                            <small><cite>--";
                    appendValue += comment["time"];
                    appendValue += "</cite></small>\n" +
                        "                                        </p>\n" +
                        "                                    </div>\n" +
                        "                                    <div style=\"width:800px; border:1px solid black;\"></div>\n" +
                        "                                </div>";
                    obj.append($(appendValue));
                }
            }
        });
    }

</script>