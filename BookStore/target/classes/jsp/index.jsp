<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head lang="en">
		<meta charset="UTF-8">
		<title>在线书城首页</title>
		<link type="text/css" rel="stylesheet" href="${base }/dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="${base }/css/index.css" />
		<link rel="stylesheet" type="text/css" href="${base }/css/animate.css" />
	</head>

	<body>
		 
        <!-- 静态包含 -->
        <%@include file="/jsp/head.jsp" %>
		
		<!--图书内容部分 begin-->
		<div class="container">
			<!--精选图书 begin-->
			<div>
				<div class="text-primary"><img src="${base }/images/bullet1.gif" alt="" title="">
					<a href="#">精选图书</a>
				</div>
				<div class="row">
				    <c:forEach items="${bean1.pageDatas }" var="b1"> 
					<div class="col-sm-6 col-md-3 wow fadeInLeft animated">
						<div class="thumbnail">
							<a href="${base }/book/preShow?bid=1&id=${b1.bookid}&pageNow=1"><img src="${base }/${b1.imageurl}" alt="通用的占位符缩略图"></a>
							<div class="caption">
								<h3>${b1.name }</h3>
								<p>价格:${b1.newPrice }元&nbsp;&nbsp;作者:${b1.author }&nbsp;&nbsp;</p>
								<p>
									<a href="${base }/book/preShow?bid=1&id=${b1.bookid}&pageNow=1">
										更多信息
									</a>
								</p>
							</div>
						</div>
					</div>
                   </c:forEach>
                   <div style="clear:both"></div>
					<!--分页-->
					<div class="container">
						<ul class="pager">
						<!-- 判断当前页是否是首页 -->
			              <c:if test="${bean1.pageNow==1 }"> 
				              <li class="disabled">
				                <a href="javascript:void(0)" aria-label="Previous"><span aria-hidden="true">&larr;上一页</span></a>
				             </li>
				         </c:if>
				         
				          <c:if test="${bean1.pageNow!=1 }"> 
				           <li>
				              <a href="${base}/page/book1?pageNow=${bean1.pageNow-1}" aria-label="Previous"><span aria-hidden="true">&larr;上一页</span></a>
				           </li>
				          </c:if>
				          
				         <!--判断是否是最后一页  -->
				          <c:if test="${bean1.pageNow==bean1.totalPages }">
				               <li class="disabled">
					               <a href="javascript:void(0)" aria-label="Next">
						       <span aria-hidden="true">下一页 &rarr;</span>
					               </a>
				              </li>
				          </c:if>
				          
				          <c:if test="${bean1.pageNow!=bean1.totalPages }">
				            <li>
					            <a href="${base}/page/book1?pageNow=${bean1.pageNow+1}" aria-label="Next">
						          <span aria-hidden="true">下一页 &rarr;</span>
					           </a>
				           </li>
				         </c:if> 
						</ul>
					</div>
				</div>
			</div>
			<!--精选图书 end-->

			<!--推荐图书 begin-->
			<div>
				<div class="text-primary"><img src="${base }/images/bullet1.gif" alt="" title="">
					<a href="#">推荐图书</a>
				</div>
				<div class="row">
				     <c:forEach items="${bean2.pageDatas }" var="b2"> 
					<div class="col-sm-6 col-md-3 wow fadeInLeft animated">
						<div class="thumbnail">
							<a href="${base }/book/preShow?bid=2&id=${b2.bookid}&pageNow=1"><img src="${base }/${b2.imageurl}" alt="通用的占位符缩略图"></a>
							<div class="caption">
								<h3>${b2.name }</h3>
								<p>价格:${b2.newPrice }元&nbsp;&nbsp;作者:${b2.author }&nbsp;&nbsp;</p>
								<p>
									<a href="${base }/book/preShow?bid=2&id=${b2.bookid}&pageNow=1">
										更多信息
									</a>
								</p>
							</div>
						</div>
					</div>
                   </c:forEach>
                   <div style="clear:both"></div>
					<!--分页-->
					<div class="container">
						<ul class="pager">
							<!-- 判断当前页是否是首页 -->
			              <c:if test="${bean2.pageNow==1 }"> 
				              <li class="disabled">
				                <a href="javascript:void(0)" aria-label="Previous"><span aria-hidden="true">&larr;上一页</span></a>
				             </li>
				         </c:if>
				         
				          <c:if test="${bean2.pageNow!=1 }"> 
				           <li>
				              <a href="${base}/page/book2?pageNow=${bean2.pageNow-1}" aria-label="Previous"><span aria-hidden="true">&larr;上一页</span></a>
				           </li>
				          </c:if>
				          
				         <!--判断是否是最后一页  -->
				          <c:if test="${bean2.pageNow==bean2.totalPages }">
				               <li class="disabled">
					               <a href="javascript:void(0)" aria-label="Next">
						       <span aria-hidden="true">下一页 &rarr;</span>
					               </a>
				              </li>
				          </c:if>
				          
				          <c:if test="${bean2.pageNow!=bean2.totalPages }">
				            <li>
					            <a href="${base}/page/book2?pageNow=${bean2.pageNow+1}" aria-label="Next">
						          <span aria-hidden="true">下一页 &rarr;</span>
					           </a>
				           </li>
				         </c:if> 
						</ul>
					</div>
				</div>
			</div>
			<!--推荐图书end..-->

			<!--特价图书 begin-->
			<div>
				<div class="text-primary"><img src="${base }/images/bullet1.gif" alt="" title="">
					<a href="#">特价图书</a>
				</div>
				<div class="row">
				    <c:forEach items="${bean3.pageDatas }" var="b3"> 
					<div class="col-sm-6 col-md-3 wow fadeInLeft animated">
						<div class="thumbnail">
							<a href="${base }/book/preShow?bid=3&id=${b3.bookid}&pageNow=1"><img src="${base }/${b3.imageurl}" alt="通用的占位符缩略图"></a>
							<div class="caption">
								<h3>${b3.name }</h3>
								<p>价格:${b3.newPrice }元&nbsp;&nbsp;作者:${b3.author }&nbsp;&nbsp;</p>
								<p>
									<a href="${base }/book/preShow?bid=3&id=${b3.bookid}&pageNow=1">
										更多信息
									</a>
								</p>
							</div>
						</div>
					</div>
                   </c:forEach>
                   <div style="clear:both"></div>
					<!--分页-->
					<div class="container">
						<ul class="pager">
							<!-- 判断当前页是否是首页 -->
			              <c:if test="${bean3.pageNow==1 }"> 
				              <li class="disabled">
				                <a href="javascript:void(0)" aria-label="Previous"><span aria-hidden="true">&larr;上一页</span></a>
				             </li>
				         </c:if>
				         
				          <c:if test="${bean3.pageNow!=1 }"> 
				           <li>
				              <a href="${base}/page/book3?pageNow=${bean3.pageNow-1}" aria-label="Previous"><span aria-hidden="true">&larr;上一页</span></a>
				           </li>
				          </c:if>
				          
				         <!--判断是否是最后一页  -->
				          <c:if test="${bean3.pageNow==bean3.totalPages }">
				               <li class="disabled">
					               <a href="javascript:void(0)" aria-label="Next">
						       <span aria-hidden="true">下一页 &rarr;</span>
					               </a>
				              </li>
				          </c:if>
				          
				          <c:if test="${bean3.pageNow!=bean3.totalPages }">
				            <li>
					            <a href="${base}/page/book3?pageNow=${bean3.pageNow+1}" aria-label="Next">
						          <span aria-hidden="true">下一页 &rarr;</span>
					           </a>
				           </li>
				         </c:if> 
						</ul>
					</div>
				</div>
			</div>
			<!--特价图书 end-->
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
		<!--首页底部信息end->
		<!--图书内容部分end-->

		<!-- 登录模态框（Modal） -->
		 
		<%@ include file="/jsp/loginAndRegister.jsp" %>
		
		<script src="${base }/dist/js/jquery.min.js"></script>
		<script src="${base }/js/carousel.js" type="text/javascript" charset="utf-8"></script>
		<script src="${base }/dist/js/bootstrap.min.js"></script>
		<script src="${base }/js/wow.js"></script>
		<script src="${base }/js/register.js"></script>
		<script type="text/javascript">
			if(!(/msie [6|7|8|9]/i.test(navigator.userAgent))) {
				new WOW().init();
			};
		</script>
	</body>

</html>