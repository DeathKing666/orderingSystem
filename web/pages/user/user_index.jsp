<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/pages/head.jsp">
	<jsp:param value="用户首页" name="title" />
</jsp:include>
</head>
<body>
	<jsp:include page="/pages/user/user_nav.jsp">
		<jsp:param value="index" name="fun" />
	</jsp:include>
	<div class="container-fluid">
		<div class="card border">
			<div class="card-header border">
				<form class="form-inline"
					action="${pageContext.request.contextPath }/user/user_index.action"
					method="post">
					<input type="search" class="form-control mr-sm-2"
						placeholder="按菜名搜索" name="s_fn" value="${param['s_fn'] }">
					<select class="form-control mr-sm-2" name="s_type">
						<option value="">所有分类</option>
						<c:forEach items="${types }" var="type">
							<option value="${type.id }"
								${type.id == param.s_type?'selected':'' }>
								${type.typename }</option>
						</c:forEach>
					</select>
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
				</form>
			</div>
			<c:if test="${not empty pages.list }">
				<div class="card-body">
					<form method="post"
						action="${pageContext.request.contextPath }/user/user_add_dc.action">
						<div class="table-responsive-xl">
							<table class="table table-striped table-hover table-sm">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">菜名</th>
										<th scope="col">特色</th>
										<th scope="col">主料</th>
										<th scope="col">价格</th>
										<th scope="col">分类</th>
										<th scope="col">图片</th>
										<th scope="col">点餐率</th>
										<th scope="col">备注</th>
										<th scope="col">选择</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="tp" value="${pages.totalPage }" />
									<c:set var="cp" value="1" />
									<c:if test="${param.curPage ne null}">
										<c:set var="cp" value="${param.curPage }" />
									</c:if>
									<c:set var="no" value="${(cp-1)*pages.recNum }" />
									<c:forEach items="${pages.list }" var="food" varStatus="vs">
										<c:set var="no" value="${no+1 }" />
										<tr>
											<th scope="row">${no }</th>
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
												value="${food.id }"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-success btn-block">
								将 菜 品 添 加 到 点 餐 车</button>
						</div>
					</form>
				</div>
				<div class="card-footer border">
					<div class="row">
						<div class="col-md-12 col-12">
							<nav>
								<ul class="pagination justify-content-end">
									<c:if test="${cp == 1 }">
										<li class="page-item disabled"><a class="page-link"><span
												aria-hidden="true">&laquo;</span></a></li>
									</c:if>
									<c:if test="${cp !=1 }">
										<c:url value="/user/user_index.action" var="url">
											<c:param name="curPage" value="${cp-1 }" />
											<c:param name="s_fn" value="${param['s_fn'] }" />
											<c:param name="s_type" value="${param['s_type'] }" />
										</c:url>
										<li class="page-item"><a class="page-link" href="${url }"><span
												aria-hidden="true">&laquo;</span> </a></li>
									</c:if>
									<c:forEach begin="1" end="${tp }" var="i">
										<c:url value="/user/user_index.action" var="url">
											<c:param name="curPage" value="${i }" />
											<c:param name="s_fn" value="${param['s_fn'] }" />
											<c:param name="s_type" value="${param['s_type'] }" />
										</c:url>
										<li class="page-item ${ i==cp? 'active':''}"><a
											class="page-link" href="${url }">${i }</a></li>
									</c:forEach>
									<c:if test="${cp == tp }">
										<li class="page-item disabled"><a class="page-link"><span
												aria-hidden="true">&raquo;</span></a></li>
									</c:if>
									<c:if test="${cp != tp }">
										<c:url value="/user/user_index.action" var="url">
											<c:param name="curPage" value="${cp+1 }" />
											<c:param name="s_fn" value="${param['s_fn'] }" />
											<c:param name="s_type" value="${param['s_type'] }" />
										</c:url>
										<li class="page-item"><a class="page-link" href="${url }">
												<span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:if>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>