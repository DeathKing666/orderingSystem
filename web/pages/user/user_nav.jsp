<%@ page pageEncoding="utf-8"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12 col-12">
			<nav
				class="navbar navbar-expand-lg navbar-light bg-light justify-content-between">
				<a class="navbar-brand"
					href="${pageContext.request.contextPath }/homepage.action"><span
					class="text-info">网络点餐系统</span></a>
				<ul class="navbar-nav mr-auto">
					<li class="nav-item ${'index' == param.fun ? 'active' : '' }">
						<a class="nav-link"
						href="${pageContext.request.contextPath }/user/user_index.action">正在点餐</a>
					</li>
					<li class="nav-item ${'show' == param.fun ? 'active' : '' }">
						<a class="nav-link"
						href="${pageContext.request.contextPath }/user/user_show_dc.action">我的点餐</a>
					</li>
				</ul>
				<ul class="nav justify-content-end">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
							${sessionScope.loginName } </a>
						<div class="dropdown-menu dropdown-menu-right">
							<a class="dropdown-item" href="#">修改个人资料</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item"
								href="${pageContext.request.contextPath }/logout.action">退出登录</a>
						</div></li>
				</ul>
			</nav>
		</div>
	</div>
</div>