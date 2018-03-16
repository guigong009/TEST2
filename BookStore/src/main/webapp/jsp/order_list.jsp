<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>我的订单</title>
		<link type="text/css" rel="stylesheet" href="${base }/dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="${base }/css/index.css" />
		<link rel="stylesheet" type="text/css" href="${base }/css/animate.css" />
		<link rel="stylesheet" type="text/css" href="${base }/css/bootstrap-datetimepicker.min.css"/>
		<link rel="stylesheet" type="text/css" href="${base }/css/order_list.css"/>
	</head>

	<body>
		  <%@include file="/jsp/head.jsp" %>

		<!--订单begin-->
		<!--外层div-->
		<div class="container">
			<!--左边-->
			<div class="container pull-left">
				<ol class="breadcrumb">
					<li>
						<a href="#" class="text-success"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;我的订单</a>
					</li>
				</ol>

				<!--订单查询导航 begin-->
				<div>
					<nav class="navbar navbar-default" role="navigation">
						<div class="navbar-header">
							<a class="navbar-brand" href="#">所有订单</a>
						</div>

						<form class="navbar-form navbar-left" role="search">
							<input type="text" class="form-control" id="inp" placeholder="输入订单号进行查询">
							<button type="button" class="btn btn-search" onclick="searchOrder()">
			                  	<span class="text-success">Search</span>&nbsp;&nbsp;<span class="glyphicon glyphicon-search"></span>
			            	</button>
						</form>

						<ul class="nav navbar-nav navbar-left">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									交易状态
									<b class="caret"></b>
								</a>
								<ul class="dropdown-menu">
									<li>
										<a href="#">全部</a>
									</li>
									<li class="divider"></li>
									<li>
										<a href="#">已付款</a>
									</li>
									<li class="divider"></li>
									<li>
										<a href="#">未付款</a>
									</li>
									<li class="divider"></li>
									<li>
										<a href="#">交易成功</a>
									</li>
									<li class="divider"></li>
								</ul>
							</li>
						</ul>
						<ul class="nav navbar-nav navbar-left">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									订单排序
									<b class="caret"></b>
								</a>
								<ul class="dropdown-menu">
									<li>
										<a href="#">订单日期降序</a>
									</li>
									<li class="divider"></li>
									<li>
										<a href="#">订单日期升序</a>
									</li>
									<li class="divider"></li>
								</ul>
							</li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li style="padding-right: 15px;">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">更多筛选条件</a>
							</li>
						</ul>
						
						<ul class="nav navbar-nav">
							<li>
								<a href="#">删除订单</a>
							</li>
						</ul>
							<ul class="nav navbar-nav">
							<li>
								<a href="#">清空订单列表</a>
							</li>
						</ul>
					</nav>
				</div>
				
				<!--订单查询导航 end-->
				<!--日期控件-->
				<div id="collapseTwo" class="panel-collapse collapse">
					<div class="panel-body">
						<div class="form-group">	
							<div>
								<form class="form-horizontal">
							  		<div class="form-group has-feedback">
							  			<div class="col-md-offset-1 col-md-1" style="padding-top:5px ;">
							  				成交时间:
							  			</div>
										<div class="col-md-3">
											<input type="text" class="form-control" id="datetimepicker" placeholder="开始时间">
											<span class="glyphicon glyphicon-time form-control-feedback"></span>
										</div>
										<div class="col-md-1" style="padding-top:5px ;text-align:center;">
							  				至
							  			</div>
										<div class="col-md-3">
											<input type="text" class="form-control" id="datetimepicker2" placeholder="结束日期">
											<span class="glyphicon glyphicon-time form-control-feedback"></span>
										</div>
										<div class="col-md-3">
											<button type="button" class="btn btn-default" onclick="findOrder()">查询&nbsp;&nbsp;<span class="glyphicon glyphicon-search"></button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!--日期控件-->
			    
				<!--内容展示 begin-->
				<c:forEach items="${bean.pageDatas }" var="b1"> 
				<div class="table-responsive">
				  <table class="table table-hover table-striped">
				    <caption class="text-info">
				    	<div class="col-md-4" style="padding-left: 0px;">
				    		<input type="checkbox" name="cks">&nbsp;<fmt:formatDate value="${b1.createDate }" pattern="yyyy-MM-dd"/> 订单号:${b1.orderNum } 单
				    	</div>
				    	<div class="col-md-offset-5 col-sm-offset-7 col-md-1 col-sm-1" style="text-align: right;">
				    		<a href="${base }/order/deleteOrder?oid=${b1.orderId}" class="text-danger" title="删除订单"><span class="glyphicon glyphicon-trash"></span></a>
				    	</div>
				    	<div class="col-md-2" style="text-align: right;">
				    		<a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">订单详情</a>
				    	</div>
				    </caption>
				    <thead>
				    	<tr id="collapseThree" class="panel-collapse collapse">
					      	<td colspan="9">
							<div class="panel-body">
								<!--tab选项卡 begin-->
								<ul id="myTab" class="nav nav-tabs">
									<li class="active">
										<a href="#home" data-toggle="tab">
											联系人信息
										</a>
									</li>
									<li>
										<a href="#ios" data-toggle="tab">订单信息</a>
									</li>
								</ul>
								<div id="myTabContent" class="tab-content">
									<div class="tab-pane fade in active" id="home">
										<div class="row">
											<div>
												<ul class="nav navbar-collapse" style="line-height: 3;">
													<li class="text-info"><span class="text-success">姓名:</span><span class="text-info">${user.userName}</span></li>
													<li class="text-info"><span class="text-success">联系方式:</span>${user.phone }</li>
													<li class="text-info"><span class="text-success">收货地址:</span>${b1.address.detailaddress }</li>
												</ul>
											</div>
										</div>
										</p>
									</div>
									<div class="tab-pane fade" id="ios">
										<div class="row">
											<div>
												<ul class="nav navbar-collapse" style="line-height: 3;">
													<li class="text-info"><span class="text-success">订单编号:</span><span class="text-info">${b1.orderNum }</span></li>
													<li class="text-info"><span class="text-success">交易时间:</span><fmt:formatDate value="${b1.createDate }" pattern="yyyy-MM-dd"/></li>
													<li class="text-info"><span class="text-success">订单总金额:</span>${b1.total }元</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<!--tab选项卡 end-->	
							</td>
				      	</tr>
					    <tr class="active">
					    	<th>序号</th>
					        <th>图片</th>
					        <th>图片名称</th>
					        <th>单价(元)</th>
					        <th>数量</th>
					        <th>实付款(元)</th>
					        <th>付款日期</th>
					        <th>交易状态</th>
					    </tr>
				    </thead>
				    <tbody>
				      <c:forEach items="${b1.items }" var="b2" varStatus="vs"> 
				      <tr class="warning">
				      	<td>${vs.count }</td>
				        <td><img src="${base }/${b2.book_url}"></td>
				        <td>${b2.book_name}</td>
				        <td>${b2.unit_price }</td>
				        <td>${b2.count }</td>
				        <td>${b2.allPrice }</td>
				        <td><fmt:formatDate value="${b1.createDate }" pattern="yyyy-MM-dd"/></td>
				        <td>${b1.orderStatus }</td>
				      </tr>
				      </c:forEach>
				    </tbody>
				  </table>
				  
				</c:forEach>    
				<!--内容展示end-->
			</div>
			<!--分页begin-->
			<div class="container">
				<div class="row text-center">
					<div class="col-md-12">
						<ul class="pagination">
							<li><a href="${base }/order/show?pageNow=1">首页</a></li>
						      
						        <!-- 判断当前页是否是首页 -->
			              <c:if test="${bean.pageNow==1 }"> 
				              <li class="disabled">
				                <a href="javascript:void(0)" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
				             </li>
				         </c:if>
				         
				          <c:if test="${bean.pageNow!=1 }"> 
				           <li>
				              <a href="${base}/order/show?pageNow=${bean.pageNow-1}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
				           </li>
				          </c:if>
				          
				          <c:forEach begin="${bean.pageNow-5>0?bean.pageNow-5:1 }" end="${bean.pageNow+4>bean.pageNow?bean.totalPages:bean.pageNow+3 }" var="n">
				             <!--判断是否为当前页  -->
				            <c:if test="${bean.pageNow==n }">
				                 <li class="active"><a href="javascript:void(0)">${n }</a></li>
				            </c:if>
				            <c:if test="${bean.pageNow!=n }">
				                 <li><a href="${base}/order/show?pageNow=${n}">${n }</a></li>
				            </c:if>
				         </c:forEach>
				         
				         <!--判断是否是最后一页  -->
				          <c:if test="${bean.pageNow==bean.totalPages }">
				               <li class="disabled">
					               <a href="javascript:void(0)" aria-label="Next">
						       <span aria-hidden="true">&raquo;</span>
					               </a>
				              </li>
				          </c:if>
				          
				          <c:if test="${bean.pageNow!=bean.totalPages }">
				            <li>
					            <a href="${base}/order/show?pageNow=${bean.pageNow+1}" aria-label="Next">
						          <span aria-hidden="true">&raquo;</span>
					           </a>
				           </li>
				         </c:if>
						      
						    <li><a href="${base }/order/show?pageNow=${bean.totalPages}" style="border: 1px solid #ddd;">尾页</a></li>
						    <li><a style="border: 0px;margin-left: 0px;">当前页${bean.pageNow }/${bean.totalPages }总页</a></li>
						    <li>
						     	
						     	<div id="search" class="input-group" style="positon:relative;">
									<input type="text" class="form-control" id="page" placeholder="跳转指定页" />
									<span class="input-group-btn">  
							            <button class="btn btn-info btn-search" onclick="getvalue()">GO</button>
									</span>
								</div>
						   </li>
						    <li><a style="padding-top: 0px;border: 0px;">
						     	<label>每页显示:</label>
						     	<select id="pageSize" class="form-control" onchange="setPage()" style="width: 100px;display: inline;">
						     		<option value="2">2</option>
						     		<option value="2">4</option>
						     		<option value="2">6</option>
						     		<option value="2">8</option>
						     	</select>
						     	<label>条</label>
						     </a>
						   </li>
					    </ul>
					</div>
				</div>
			</div>
			<!--分页end-->
		</div>
		<div class="container">
		<hr>
			<!--首页底部信息 begin-->
			<div class="container">
				<div class="row">
					<div class="col-md-offset-2 col-md-8">
						<div class="row">
							<div class="col-md-offset-2 col-md-2">
								<img src="${base }/images/logo.png">
							</div>
							<div class="col-md-6">
								<div class="row">
									<div class="col-md-offset-2 col-md-10">
										<a href="http://www.sztzedu.com">威思登软件科技有限公司&copy;所有</a>
									</div>
								</div>
								<div class="gap"></div>
								<div class="row">
									<div class="col-md-offset-2 col-md-10">
										<span class="text-info">天智教育&reg; |&nbsp;</span>
										<span class="text-info">项目实训管理平台 |&nbsp;</span>
										<span class="text-info">2012－2020 </span>
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
		<script src="${base }/dist/js/bootstrap.min.js"></script>
		<script src="${base }/js/moment.js" type="text/javascript" charset="utf-8"></script>
		<script src="${base }/js/bootstrap-datetimepicker.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$('#datetimepicker').datetimepicker();
			$('#datetimepicker2').datetimepicker();
			
			function getvalue(){
				 var pages=document.getElementById("page").value;
				 window.location.href="/BookStore/order/change?pages="+pages;
			}
			
			function setPage(){
				var size=document.getElementById("pageSize");
				var ops=size.options;
				for(var i=0;i<ops.length;i++){
				if(ops[i].selected==true){
				window.location.href="/BookStore/order/setSize?s="+ops[i].text;
				}
			 }
		  }
			
		 function searchOrder(){
			  var value=document.getElementById("inp").value;
			  window.location.href="/BookStore/order/search?ordNum="+value;
		 }
		 
		 function findOrder(){
			 var start=document.getElementById("datetimepicker").value;
			 var end=document.getElementById("datetimepicker2").value;
			 window.location.href="/BookStore/order/forDate?startdate="+start+"&enddate="+end;
		 }
		</script>
	</body>
</html>