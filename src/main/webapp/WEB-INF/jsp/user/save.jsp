<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>工作空间</title>
    <jsp:include page="/WEB-INF/jsp/common/basic.jsp"></jsp:include>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/style/css/skins/_all-skins.min.css">
  </head>


<body class="sidebar-mini skin-red-light" style="height: auto; min-height: 100%;">
  <div class="wrapper" style="height: auto; min-height: 100%;">
  
  <!-- 头部 -->
  <jsp:include page="/WEB-INF/jsp/common/top.jsp"></jsp:include>
  
  <!-- 左边 -->
  <jsp:include page="/WEB-INF/jsp/common/left.jsp"></jsp:include>
 
   <!-- 内容区域 -->
  <div class="content-wrapper" style="min-height: 1126px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>添加用户</h1>
    </section>
  
    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box box-success">
        <div class="box-body">
            <!-- 表单 -->
             <!-- form start -->
            <form id="user" class="form-horizontal" action="${pageContext.request.contextPath}/users" method="post">
              <div class="box-body">
                <div class="col-md-6">
                
                  <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">姓名</label>
                    <div class="col-sm-10">
                      <input id="name" name="name" class="form-control" data-bv-notempty="true" placeholder="姓名" type="text" value=""/>
                    </div>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="loginName" class="col-sm-2 control-label">登录名</label>
                    <div class="col-sm-10">
                      <input id="loginName" name="loginName" class="form-control" data-bv-notempty="true" placeholder="登录名" type="text" value=""/>
                    </div>
                  </div>   
                </div>
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                <button type="reset" class="btn btn-default btn-flat">重 置</button>
                <button type="submit" class="btn btn-success btn-flat">保 存</button>
              </div>
              <!-- /.box-footer -->
            </form>
            
            
            
        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  
   <!-- 底部 -->
   <jsp:include page="/WEB-INF/jsp/common/bottom.jsp"></jsp:include>
   
   <!-- 设置 -->
   <jsp:include page="/WEB-INF/jsp/common/setting.jsp"></jsp:include>
  </div>

    <!-- SlimScroll -->
    <script src="${pageContext.request.contextPath}/static/plugin/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="${pageContext.request.contextPath}/static/plugin/fastclick/fastclick.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="${pageContext.request.contextPath}/static/style/js/demo.js"></script>
    <script>
      $(function(){
        $('.sidebar-menu').tree();
      });
    </script>
  </body>
</html>