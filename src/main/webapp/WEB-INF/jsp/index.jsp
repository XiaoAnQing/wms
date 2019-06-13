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
      <h1>
        Blank page
        <small>it all starts here</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Examples</a></li>
        <li class="active">Blank page</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Title</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse">
              <i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="" data-original-title="Remove">
              <i class="fa fa-times"></i></button>
          </div>
        </div>
        <div class="box-body">
          Start creating your amazing application!
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          Footer
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
        $('.sidebar-menu').tree()
      });
    </script>
  </body>
</html>