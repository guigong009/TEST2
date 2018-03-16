<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>图书详情</title>
		<link type="text/css" rel="stylesheet" href="${base }/dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="${base }/css/index.css" />
		<link rel="stylesheet" type="text/css" href="${base }/css/animate.css" />
	</head>

	<body>
		  <%@include file="/jsp/head.jsp" %>
		 
		<!--外层div-->
		<div class="container">
			<!--左边-->
			<div class="container pull-left" style="width: 63%">
				<ol class="breadcrumb">
					<li>
						<a href="#">图书详情</a>
					</li>
					<li>
						<a href="#">似水流年</a>
					</li>
				</ol>

				<div class="row">
					<div class="col-sm-12 col-md-6">
						<div class="thumbnail">
							<img src="${base }/${book.imageurl}" style="height: 200px;" alt="通用的占位符缩略图">
							<div class="caption">
								<h3>${book.name }</h3>
								<p>双十一特价,包邮哟!亲<img src="${base }/images/3.gif" style="width: 24px;height: 24px;"></p>
								<p>
									<div style="margin-bottom: 5px;width: 100px;">
										<input type="number" class="form-control" name="count" id="count" placeholder="购买数量" min="1" max="100" >
									</div>
									 
									<div style="clear: both;">
										<!--<input type="number" class="form-control" placeholder="请输入" min="1" max="100" onclick="selectByCount(this)">-->
										<a href="confirm_order.html" class="btn btn-default" role="button">
											<span class="glyphicon glyphicon-usd"></span> 立即购买
										</a>
									
										<a href="javascript:selectCount()" class="btn btn-default" role="button" >
											<span class="glyphicon glyphicon-shopping-cart"></span> 加入购物车
										</a>
									</div>
								</p>
							</div>
						</div>
					</div>

					<div class="col-sm-12 col-md-6">
						<div class="thumbnail">
							<ul class="list-group">
								<li class="list-group-item"><span class="text-success">图书名称:${book.name }</span></li>
								<li class="list-group-item"><span class="text-info">作者:</span>${book.author }</li>
								<li class="list-group-item"><span class="text-info">出版日期:<fmt:formatDate value="${book.publishDate }" pattern="yyyy-MM-dd" /></span></li>
								<li class="list-group-item"><span class="text-info">出版社:</span>${book.publishHouse }</li>
								<li class="list-group-item"><span class="text-info" style="text-decoration: line-through;">原价:</span><span style="text-decoration: line-through;">$${book.oldPrice }元</span></li>
								<li class="list-group-item"><span class="text-info">现价:</span>$${book.newPrice }元</li>
								<li class="list-group-item"><span class="text-info">说明:</span>${book.info }
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!--<hr>-->
				<!--折叠部分 begin-->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
							展开详细信息
						</a>
						</h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse">
						<div class="panel-body">
							<!--tab选项卡 begin-->
							<ul id="myTab" class="nav nav-tabs">
								<li class="active">
									<a href="#home" data-toggle="tab">
										商品详情
									</a>
								</li>
								<li>
									<a href="#ios" data-toggle="tab"> <span class="badge pull-right">50</span>累计评价</a>
								</li>
							</ul>
							<div id="myTabContent" class="tab-content">
								<div class="tab-pane fade in active" id="home">
									<p>
										<em>产品参数：</em>
									</p>
									<div class="row">
										<div class="col-sm-12 col-md-6">
											<ul class="nav navbar-collapse" style="line-height: 3";>
												<li class="text-info">产品名称：${book.name }</li>
												<li class="text-info">是否是套装: ${book.suit }</li>
												<li class="text-info">书名:${book.name }</li>
												<li class="text-info">定价:${book.newPrice }元</li>
												<li class="text-info">出版社名称: ${book.publishHouse }</li>
												<li class="text-info">出版时间: <fmt:formatDate value="${book.publishDate }" pattern="yyyy-MM" /></li>
												<li class="text-info">作者: ${book.author }</li>
												<li class="text-info">作者地区: ${book.authorLoc }</li>
												<li class="text-info">书名: ${book.name }</li>
												<li class="text-info">ISBN编号:${book.isbn }</li>
											</ul>
										</div>
										<span class="visible-sm visible-xs"><hr></span>
										<div class="col-sm-12 col-md-6">
											<ul class="nav navbar-collapse" style="line-height: 3;">
												<li class="text-info">产品名称：${book.name }</li>
												<li class="text-info">是否是套装: ${book.suit }</li>
												<li class="text-info">书名:${book.name }</li>
												<li class="text-info">定价: ${book.newPrice }元</li>
												<li class="text-info">出版社名称: ${book.publishHouse }</li>
												<li class="text-info">出版时间: <fmt:formatDate value="${book.publishDate }" pattern="yyyy-MM" /></li>
												<li class="text-info">作者: ${book.author }</li>
												<li class="text-info">作者地区:  ${book.authorLoc }</li>
												<li class="text-info">书名: ${book.name }</li>
												<li class="text-info">ISBN编号: ${book.isbn }</li>
											</ul>
										</div>
									</div>
									</p>
								</div>
								<div class="tab-pane fade" id="ios">
									<p>
										<ul class="list-group">
											<li class="list-group-item"><span class="text-info">小明:</span><span class="text-success ">这真的是一本好书<img src="${base }/images/emotions/1.gif "></span></li>
											<li class="list-group-item"><span class="text-info">success:</span><span class="text-danger ">书的质量很差<img src="${base }/images/emotions/2.gif "></span></li>
											<li class="list-group-item"><span class="text-info">叶老师:</span><span class="text-success ">很值得初学者学习<img src="${base }/images/emotions/13.gif "></span></li>
											<li class="list-group-item"><span class="text-info">amdin:</span><span class="text-danger ">被坑大发了.<img src="${base }/images/emotions/17.gif "></span></li>
											<li class="list-group-item"><span class="text-info">rose:</span><span class="text-danger ">卖家态度恶劣.<img src="${base }/images/emotions/11.gif "></span></li>
										</ul>
									</p>
									<p>
										<ul class="pager">
									        <a href="# ">&larr;上一页</a>
											<a href="# ">下一页 &rarr;</a>
										</ul>
									</p>
								</div>
							</div>
							<!--tab选项卡 end-->
						</div>
					</div>
				</div>
				<!--折叠部分end-->
			</div>

			<!--右边-->
			<div class="container pull-right " style="width: 37%;">
				<ol class="breadcrumb ">
					<li>
						<a href="# " class="text-success "><span class="glyphicon glyphicon-shopping-cart "></span>我的购物车</a>
					</li>
					<li>
						<a href="# ">3个商品</a>
					</li>
					<li>
						<a href="# ">总价100元</a>
					</li>
				</ol>

				<!--猜您喜欢-->
				<div>
					<span class="text-info"><span class="glyphicon glyphicon-heart"></span><span style="font-size: 20px; ">猜您喜欢</span></span>
					<div class="row" id="love">
					    <c:forEach items="${bean.pageDatas }" var="item"> 
						<div class="col-sm-12 col-md-12 wow fadeInRight animated">
							<div class="thumbnail">
								<a href="${base }/book/preShow?bid=${param.bid}&id=${item.bookid}&pageNow=1"><img src="${base }/${item.imageurl } " style="height: 200px; " alt="通用的占位符缩略图 "></a>
								<div class="caption ">
									<h3>${item.name }</h3>
								</div>
							</div>
						</div>
						</c:forEach>
						<div>
							<ul class="pager ">
								<li>
									<!-- <a href="# " onclick="pageUp() ">&larr;上一页</a>
									<a href="# " onclick="pageDown() ">下一页 &rarr;</a> -->
									<!-- 判断当前页是否是首页 -->
			              <c:if test="${bean.pageNow==1 }"> 
				              <li class="disabled">
				                <a href="javascript:void(0)" aria-label="Previous"><span aria-hidden="true">&larr;上一页</span></a>
				             </li>
				         </c:if>
				         
				          <c:if test="${bean.pageNow!=1 }"> 
				           <li>
				              <a href="${base}/book/preShow?bid=${param.bid }&id=${param.id }&pageNow=${bean.pageNow-1}" aria-label="Previous"><span aria-hidden="true">&larr;上一页</span></a>
				           </li>
				          </c:if>
				          
				         <!--判断是否是最后一页  -->
				          <c:if test="${bean.pageNow==bean.totalPages }">
				               <li class="disabled">
					               <a href="javascript:void(0)" aria-label="Next">
						       <span aria-hidden="true">下一页 &rarr;</span>
					               </a>
				              </li>
				          </c:if>
				          
				          <c:if test="${bean.pageNow!=bean.totalPages }">
				            <li>
					            <a href="${base}/book/preShow?bid=${param.bid }&id=${param.id }&pageNow=${bean.pageNow+1}" aria-label="Next">
						          <span aria-hidden="true">下一页 &rarr;</span>
					           </a>
				           </li>
				         </c:if> 
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="container">
			<!--首页底部信息 begin-->
			<div class="container ">
				<div class="row ">
					<div class="col-md-offset-2 col-md-8 ">
						<div class="row ">
							<div class="col-md-offset-2 col-md-2 ">
								<img src="${base }/images/logo.png ">
							</div>
							<div class="col-md-6 ">
								<div class="row ">
									<div class="col-md-offset-2 col-md-10 ">
										<a href="http://www.sztzedu.com ">威思登软件科技有限公司&copy;所有</a>
									</div>
								</div>
								<div class="gap "></div>
								<div class="row ">
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
        <%@ include file="/jsp/loginAndRegister.jsp" %>
         
		<script src="${base }/dist/js/jquery.min.js"></script>
		<script src="${base }/js/wow.js"></script>
		<script src="${base }/js/carousel.js" type="text/javascript"></script>
		<script src="${base }/dist/js/bootstrap.min.js"></script>
		<script src="${base }/js/details.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			if(!(/msie [6|7|8|9]/i.test(navigator.userAgent))) {
				new WOW().init();
			};
			    
                function selectCount(){
                	
                	window.location.href="${base}/cart/add?bookid=${book.bookid}&count="+count.value+"&pageNow=1";
                }
		</script>
	</body>
</html>