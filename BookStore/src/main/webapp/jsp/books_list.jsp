<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>图书列表</title>
		<link type="text/css" rel="stylesheet" href="${base }/dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="${base }/css/index.css" />
		<link rel="stylesheet" type="text/css" href="${base }/css/animate.css" />
	
	</head>
	<body>
		<%-- <%@ include file="/jsp/head.jsp" %> --%>
		<!-- 动态包含 -->
		<jsp:include page="/jsp/head.jsp"></jsp:include>
		<div class="container">	
			<ol class="breadcrumb">
			    <li><a href="#">图书列表</a></li>
			    <li><a href="#">精选图书</a></li>
			</ol>
		</div>
		
		<!--图书列表 begin-->
		<div class="container">
		 <c:forEach items="${bean.pageDatas }" var="b"> 
				<div class="col-sm-6 col-md-3 wow fadeInLeft animated">
				     
					<div class="thumbnail">
						<a href="${base }/book/preShow?bid=${param.cateid}&id=${b.bookid}&pageNow=1"><img src="${base }/${b.imageurl}" alt="通用的占位符缩略图"></a>
						<div class="caption">
							<h3>${b.name }</h3>
							<p>价格:${b.newPrice }元&nbsp;&nbsp;作者:${b.author }&nbsp;&nbsp;</p>
							<p>
								<a href="details.html">
									更多信息
								</a>
							</p>
						</div>
					</div>
				  
				</div>
				</c:forEach>
		</div> 
	 
		<!--图书列表end-->

		<!--分页begin-->
			<div class="container">
				<div class="row text-center">
					<div class="col-md-12">
						<ul class="pagination">
							<li><a href="${base }/book/list?pageNow=1&cateid=${param.cateid}">首页</a></li>
						    
						    <!-- 判断当前页是否是首页 -->
			              <c:if test="${bean.pageNow==1 }"> 
				              <li class="disabled">
				                <a href="javascript:void(0)" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
				             </li>
				         </c:if>
				         
				          <c:if test="${bean.pageNow!=1 }"> 
				           <li>
				              <a href="${base}/book/list?pageNow=${bean.pageNow-1}&cateid=${param.cateid}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
				           </li>
				          </c:if>
				          
				          <c:forEach begin="${bean.pageNow-5>0?bean.pageNow-5:1 }" end="${bean.pageNow+4>bean.pageNow?bean.totalPages:bean.pageNow+3 }" var="n">
				             <!--判断是否为当前页  -->
				            <c:if test="${bean.pageNow==n }">
				                 <li class="active"><a href="javascript:void(0)">${n }</a></li>
				            </c:if>
				            <c:if test="${bean.pageNow!=n }">
				                 <li><a href="${base}/book/list?pageNow=${n}&cateid=${param.cateid}">${n }</a></li>
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
					            <a href="${base}/book/list?pageNow=${bean.pageNow+1}&cateid=${param.cateid}" aria-label="Next">
						          <span aria-hidden="true">&raquo;</span>
					           </a>
				           </li>
				         </c:if>
						    <li><a href="${base }/book/list?pageNow=${bean.totalPages}&cateid=${param.cateid}" style="border: 1px solid #ddd;">尾页</a></li>
						    <li><a style="border: 0px;margin-left: 0px;">当前页${bean.pageNow }/${bean.totalPages }总页</a></li>
						    <li>
						     	
						     	<div id="search" class="input-group" style="positon:relative;">
									<input type="text" name="page" id="page" class="form-control" placeholder="跳转指定页" />
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
		
		<!--地址-->
		<div class="container">
		<hr>
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
		<%@ include file="/jsp/loginAndRegister.jsp" %>
		<!--end-->
	<script src="${base }/dist/js/jquery.min.js"></script>
	<script src="${base }/js/carousel.js" type="text/javascript" charset="utf-8"></script>
	<script src="${base }/dist/js/bootstrap.min.js"></script>
	<script src="${base }/js/wow.js"></script>
	<script type="text/javascript">
		if(!(/msie [6|7|8|9]/i.test(navigator.userAgent))) {
			new WOW().init();
		};
		
		function getvalue(){
			 var pages=document.getElementById("page").value;
			 window.location.href="/BookStore/book/change?cateid=${param.cateid}&pages="+pages;
		}
		
		function setPage(){
			var size=document.getElementById("pageSize");
			var ops=size.options;
			for(var i=0;i<ops.length;i++){
			if(ops[i].selected==true){
			window.location.href="/BookStore/book/setSize?cateid=${param.cateid}&s="+ops[i].text;
			}
		 }
	  }
	</script>
	</body>
</html>
