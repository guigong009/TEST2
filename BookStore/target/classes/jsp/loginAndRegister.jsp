<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<%!
private String getCookieValue(Cookie[] cookies,String cookieName){
	  String cookieValue=null;
	  if(cookies!=null){
	  for(Cookie c : cookies){
		  if(cookieName.equals(c.getName())){
			  cookieValue=c.getValue();
			  break;
		  }
	  }
}
	  return cookieValue;
}
%>

<%
String cookieValue=getCookieValue(request.getCookies(),"userinfo");
String username="";
String password="";
if(cookieValue!=null){
	username=cookieValue.split(":")[0];
	password=cookieValue.split(":")[1];
}
%>
<!-- 登录模态框（Modal） -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
						<h4 class="modal-title" id="myModalLabel">
					用户登录
				</h4>
					</div>
					<div class="modal-body">
					 
						<!--登录的form表单-->
						<form class="form-horizontal" role="form" action="${base }/user/login" method="post">
							<div class="form-group has-feedback">
 
								<label for="firstname" class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-5">

									<input type="text" class="form-control"  name="username" value="<%=username %>" id="username" placeholder="请输入用户名"/>
									<span class="glyphicon glyphicon-user form-control-feedback"></span>
								</div>
								<div class="col-sm-3" style="padding-top: 10px;">
									<label class="alert-danger"></label>
								</div>
							</div>
							<div class="form-group has-feedback">
								<label for="lastname" class="col-sm-2 control-label">密码</label>
								<div class="col-sm-5">
									<input type="text" class="form-control"  name="password" value="<%=password %>" id="password" placeholder="请输入密码"/>
									<span class="glyphicon glyphicon-lock form-control-feedback"></span>
								</div>
								<div class="col-sm-3" style="padding-top: 10px;">
									<label class="alert-danger"></label>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<div class="checkbox">
										<label>
          									<input type="checkbox" name="noLogin" value="0">请记住我
        								</label>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
								<input type="submit" class="btn btn-primary" value="登录">
							</div>
						</form>
						<!--form结束-->
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
		</div>
		<!-- 登录modal end/.modal -->
		<div class="modal fade" id="register" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
						<h4 class="modal-title" id="myModalLabel">
					用户注册
				</h4>
					</div>
					<div class="modal-body">
						<!--注册的form表单-->
						<form action="${base }/user/register" class="form-horizontal" role="form" method="post">
							<div class="form-group has-feedback">
								<label for="firstname" class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" name="username" id="username" required placeholder="小写字母开头,不含中文." onchange="checkUsername()">
									<span class="gl" id="sp"></span>
								</div>
								<!--<div class="col-sm-3" style="padding-top: 10px;">
									<label class="alert-danger">用户名不合法</label>
								</div>-->
							</div>
							<div class="form-group has-feedback">
								<label for="lastname" class="col-sm-2 control-label">密码</label>
								<div class="col-sm-5">
									<input type="password" class="form-control" name="password" id="lastname" placeholder="密码长度6-8位" minlength="6" maxlength="8">
									<span class="glyphicon glyphicon-lock form-control-feedback"></span>
								</div>
								<!--<div class="col-sm-3" style="padding-top: 10px;">
									<label class="alert-danger">密码不正确</label>
								</div>-->
							</div>
							<div class="form-group has-feedback">
								<label class="col-sm-2 control-label">确认密码</label>
								<div class="col-sm-5">
									<input type="password" class="form-control" id="lastname2" minlength="6" maxlength="8" placeholder="和密码保持一致">
									<span class="glyphicon glyphicon-lock form-control-feedback"></span>
								</div>
							</div>

							<div class="form-group has-feedback">
								<label class="col-sm-2 control-label">邮箱</label>
								<div class="col-sm-5">
									<input type="email" class="form-control" name="email" id="email" placeholder="合法邮箱格式">
									<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
								</div>
							</div>

							<div class="form-group has-feedback">
								<label class="col-sm-2 control-label">电话</label>
								<div class="col-sm-5">
									<input type="tel" class="form-control" name="telephone" id="email" placeholder="合法手机格式">
									<span class="glyphicon glyphicon-earphone form-control-feedback"></span>
								</div>
							</div>

							<div class="form-group has-feedback">
								<label class="col-sm-2 control-label">公司</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" name="company" id="email" placeholder="请输入公司地址">
									<span class="glyphicon glyphicon-home form-control-feedback"></span>
								</div>
							</div>

							<div class="form-group has-feedback">
								<label class="col-sm-2 control-label">地址</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" name="address" id="email" placeholder="请输入收货">
									<span class="glyphicon glyphicon-home form-control-feedback"></span>
								</div>
							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
								<input type="submit" class="btn btn-primary" value="注册">
							</div>
						</form>
						<!--form结束-->
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
		</div>