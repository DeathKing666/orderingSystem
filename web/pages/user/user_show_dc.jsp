<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/pages/head.jsp">
	<jsp:param value="用户点餐车" name="title" />
</jsp:include>
</head>
<body>
	<jsp:include page="/pages/user/user_nav.jsp">
		<jsp:param value="show" name="fun" />
	</jsp:include>
	<c:if test="${not empty dc}">
		<div class="container-fluid">
			<div class="card border">
				<div class="card-body border">
					<form
						action="${pageContext.request.contextPath }/user/user_del_dc.action"
						method="post">
						<div class="table-responsive-xl">
							<table class="table table-striped table-hover table-sm">
								<thead>
									<tr>
										<th>#</th>
										<th>菜名</th>
										<th>特色</th>
										<th>主料</th>
										<th>价格</th>
										<th>分类</th>
										<th>图片</th>
										<th>点餐率</th>
										<th>备注</th>
										<th>选择</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${dc }" var="food" varStatus="vs">
										<tr>
											<th>${vs.count }</th>
											<td><c:out value="${food.foodname }" escapeXml="true" /></td>
											<td><c:out value="${food.feature }" escapeXml="true" /></td>
											<td><c:out value="${food.material }" escapeXml="true" /></td>
											<td>${food.price }</td>
											<td><c:out value="${food.typename }" escapeXml="true" /></td>
											<td><img class="img-rounded"
												src="${pageContext.request.contextPath }/${food.picture }" />
											</td>
											<td>${food.hits }</td>
											<td><c:choose>
													<c:when test="${food.comment == '0' }">厨师推荐</c:when>
													<c:when test="${food.comment == '-1' }">&nbsp;</c:when>
													<c:otherwise>特价${food.comment }元</c:otherwise>
												</c:choose></td>
											<td><input type="checkbox" name="ids"
												value="${food.dcid }"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-danger btn-block">将
								菜 品 从 点 餐 车 删 除</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</c:if>
</body>
</html>