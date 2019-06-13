<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>欢迎登录</title>
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugin/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugin/font-awesome/css/font-awesome.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/style/css/AdminLTE.min.css">
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/static/plugin/respond/html5shiv.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/plugin/respond/respond.min.js"></script>
    <![endif]-->
    <!-- iCheck -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugin/iCheck/square/blue.css">
  </head>


  <body class="hold-transition login-page">
    <div class="login-box">
      <div class="login-logo">
        <a href="../../index2.html"><b>Admin</b>LTE</a>
      </div>
      <div class="login-box-body">
        <p class="login-box-msg">${errorMsg}</p>
    
        <form action="${pageContext.request.contextPath}/login" method="post">
          <div class="form-group has-feedback">
            <input type="text" name="loginName" class="form-control" placeholder="账号"/>
            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="password" name="password" class="form-control" placeholder="密码"/>
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="row">
            <div class="col-xs-8">
              <div class="checkbox icheck">
                <label>
                  <input id="autoLogin" name="autoLogin" value="1" type="checkbox"> 自动登录
                </label>
              </div>
            </div>
            <div class="col-xs-4">
              <input type="submit" class="btn btn-primary btn-block btn-flat" value="登录"/>
            </div>
          </div>
        </form>
      </div>
    </div>
    <!-- jQuery 3 -->
    <script src="${pageContext.request.contextPath}/static/plugin/jquery/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="${pageContext.request.contextPath}/static/plugin/bootstrap/dist/js/bootstrap.min.js"></script>
    
    <!-- iCheck -->
    <script src="${pageContext.request.contextPath}/static/plugin/iCheck/icheck.min.js"></script>
    <script>
      $(function () {
    	  $('#autoLogin').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' /* optional */
          });
      });
    </script>
  </body>
</html>