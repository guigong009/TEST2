<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--导航部分  begin-->
		<div class="container" style="margin-top: 5px;">
			<nav class="navbar navbar-default well-sm" style="padding-left: 0px;" role="navigation">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-collapse">
				            <span class="sr-only">切换导航</span>
				            <span class="icon-bar"></span>
				            <span class="icon-bar"></span>
				            <span class="icon-bar"></span>
        				</button>
						<a class="navbar-brand" href="#">在线书城</a>
					</div>
					<div class="collapse navbar-collapse" id="example-navbar-collapse">
						<ul class="nav navbar-nav pull-left">
							<li class="active">
								<a href="${base }/jsp/index.jsp">首页</a>
							</li>
					
							<li>
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown">
										图书类型
										<b class="caret"></b>
									</a>
									 
									  <ul id="menuId" class="dropdown-menu">
										 <c:forEach items="${caList }" var="item"> 
										<li>
											<a href="${base }/book/list?cateid=${item.cateid }&pageNow=1">${item.catename }</a>
										</li>
										<li class="divider"></li>
										</c:forEach>
									</ul>  
									 
								</li>
							</li>
							<c:if test="${empty user }"> 
							<li>
								<a href="#" data-toggle="modal" data-target="#myModal">登录</a>
							</li>
							</c:if>
							<c:if test="${not empty user }"> 
							<li>
								<a href="#" data-toggle="modal" data-target="#myModal">${user.userName }</a>
							</li>
							</c:if>
							<li>
								<a href="${base }/user/logout">安全退出</a>
							</li>
							<li>
								<a href="#" data-toggle="modal" data-target="#register"><span class="glyphicon glyphicon-user"></span>注册</a>
							</li>
							<li>
								<a href="${base }/check/checkOrder"><span class="glyphicon glyphicon-th-list"></span>我的订单</a>
							</li>
							<li>
								<a href="${base }/check/checkCart"><span class="glyphicon glyphicon-shopping-cart"> </span>我的购物车</a>${msg }${ms }${m }
							</li>
						</ul>
						<div class="input-group col-md-3 pull-right" style="positon:relative;padding: 7px;">
							<input type="text" class="form-control" placeholder="请输入图书名" />
							<span class="input-group-btn">  
					            <button class="btn btn-info btn-search">
					            	<span class="glyphicon glyphicon-search"></span>
					            </button>
							</span>
						</div>
					</div>
				</div>
			</nav>
		</div>
		<!--导航部分 end-->

		<!--最顶端轮播图片 begin-->
		<div id="gcarouse" class="container">
			<!--轮播-->
			<div id="myCarousel" class="carousel slide">
				<!-- 轮播（Carousel）指标 -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
				<!-- 轮播（Carousel）项目 -->
				<div class="carousel-inner">
					<div class="item active">
						<a href="details.html"><img src="${base }/images/book1_nav.jpg" class="pull-left" alt="First slide"></a>
						<a href="details.html"><img src="${base }/images/book2_nav.jpg" class="pull-left" alt="First slide"></a>
						<a href="details.html"><img src="${base }/images/book3_nav.jpg" alt="Third slide"></a>
					</div>
					<div class="item">
						<a href="details.html"><img src="${base }/images/book4_nav.jpg" class="pull-left" alt="First slide"></a>
						<a href="details.html"><img src="${base }/images/book5_nav.jpg" class="pull-left" alt="First slide"></a>
						<a href="details.html"><img src="${base }/images/book6_nav.jpg" alt="Third slide"></a>
					</div>
					<div class="item">
						<a href="details.html"><img src="${base }/images/book7_nav.jpg" class="pull-left" alt="First slide"></a>
						<a href="details.html"><img src="${base }/images/book8_nav.jpg" class="pull-left" alt="First slide"></a>
						<a href="details.html"><img src="${base }/images/book9_nav.jpg" alt="Third slide"></a>
					</div>
				</div>

				<!-- 轮播（Carousel）导航 -->
				<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
				<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
			</div>
		</div>
		<!--最顶端轮播图片 end-->
</script>