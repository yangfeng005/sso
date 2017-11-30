<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1">
    <title>国资帐号登录</title>

    <link rel="icon" type="image/x-icon" href="<%=basePath%>res/img/favicon-gznb.ico?v1.0.0.0.0.0">

    <link rel="stylesheet" type="text/css" href="<%=basePath%>res/css/style.css?v1.0.0.0.0.0">
    <script type="text/javascript" src="<%=basePath%>res/js/jquery-3.1.1.min.js?v1.0.0.0.0.0"></script>
    <script type="text/javascript" src="<%=basePath%>res/js/common.js?v1.0.0.0.0.0"></script>
</head>
<body>
<div class="main">
    <div class="form login">


        <div class="form-item text-center">
            <img src="<%=basePath%>res/img/logo.png?_t=0.0.0.3" class="logo">
        </div>
        <form:form  method="post" id="fm1" cssClass="fm-v clearfix"
                    commandName="${commandName}" htmlEscape="true">
            <div class="form-item" prop="username">
                <label for="username">用户名</label>
                <input type="text"  class="j-user" name="username" id="username" value="${userName}" placeholder="用户名/手机号">
            </div>

            <div class="form-item" prop="password">
                <label for="password">密码</label>
                <input type="password" class="j-pass" name="password" id="password" placeholder="请输入密码">
            </div>

            <div class="form-item" prop="authCode">
            </div>

            <div class="form-item error">
                <img src="<%=basePath%>res/img/error.svg" class="sso-icon" alt="error">
                <span class="error-content"></span>
            </div>

            <div class="form-item">
                <input class="form-btn btn-main" name="submit" value="登录" tabindex="3" type="submit" onclick="return login();"/>
            </div>
            <div>
                <input type="hidden" name="lt" id="lt" value="${loginTicket}"/>
                <input type="hidden" name="execution" id="execution" value="${flowExecutionKey}"/>
                <input type="hidden" name="_eventId" id="_eventId" value="submit"/>
            </div>
        </form:form>

    </div>
    <div class="footer" style="color:#fff">
        云南省国有资本运营商城管理有限公司©COPYRIGHT 2017 滇ICP备15003101号-6
    </div>
</div>
<script type="text/javascript">
    $('body').ready(function () {

        setWrapperPos();

        $(window).on('resize',function(){
            setWrapperPos();
        });

    });
    function login(){
        var userName = $.trim($(".j-user").val());
        var pass = $(".j-pass").val();
        if(userName == "") {
            setErrorTips( "username",'请输入用户名');
            return false;
        }

        if(pass == "") {
            setErrorTips( "password",'请输入密码');
            return false;
        }
        return true;
    }
</script>
</body>
</html>