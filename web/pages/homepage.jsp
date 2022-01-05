<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="head.jsp">
	<jsp:param value="首页" name="title" />
</jsp:include>
</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.ident == 1 }">
			<jsp:include
				page="/pages/admin/admin_nav.jsp" />
		</c:when>
		<c:when test="${sessionScope.ident == 0 }">
			<jsp:include
				page="/pages/user/user_nav.jsp" />
		</c:when>
		<c:otherwise>
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12 col-12">
						<nav
							class="navbar navbar-expand-lg navbar-light bg-light justify-content-between">
							<a class="navbar-brand" href="homepage.action"><span
								class="text-info">网络点餐系统</span></a>
							<ul class="nav justify-content-end">
								<li class="nav-item"><a class="nav-link" href="#"
									data-toggle="modal" data-target="#loginModal">登录</a></li>
								<li class="nav-item"><a class="nav-link" href="#"
									data-toggle="modal" data-target="#registerModal">注册</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 col-12">
				<h4 class="list-group-item active">热点菜品</h4>
				<c:if test="${hot ne null }">
					<ul class="list-group">
						<c:forEach items="${requestScope.hot }" var="hm">
							<li class="list-group-item"><img class="img-rounded"
								src="${pageContext.request.contextPath }/${hm.picture }" /> <a
								href="${pageContext.request.contextPath }/show_detail.action?id=${hm.id }"
								target="_blank"> <c:out value="${hm.foodname }"
										escapeXml="true" /></a> &nbsp;&nbsp; <span>${hm.price }元</span></li>
						</c:forEach>
					</ul>
				</c:if>
			</div>
			<div class="col-md-4 col-12">
				<h4 class="list-group-item active">今日特价</h4>
				<c:if test="${special ne null }">
					<ul class="list-group">
						<c:forEach items="${special }" var="hm">
							<li class="list-group-item"><img class="img-rounded"
								src="${pageContext.request.contextPath }/${hm.picture }" /> <a
								href="${pageContext.request.contextPath }/show_detail.action?id=${hm.id }"
								target="_blank"> <c:out value="${hm.foodname }"
										escapeXml="true" /></a> &nbsp;&nbsp; <span>${hm.comment }元</span>
							</li>
						</c:forEach>
					</ul>
				</c:if>
			</div>
			<div class="col-md-4 col-12">
				<h4 class="list-group-item active">厨师推荐</h4>
				<c:if test="${recomm ne null }">
					<ul class="list-group">
						<c:forEach items="${recomm }" var="hm">
							<li class="list-group-item"><img class="img-rounded"
								src="${pageContext.request.contextPath }/${hm.picture }" /> <a
								href="${pageContext.request.contextPath }/show_detail.action?id=${hm.id }"
								target="_blank"> <c:out value="${hm.foodname }"
										escapeXml="true" /></a> &nbsp;&nbsp; <span>${hm.price }元</span></li>
						</c:forEach>
					</ul>
				</c:if>
			</div>
		</div>
	</div>
	<%@ include file="login.jsp"%>
</body>
</html>