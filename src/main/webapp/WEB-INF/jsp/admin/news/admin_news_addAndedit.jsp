<%@page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="../../newshead.jsp">
        <jsp:param value="新闻信息" name="title"/>
    </jsp:include>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/res/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/res/ueditor/ueditor.all.min.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/res/ueditor/lang/zh-cn/zh-cn.js"></script>

    <script type="text/javascript">
        //实例化编辑器
        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
        var ue = UE.getEditor('editor');
        $(document).ready(function () {
            <%--var value ='${newsinf.contect}';--%>
            ue.ready(function () {//编辑器初始化完成再赋值
                ue.setContent($('#contect_hid').html(), false);
            });
        });

        function addDo(id) {
            var AjaxURL = "${pageContext.request.contextPath}/admin/news/";
            if (id != null) {
                AjaxURL += "edit_do";
            } else {
                AjaxURL += "add_do";
            }
            var contect = UE.getEditor('editor').getContent()
            var dataParam = $("#myform").serializeArray();
            dataParam.push({"name": "contect", "value": contect});
            $.ajax({
                type: 'post',
                url: AjaxURL,
                data: dataParam,
                cache: false,
                success: function (data) {
                    alert("请求成功");
                }
            });
        }

        function getFileUrl(sourceId) {
            var url;
            if (navigator.userAgent.indexOf("MSIE") >= 1) { // IE
                url = document.getElementById(sourceId).value;
            } else if (navigator.userAgent.indexOf("Firefox") > 0) { // Firefox
                url = window.URL.createObjectURL(document.getElementById(sourceId).files.item(0));
            } else if (navigator.userAgent.indexOf("Chrome") > 0) { // Chrome
                url = window.URL.createObjectURL(document.getElementById(sourceId).files.item(0));
            }
            return url;
        }

        function preImg(sourceId, targetId) {
            var url = getFileUrl(sourceId);
            var imgPre = $("#" + targetId);
            imgPre.removeClass("hidden").addClass("show");
            imgPre.attr('src', url);
        }

        function to_change(type) {
            var div_update_img1 = $("#div_update_img1");
            var div_update_img2 = $("#div_update_img2");
            var div_update_img3 = $("#div_update_img3");
            switch (type) {
                case 3:
                    div_update_img1.removeClass("show").addClass("hidden");
                    div_update_img2.removeClass("show").addClass("hidden");
                    div_update_img3.removeClass("show").addClass("hidden");
                    break;
                case 1:
                    div_update_img1.removeClass("hidden").addClass("show");
                    div_update_img2.removeClass("show").addClass("hidden");
                    div_update_img3.removeClass("show").addClass("hidden");
                    break;
                case 2:
                    div_update_img1.removeClass("hidden").addClass("show");
                    div_update_img2.removeClass("hidden").addClass("show");
                    div_update_img3.removeClass("hidden").addClass("show");
                    break;
            }
        }

    </script>
    <style>
        .file-div1 {
            float: left;
            height: 41px;
            background: #f5696c;
            width: 144px;
            position: relative;
        }

        .file-div2 {
            text-align: center;
            padding-top: 12px;
            font-size: 15px;
            font-weight: 800
        }

        .file-inputstyle {
            width: 144px;
            height: 41px;
            cursor: pointer;
            font-size: 30px;
            outline: medium none;
            position: absolute;
            filter: alpha(opacity=0);
            -moz-opacity: 0;
            opacity: 0;
            left: 0px;
            top: 0px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <jsp:include page="../../admin/adminnav.jsp">
        <jsp:param value="newslist" name="fun"/>
    </jsp:include>
</div>
<div class="container-fluid" style="margin-top: 100px;margin-bottom: 15px">
    <form id="myform">
        <div class="row">
            <div class="col-md-5 col-md-offset-1">
                <input type="text"
                       maxlength="20" name="title"
                       class="form-control" value="${ newsinf.title}"
                       placeholder="标题(5到30个字符)" required style="font-size: x-large;height: 55px;">
                <script id="editor" type="text/plain"
                style="height:660px;width: 100%"></script>
                <div class="row" style="margin-top: 30px;">
                    <div class="col-md-5">
                        <button class="btn btn-success"
                                style="width: 100%;"
                                onclick="addDo(${newsinf.id})">提交
                        </button>
                    </div>
                    <div class="col-md-5  col-md-offset-2">
                        <button class="btn btn-default"
                                style="width: 100%;"
                                onClick="javascript :history.back(-1);">返回
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <div class="input-group">
                    <span class="input-group-addon">摘要</span>
                    <textarea maxlength="300" rows="10" name="digest"
                              class="form-control" placeholder="请输入摘要">${newsinf.digest}</textarea>
                </div>
                <div class="input-group" style="margin-top: 30px">
                    <span class="input-group-addon">分类</span> <select
                        class="form-control" name="sort">
                    <c:if test="${sortlist ne null}">
                        <c:forEach items="${sortlist}" var="sort" varStatus="vs">
                            <c:if test="${sort.id==1 }">
                                <option value="${sort.id}" selected="selected">${sort.sortname}</option>
                            </c:if>
                            <c:if test="${sort.id!=1 }">
                                <option value="${sort.id}">${sort.sortname}</option>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </select>
                </div>
                <div class="input-group" style="margin-top: 30px">
                    <span class="input-group-addon">来源</span> <input type="text"
                                                                     maxlength="50" name="fromto"
                                                                     value="${newsinf.fromto }"
                                                                     class="form-control"
                                                                     placeholder="请输入新闻来源">

                </div>
                <div style="margin-top: 15px;font-size: 16px;margin-left: 15px;">
                    <label class="radio-inline">
                        <input type="radio" value="1" name="cover" onclick="to_change(1)">单图
                    </label>
                    <label class="radio-inline" style="margin-left: 30px;">
                        <input type="radio" value="2" name="cover" onclick="to_change(2)">三图
                    </label>
                    <label class="radio-inline" style="margin-left: 30px;">
                        <input type="radio" value="3" name="cover" onclick="to_change(3)">无图
                    </label>
                </div>
                <div class="row" style="margin-top: 15px;">
                    <div class="col-md-4 hidden" id="div_update_img1">
                        <div class="file-div1">
                            <div class="file-div2">上传图片</div>
                            <input type="file" class="file-inputstyle" name="imgFile" id="input_photo1"
                                   onchange="preImg(this.id,'photo1');"/>
                            <br/>
                            <img id="photo1" src="" width="200px" height="200px" class="hidden"/>
                        </div>
                    </div>
                    <div class="col-md-4 hidden" id="div_update_img2">
                        <div class="file-div1">
                            <div class="file-div2">上传图片</div>
                            <input type="file" class="file-inputstyle" name="imgFile" id="input_photo2"
                                   onchange="preImg(this.id,'photo2');"/>
                            <br/>
                            <img id="photo2" src="" width="200px" height="200px" class="hidden"/>
                        </div>
                    </div>
                    <div class="col-md-4 hidden" id="div_update_img3">
                        <div class="file-div1">
                            <div class="file-div2">上传图片</div>
                            <input type="file" class="file-inputstyle" name="imgFile" id="input_photo3"
                                   onchange="preImg(this.id,'photo3');"/>
                            <br/>
                            <img id="photo3" src="" width="200px" height="200px" class="hidden"/>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </form>
    <div id="contect_hid" style="display:none;">${newsinf.contect}</div>
</div>

</body>

</html>