<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>结算</title>
		<link type="text/css" rel="stylesheet" href="${base }/dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="${base }/css/index.css" />
		<link rel="stylesheet" type="text/css" href="${base }/css/cart.css" />
		<link rel="stylesheet" type="text/css" href="${base }/css/animate.css" />
	
		<style type="text/css">
			.form-control{
				width: 100%;
			}
		</style>
	</head>
	<body>
		  <%@include file="/jsp/head.jsp" %>
		
		<!--购物车 begin-->
		<!--外层div-->
		<div class="container">
			<!--左边-->
			<div class="col-md-8 col-sm-12">
				<ol class="breadcrumb">
					<li>
						<a href="#" class="text-success"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;送货地址</a>
					</li>
				</ol>
				
				<!--送货地址  begin-->
				<div style="margin-bottom: 5px;" id="addrDiv">
					<ul class="list-group" id="address">
					    <c:forEach items="${address }" var="item"> 
						     <li class="list-group-item"><input type="radio" name="addr" checked>&nbsp;${item.detailaddress } &nbsp;<span class="text-success">默认地址</span></li>
					    </c:forEach>
					</ul>
					<a href="#" class="text-info" onclick="dispalyMoreAddr(this)">更多地址↓&nbsp;&nbsp;</a>
					<a href="javascript:void(0)" id="addAddr" class="text-success" data-toggle="modal" data-target="#myModal">添加新地址</a>
				</div>
				<hr>
				
				
				<!--添加新地址模态框 begin-->
				<!-- 模态框（Modal） -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">
									<span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;添加新收货地址
								</h4>
							</div>
							<div class="modal-body">
							<!--登录的form表单-->
							<form action="${base }/order/addNew" class="form-horizontal" role="form" method="post">
								<div class="form-group">
									<label class="col-md-2 control-label" style="margin-right: 2.9%;">所在地区:</label>
										
									<div data-toggle="distpicker">
										<div class="form-group col-sm-12 col-md-3">
										  <label class="sr-only" for="province1">Province</label>
										  <select class="form-control" name="province" id="province1"></select>
										</div>
										<div class="form-group col-sm-12 col-md-3">
										  <label class="sr-only" for="city1">City</label>
										  <select class="form-control" name="city" id="city1"></select>
										</div>
										<div class="form-group col-sm-12 col-md-3">
										  <label class="sr-only" for="district1">District</label>
										  <select class="form-control" name="district" id="district1"></select>
										</div>
									 </div>
								</div>
								<div class="form-group has-feedback" style="clear:both">
									<label for="lastname" class="col-sm-2 control-label">详细地址:</label>
									<div class="col-sm-5">
										<textarea class="form-control" name="details" id="deatails"></textarea>
									</div>
									
								</div>
								<div class="form-group has-feedback">
									<label class="col-sm-2 control-label">邮政编码</label>
									<div class="col-md-5">
										<input type="text" class="form-control" name="email" id="lastname2" placeholder="邮政编码">
										<span class="glyphicon glyphicon-hand-left form-control-feedback"></span>
									</div>
								</div>
	
								<div class="form-group has-feedback">
									<label class="col-sm-2 control-label">姓名</label>
									<div class="col-sm-5">
										<input type="text" class="form-control" name="username" id="username" placeholder="收货人姓名">
										<span class="glyphicon glyphicon-user form-control-feedback"></span>
									</div>
								</div>

								<div class="form-group has-feedback">
									<label class="col-sm-2 control-label">电话</label>
									<div class="col-sm-5">
										<input type="tel" class="form-control" name="telephone" id="tel" placeholder="合法手机格式">
										<span class="glyphicon glyphicon-phone form-control-feedback"></span>
									</div>
								</div>
								
								<div class="form-group">
								    <div class="col-sm-offset-2 col-sm-10">
								      <div class="checkbox">
								        <label>
								          <input type="checkbox" name="check" value="1" id="setDefaultAddr"><span class="text-success">设置默认地址</span>
								        </label>
								      </div>
								    </div>
								</div>

								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
									<input type="submit" class="btn btn-primary" value="提交地址">
								</div>
							</form>
						<!--form结束-->
						</div>
					</div>
				<!-- /.modal-content -->
				</div>
			</div>
				<!--左边-->
				<ol class="breadcrumb">
					<li>
						<a href="#" class="text-success"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;结算清单</a>
					</li>
				</ol>

				<!--购物车表格 begin-->
				<div class="table-responsive" id="imgDiv">
					<table class="table table-hover table-striped" style="vertical-align:middle;">
						<thead>
							<tr class="text-success success">
								<th id="sequence">序号</th>
								<th>图片</th>
								<th>书名</th>
								<th>单价</th>
								<th>数量</th>
								<th>合计</th>
							</tr>
						</thead>
						<tbody id="tby">
						    <c:forEach items="${cart.items }" var="item" varStatus="vs"> 
							<tr>
								<td>${vs.count }</td>
								<td><img src="${base }/${item.book.imageurl}"></td>
								<td>${item.book.name }</td>
								<td>${item.book.newPrice }元</td>
								<td>${item.count }</td>
								<td>${item.subtotal }$</td>
							</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="4"></td>
								<td class="text-success">总价:</td>
								<td class="text-success">${cart.total }$:</td>
							</tr>
							<tr style="background-color: white;">
								<td>
									<a href="${base }/jsp/index.jsp" class="btn btn-info">&lt;&lt;继续购买</a>
								</td>
								<td colspan="4"></td>
								<td>
									<a href="${base }/order/commit?pageNow=1" class="btn btn-warning">提交订单</a>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
				<!--购物车 end-->

				<!--删除提示模态框 begin-->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<!--如果没有选中任何一个商品的时候,出现-->
					<div id="first_del" style="display: none;">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<h4 class="modal-title text-warning" id="myModalLabel">抱歉!请您先选择商品!</h4>
								</div>
								<div class="modal-body">请选进行勾选!再执行删除删除!</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
					</div>
					<!--first_del  end-->

					<!--如果没有选中了一个商品的时候,出现-->
					<div id="two_del" style="display: none;">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<h4 class="modal-title text-warning" id="myModalLabel">删除商品,慎重操作!</h4>
								</div>
								<div class="modal-body">此操作一旦进行,数据将不可恢复!</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
									<button type="button" class="btn btn-danger" onclick="delRows(this)">确定删除</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
					</div>
					<!--two_del  end-->
				</div>
				<!--删除提示模态框 end-->
			</div>

			<!--右边-->
			<div class="col-md-4 col-sm-3 col-xs-8">
				<ol class="breadcrumb">
					<li>
						<a href="#" class="text-success"><span class="glyphicon glyphicon-shopping-cart "></span>我的购物车</a>
					</li>
					<li>
						<a href="# ">3个商品</a>
					</li>
					<li>
						<a href="# ">总价${cart.total }元</a>
					</li>
				</ol>

			<!--猜您喜欢-->
				<div>
					<span class="text-info"><span class="glyphicon glyphicon-heart"></span><span style="font-size: 20px; ">&nbsp;&nbsp;猜您喜欢</span></span>
					<div class="row" id="love">
						<div class="wow fadeInRight animated">
							<div class="thumbnail">
								<a href="details.html"><img src="${base }/images/book5_nav.jpg " style="height: 200px; " alt="通用的占位符缩略图 ">
								<div class="caption ">
									<h3>似水流年</h3>
								</div>
							</div>
						</div>
						<div class="wow fadeInRight animated">
							<div class="thumbnail ">
								<a href="details.html"><img src="${base }/images/book6_nav.jpg " style="height: 200px; " alt="通用的占位符缩略图 "></a>
								<div class="caption ">
									<h3>水墨艺术</h3>
								</div>
							</div>
						</div>
						<div class="wow fadeInRight animated">
							<div class="thumbnail ">
								<a href="details.html"><img src="${base }/images/book7_nav.jpg" style="height: 200px; " alt="通用的占位符缩略图 "></a>
								<div class="caption ">
									<h3>二月枫叶</h3>
								</div>
							</div>
						</div>
						<div>
							<ul class="pager">
								<li>
									<a href="#" onclick="pageUp() ">&larr;上一页</a>
									<a href="#" onclick="pageDown() ">下一页 &rarr;</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!--喜欢end-->
			</div>
		</div>

		<div class="container">
			<!--首页底部信息 begin-->
			<div class="container ">
				<div class="row ">
					<div class="col-md-offset-2 col-md-8">
						<div class="row ">
							<div class="col-md-offset-2 col-md-2">
								<img src="${base }/images/logo.png ">
							</div>
							<div class="col-md-6">
								<div class="row">
									<div class="col-md-offset-2 col-md-10 ">
										<a href="http://www.sztzedu.com ">威思登软件科技有限公司&copy;所有</a>
									</div>
								</div>
								<div class="gap"></div>
								<div class="row">
									<div class="col-md-offset-2 col-md-10 ">
										<span class="text-info ">天智教育&reg; |&nbsp;</span>
										<span class="text-info ">项目实训管理平台 |&nbsp;</span>
										<span class="text-info ">2012－2020 </span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--end-->
		<%@ include file="/jsp/loginAndRegister.jsp" %>
		<script src="${base }/dist/js/jquery.min.js"></script>
		<script src="${base }/js/wow.js"></script>
		<script src="${base }/js/carousel.js" type="text/javascript"></script>
		<script src="${base }/dist/js/bootstrap.min.js"></script>
		<script src="${base }/dist/js/distpicker.data.min.js"></script>
		<script src="${base }/dist/js/distpicker.min.js"></script>
		<script src="${base }/js/details.js" type="text/javascript" charset="utf-8"></script>
		<script src="${base }/js/cart.js" type="text/javascript" charset="utf-8"></script>
		<script src="${base }/js/confirm_order.js"></script>
		<script type="text/javascript">
			if(!(/msie [6|7|8|9]/i.test(navigator.userAgent))) {
				new WOW().init();
			};
		</script>
	</body>
</html>
