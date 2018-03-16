<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>我的购物车</title>
		<link type="text/css" rel="stylesheet" href="${base }/dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="${base }/css/index.css" />
		<link rel="stylesheet" type="text/css" href="${base }/css/cart.css" />
		<link rel="stylesheet" type="text/css" href="${base }/css/animate.css" />
	</head>

	<body onload="changeNum()">
		 
		<%@include file="/jsp/head.jsp" %>
		<!--购物车 begin-->
		<!--外层div-->
		<div class="container">
			<!--左边-->
			<div class="container pull-left" style="width: 63%">
				<!--左边-->
				<ol class="breadcrumb">
					<li>
						<a href="#" class="text-success"><span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;我的宝贝</a>
					</li>
				</ol>

				<!--购物车表格 begin-->
				<div class="table-responsive" id="imgDiv">
					<table class="table table-hover table-striped" style="vertical-align:middle;">
						<thead>
							<tr>
								<td colspan="8">
									<label class="text-primary">显示条数:</label>
									<select id="cartSzie" class="form-control" style="display: inline" onchange="displaySize()">
										<option value="2">2</option>
										<option value="4">4</option>
										<option value="6" selected>6</option>
										<option value="8">8</option>
									</select>
								</td>
							</tr>
							<tr class="text-success success">
								<th><input type="checkbox" id="selectAll" onclick="selectAll(this)"></th>
								<th id="sequence">序号</th>
								<th>图片</th>
								<th>书名</th>
								<th>单价</th>
								<th>数量</th>
								<th>合计</th>
							</tr>
						</thead>
						<tbody id="tby" >
						    <c:forEach items="${cart.items }" var="item" varStatus="vs"> 
							<tr>
								<td><input type="checkbox" id="ck" name="cks" value="${item.book.bookid }"></td>
								<td>${vs.count }</td>
								<td><img src="${base }/${item.book.imageurl}"></td>
								<td>${item.book.name }</td>
								<td>${item.book.newPrice }元</td>
								<td>${item.count }</td>
								<td>$${item.subtotal }</td>
							</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="5"></td>
								<td class="text-success">总价:</td>
								<td class="text-success">$${cart.total }</td>
							</tr>
							<tr style="background-color: white;">
								<td>
									<a href="${base }/jsp/index.jsp" class="btn btn-info">&lt;&lt;继续购买</a>
								</td>
								<td><button class="btn btn-danger" data-toggle="modal" data-target="#myModal" onclick="del()">删除商品</button></td>
								<td colspan="4"></td>
								<td>
									<a href="javascript:account()" class="btn btn-warning">结算商品</a>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
				<!--购物车 end-->

				<!--删除提示模态框 begin-->
				  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<!-- 如果没有选中任何一个商品的时候,出现 -->
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
					<!-- first_del  end -->

					<!-- 如果没有选中了一个商品的时候,出现 -->
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
					<!-- two_del  end -->
				</div>  
				<!--删除提示模态框 end-->
			</div>

			<!--右边-->
			<div class="container pull-right " style="width: 37%; ">
				<ol class="breadcrumb ">
					<li>
						<a href="# " class="text-success "><span class="glyphicon glyphicon-shopping-cart "></span>我的购物车</a>
					</li>
					<li>
						<a href="# ">3个商品</a>
					</li>
					<li>
						<a href="# ">总价$${cart.total }元</a>
					</li>
				</ol>

			<!--猜您喜欢-->
				<div>
					<span class="text-info"><span class="glyphicon glyphicon-heart"></span><span style="font-size: 20px; ">&nbsp;&nbsp;猜您喜欢</span></span>
					<div class="row" id="love">
						<div class="col-sm-12 col-md-12 wow fadeInRight animated">
							<div class="thumbnail">
								<a href="details.html"><img src="${base }/images/book5_nav.jpg " style="height: 200px; " alt="通用的占位符缩略图 "></a>
								<div class="caption ">
									<h3>似水流年</h3>
								</div>
							</div>
						</div>
						<div class="col-sm-12 col-md-12 wow fadeInRight animated">
							<div class="thumbnail ">
								<a href="details.html"><img src="${base }/images/book6_nav.jpg " style="height: 200px; " alt="通用的占位符缩略图 "></a>
								<div class="caption ">
									<h3>水墨艺术</h3>
								</div>
							</div>
						</div>
						<div class="col-sm-12 col-md-12 wow fadeInRight animated">
							<div class="thumbnail ">
								<a href="details.html"><img src="${base }/images/book7_nav.jpg" style="height: 200px; " alt="通用的占位符缩略图 "></a>
								<div class="caption ">
									<h3>二月枫叶</h3>
								</div>
							</div>
						</div>
						<div>
							<ul class="pager ">
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
		<!--引入js文件-->
		<script src="${base }/dist/js/jquery.min.js"></script>
		<script src="${base }/js/wow.js"></script>
		<script src="${base }/js/carousel.js" type="text/javascript"></script>
		<script src="${base }/dist/js/bootstrap.min.js"></script>
		<script src="${base }/js/details.js" type="text/javascript" charset="utf-8"></script>
		<script src="${base }/js/cart.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			if(!(/msie [6|7|8|9]/i.test(navigator.userAgent))) {
				new WOW().init();
			};
			  function del(){
				var cks = document.getElementsByName("cks");
				var opiContextStr="";
				for(var i = 0; i < cks.length; i++) {
					if(cks[i].checked) {
					   opiContextStr+=cks[i].value+",";
					}
				}
				var r=confirm("记录删除将不可恢复,确认删除记录吗???");
				if(r){
					window.location.href="/BookStore/cart/remove?str="+opiContextStr;
				}
			} 
			function displaySize(){
				 var size=document.getElementById("cartSzie");
				 var ops=size.options;
					for(var i=0;i<ops.length;i++){
					if(ops[i].selected==true){
					window.location.href="/BookStore/cart/chooseSize?s="+ops[i].text;
					}
				 }
			}
			
			function account(){
				var cks = document.getElementsByName("cks");
				var opiContextStr="";
				var cpiContextStr="";
				for(var i = 0; i < cks.length; i++) {
					if(cks[i].checked) {
					   opiContextStr+=cks[i].value+",";
					}
					cpiContextStr+=cks[i].value+",";
				}
				window.location.href="/BookStore/order/confirm?str="+opiContextStr+"&str2="+cpiContextStr;
			}
		</script>
	</body>

</html>