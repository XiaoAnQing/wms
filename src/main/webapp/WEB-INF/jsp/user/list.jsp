<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>工作空间</title>
<jsp:include page="/WEB-INF/jsp/common/basic.jsp"></jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/style/css/skins/_all-skins.min.css">

<!-- 引用table插件 -->
<script
	src="${pageContext.request.contextPath}/static/plugin/table/bootstrap-table.js"></script>
<script
	src="${pageContext.request.contextPath}/static/plugin/table/bootstrap-table-zh-CN.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/plugin/table/bootstrap-table.css">
</head>


<body class="sidebar-mini skin-red-light"
	style="height: auto; min-height: 100%;">
	<div class="wrapper" style="height: auto; min-height: 100%;">

		<!-- 头部 -->
		<jsp:include page="/WEB-INF/jsp/common/top.jsp"></jsp:include>

		<!-- 左边 -->
		<jsp:include page="/WEB-INF/jsp/common/left.jsp"></jsp:include>

		<!-- 内容区域 -->
		<div class="content-wrapper" style="min-height: 1126px;">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>用户管理</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Examples</a></li>
					<li class="active">Blank page</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">

				<!-- Default box -->
				<div class="box box-success">
					<div class="box-header with-border">

						<div class="row ">
							<form id="searchForm" action="" onsubmit="return false;">
								<div class="col-xs-2">
									<select class="form-control" name="key" id="query_key">
										<option value="loginName">登录名</option>
										<option value="name">名称</option>
									</select>
								</div>
								<div class="col-xs-2">
									<input type="text" id="query_value" name="value"
										class="form-control" placeholder="关键字">
								</div>
								<div class="col-xs-2">
									<button type="submit" class="btn bg-olive btn-flat">查询</button>
								</div>
							</form>
						</div>

						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool"
								data-widget="collapse" data-toggle="tooltip" title=""
								data-original-title="Collapse">
								<i class="fa fa-minus"></i>
							</button>
							<button type="button" class="btn btn-box-tool"
								data-widget="remove" data-toggle="tooltip" title=""
								data-original-title="Remove">
								<i class="fa fa-times"></i>
							</button>
						</div>
					</div>
					<div class="box-body" style="padding-top: 0px;">
						<div id="toolbar">
							<a href="${pageContext.request.contextPath}/users/new"
								type="button" class="btn bg-maroon btn-flat">添加</a>
							<button type="button" data-ope="delete"
								class="btn bg-olive btn-flat">删除</button>
							<button type="button" data-ope="edit"
								class="btn bg-orange btn-flat">编辑</button>
						</div>
						<table id="user_table"></table>
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
	<script
		src="${pageContext.request.contextPath}/static/plugin/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script
		src="${pageContext.request.contextPath}/static/plugin/fastclick/fastclick.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script
		src="${pageContext.request.contextPath}/static/style/js/demo.js"></script>
	<script>
		$(function() {
			$('.sidebar-menu').tree();

			//监听searchForm提交事件jquery
			$("#searchForm").on("submit",function(){
				var queryType = $("#query_key").val();
	        	var queryValue = $("#query_value").val();
				
				console.log(queryType);
				
				var param = {};
				param[queryType] = queryValue;
				$table.bootstrapTable('refresh',{query:param});  //param是一个json对象
				return false;//表单不要提交
			});
			               
			//查看table的文档
			var queryUrl = '${pageContext.request.contextPath}/users'; //请求数据的地址
			$table = $('#user_table').bootstrapTable({
				url : queryUrl, //请求后台的URL（*）
				method : 'GET', //请求方式（*）
				toolbar : '#toolbar', //工具按钮用哪个容器
				striped : true, //是否显示行间隔色
				cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
				pagination : true, //是否显示分页（*）
				sortable : true, //是否启用排序
				sortOrder : "asc", //排序方式

				sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*）

				pageNumber : 1, //初始化加载第一页，默认第一页,并记录
				pageSize : 10, //每页的记录行数（*）
				pageList : [ 10, 25, 50, 100 ], //可供选择的每页的行数（*）

				clickToSelect : true, //是否启用点击选中行
				uniqueId : "id", //每一行的唯一标识，一般为主键列

				columns : [ {
					checkbox : true,
					visible : true
				//是否显示复选框  
				}, {
					field : 'name',
					title : '名称'
				}, {
					field : 'loginName',
					title : '登录名'
				} ],

				queryParams : function(params) {
					var temp = {
						pageNum : params.offset / params.limit + 1,
						pageSize : params.limit
					};
					return temp;
				}

			});

			//监听按钮点击事件
			$("#toolbar > button")
					.on(
							"click",
							function() {

								var $it = $(this);
								var type = $it.data("ope");
								if ("edit" == type) {
									//编辑
									var idArray = $table
											.bootstrapTable('getAllSelections');
									if (idArray.length == 0) {
										alert("请选择一条用户记录");
										return;
									} else if (idArray.length > 1) {
										alert("只能选择一条用户记录");
										return;
									}

									//$.map(需要遍历的集合,function(item){
									//return item;
									//})

									idArray = $.map(idArray, function(item) {
										return item.id;
									});

									//跳转到编辑界面 idArray[0]
									window.location.href = "${pageContext.request.contextPath}/users/edit/"
											+ idArray[0];
								} else {
									//删除
									var idArray = $table
											.bootstrapTable('getAllSelections');
									if (idArray.length == 0) {
										alert("至少选择一条用户记录");
										return;
									}
									//id集合
									idArray = $.map(idArray, function(item) {
										return item.id;
									});

									//id数组
									/* window.location.href="${pageContext.request.contextPath}/users/delete/"; */
									//ajax请求
									$
											.ajax({
												url : "${pageContext.request.contextPath}/users/delete/"
														+ idArray,
												type : "POST",
												success : window.location.href = "${pageContext.request.contextPath}/users/list"

											});
								}
							});

			/*   <div id="toolbar">
			<a href="${pageContext.request.contextPath}/users/new" type="button" class="btn bg-maroon btn-flat">添加</a>
			<button type="button" data-ope="delete" class="btn bg-olive btn-flat">删除</button>
			<button type="button" data-ope="edit" class="btn bg-orange btn-flat">编辑</button>
			</div> */

		});
	</script>
</body>
</html>