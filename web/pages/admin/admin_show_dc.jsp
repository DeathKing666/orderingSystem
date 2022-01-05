<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/pages/head.jsp">
	<jsp:param value="用户点餐列表" name="title" />
</jsp:include>
</head>
<body>
	<jsp:include page="/pages/admin/admin_nav.jsp">
		<jsp:param value="dc_s" name="fun" />
	</jsp:include>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3 col-0"></div>
			<div class="col-md-6 col-12">
				<c:forEach items="${dcs }" var="entry">
					<c:set var="username" value="${entry.key }" />
					<c:set var="dc" value="${entry.value }" />
					<div class="card border-primary">
						<div class="card-body">
							<ul class="list-group">
								<li class="list-group-item active"><c:out
										value="${username }" escapeXml="true" /></li>
								<c:set var="sum" value="0" />
								<c:forEach items="${dc }" var="food">
									<li class="list-group-item"><c:out
											value="${food.foodname }" escapeXml="true" /> <span
										class="badge badge-pill badge-success p-2 float-right">￥${food.price }</span>
									</li>
									<c:set var="sum" value="${sum+food.price }" />
								</c:forEach>
								<li class="list-group-item active">合计 <span
									class="badge badge-pill badge-success p-2 float-right">￥${sum }</span>
								</li>
							</ul>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="col-md-3 col-0"></div>
		</div>
	</div>
	<!--ending container-->
</body>
</html>