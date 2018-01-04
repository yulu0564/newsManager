<%@page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="modal-container-181250" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">登录</h4>
            </div>
            <form role="form" method="post" id="login">
                <div class="modal-body">
                    <div style="width: 400px; margin-left: 90px">
                        <div class="input-group">
                            <span class="input-group-addon">昵称</span> <input type="text"
                                                                             name="username" class="form-control" placeholder="请输入用户名"
                                                                             data-toggle="tooltip" data-placement="right" title="请输入用户名">
                        </div>
                    </div>
                    <div style="width: 400px; margin-left: 90px">
                        <div class="input-group" style="margin-top: 20px">
                            <span class="input-group-addon">密码</span> <input type="password"
                                                                             name="password" class="form-control" placeholder="请输入密码"
                                                                             data-toggle="tooltip" data-placement="right" title="请输入密码">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success"
                            style="width: 400px; margin-right: 80px" onclick="login()">
                        <B> 登录 </B>
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal"
                            style="width: 400px; margin-right: 80px; margin-top: 20px;">取消</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>

    function  login(){
        var AjaxURL= "${pageContext.request.contextPath}/user/userLogin";
        var dataParam = $("#login").serializeArray();
        $.ajax({
            type:'post',
            data:dataParam,
            url:AjaxURL,
            dataType: 'json',
            cache:false,
            success:function(data){
                if(data["code"]==0){
                    alert("登录成功");
                    window.location.reload();
                }else{
                    alert(data["msg"]);
//                    $("#modal-container-181251").modal("hide");
                }
            }
        });
    }

</script>