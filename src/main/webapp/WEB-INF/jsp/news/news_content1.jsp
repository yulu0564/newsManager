<%@page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <jsp:include page="../newshead.jsp">
        <jsp:param value="新闻-详情" name="title"/>
    </jsp:include>
    <link href="${pageContext.request.contextPath}/res/css/news_details.css?v=20161231204509"
          rel="stylesheet" type="text/css">
</head>
<body style=" margin:0">
<div style="margin-top: 50px;width: 100%;">
    <div
            style=" border-bottom-color: #EEEEEE;border-top-color:#FF0000;border-width:2px 0 2px 0;border-style:solid;width: 100%">
        <table class="s_hd">
            <tbody>
            <tr>
                <td style="margin:0;padding:0;">
                    <!--<img class="s_logo" src="http://mat1.gtimg.com/news/news2017/img/logo.png" border="0"/>-->
                    <span class="s_nav">
                    <a
                            <c:if test="${param.type==null}">class="switch_lanmu" </c:if>
                            href="${pageContext.request.contextPath}/news/news_list">首页</a>
                        <c:if test="${sortlist ne null}">
                            <c:forEach items="${sortlist}" var="sort" varStatus="vs">
							<a
                                    <c:if test="${sort.id==param.type}">class="switch_lanmu" </c:if>
                                    href="${pageContext.request.contextPath}/news/news_list?type=${sort.id}">${sort.sortname}</a>
                            </c:forEach>
                        </c:if>
                </span>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<div style="margin-bottom: 50px">
    <table class="s_hd">
        <tbody>
        <tr>
            <td style="margin:0;padding:0;">
                <div class="left_recommend">
                    <ul style="position: relative">
                        <li class="ul_li">
                            <a href="/71476.html">
                                <img style="height: 75px;"
                                     src="http://img.yisanban.com/article/2017/10/20171031093542-16880-100x75.jpg">
                                <div class="fr">
                                    <p class="recommend_tille">新三板10983家公司资产负债率2年下降15个百分点</p>
                                    <p class="recommend_time">6小时前</p>
                                </div>
                            </a>
                        </li>
                        <li class="ul_li">
                            <a href="/71476.html">
                                <img style="height: 75px;"
                                     src="http://img.yisanban.com/article/2017/10/20171031093542-16880-100x75.jpg">
                                <div class="fr">
                                    <p class="recommend_tille">新三板10983家公司资产负债率2年下降15个百分点</p>
                                    <p class="recommend_time">6小时前</p>
                                </div>
                            </a>
                        </li>
                        <li class="ul_li">
                            <a href="/71476.html">
                                <img style="height: 75px;"
                                     src="http://img.yisanban.com/article/2017/10/20171031093542-16880-100x75.jpg">
                                <div class="fr">
                                    <p class="recommend_tille">新三板10983家公司资产负债率2年下降15个百分点</p>
                                    <p class="recommend_time">6小时前</p>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="center_details">
                    <h2 style="text-align:center;">
                        ${newsinf.title}
                    </h2>
                    <div style="font-size: smaller;">
                        ${newsinf.fromto}
                        <cite style="margin-left: 8px;color: #999999">${newsinf.time}</cite>
                        <span class="a_ilike">
                            <a href="javascript:void(0)" class="collect"><img src="img/star_good.png"
                                                                              style="height: 15px;margin: 5px 5px 5px 0;float: left"/>收藏</a>
                            <a href="javascript:void(0)" class="comment"><em>${total}</em>评论</a>
                     </span>
                    </div>
                    <div style="margin-top: 30px">
                        ${newsinf.contect}
                    </div>
                    <div>
                        <em style="font-size: xx-large;margin-top: 20px;">网友评论</em>
                    </div>
                    <div class="box-textarea-block">
                        <span class="box-loginBtn">登录</span>
                        <textarea class="box-textarea" id="J_Textarea" placeholder="说两句吧..."></textarea>
                    </div>
                    <div class="comment-title"><p>全部评论</p></div>
                    <div>
                        <c:if test="${commentslist ne null}">
                            <c:forEach items="${commentslist}" var="commentslist"
                                       varStatus="vs">
                                <div class="comment-details">
                                    <div class="common-avatar">
                                        <img class="heard_img"
                                             alt="暂无头像"
                                             src="${commentslist.user.head_image}"/>
                                    </div>
                                    <div>
                                        <div class="comment-content">
                                            <span class="comment-username"> ${commentslist.user.nickname}</span>
                                            <span class="comment-time">${commentslist.time}</span>
                                            <p>
                                                    ${commentslist.contects}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                        <c:if test="${total>2}">
                        <div class="comment-moreBtn">查看更多评论</div>
                        </c:if>
                    </div>
                </div>
                <div class="right_recommend">
                    <ul style="position: relative">
                        <li class="ul_li">
                            <a href="/71476.html">
                                <img style="height: 75px;"
                                     src="http://img.yisanban.com/article/2017/10/20171031093542-16880-100x75.jpg">
                                <div class="fr">
                                    <p class="recommend_tille">${newsinf.title}</p>
                                    <p class="recommend_time">${newsinf.time}</p>
                                </div>
                            </a>
                        </li>
                        <li class="ul_li">
                            <a href="/71476.html">
                                <img style="height: 75px;"
                                     src="http://img.yisanban.com/article/2017/10/20171031093542-16880-100x75.jpg">
                                <div class="fr">
                                    <p class="recommend_tille">新三板10983家公司资产负债率2年下降15个百分点</p>
                                    <p class="recommend_time">6小时前</p>
                                </div>
                            </a>
                        </li>
                        <li class="ul_li">
                            <a href="/71476.html">
                                <img style="height: 75px;"
                                     src="http://img.yisanban.com/article/2017/10/20171031093542-16880-100x75.jpg">
                                <div class="fr">
                                    <p class="recommend_tille">新三板10983家公司资产负债率2年下降15个百分点</p>
                                    <p class="recommend_time">6小时前</p>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
</div>

</body>