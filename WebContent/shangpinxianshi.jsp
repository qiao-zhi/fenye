<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<title>从数据库读取路径显示图片</title>
</head>
<body style="text-align: center; padding: auto;">


	<div style="margin: 0px auto; text-align: center;">
		<%--items用于迭代的变量，var代表每次迭代之后存放名字 --%>
		<table border="1px" cellspacing="0px" align="center" cellpadding="0px">
			<tr>
				<th>id</th>
				<th>姓名:</th>
				<th>图片</th>
				<th>密码</th>
			</tr>
			<c:forEach items="${pageBean.productList }" var="user">
				<tr>
					<th>${user.id}</th>
					<th>${user.name}</th>
					<th><img alt=""
						src="${pageContext.request.contextPath }/${user.picture}"
						style="width: 180px; height: 120px"></th>
					<th>${user.password}</th>
				</tr>

			</c:forEach>

		</table>


		<!--分页 -->
		<div style="width: 380px; margin: 0 auto; margin-top: 50px;">
			<ul class="pagination" style="text-align: center; margin-top: 10px;">
				<!-- 上一页 -->
				<!-- 判断当前页是否是第一页 -->
				<c:if test="${pageBean.currentPage==1 }">
					<li class="disabled"><a href="javascript:void(0);"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>
				<c:if test="${pageBean.currentPage!=1 }">
					<li><a
						href="${pageContext.request.contextPath }/userfenye?currentPage=${pageBean.currentPage-1}"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>




				<c:forEach begin="1" end="${pageBean.totalPage }" var="page">
					<!-- 判断当前页 -->
					<c:if test="${pageBean.currentPage==page }">
						<li class="active"><a href="javascript:void(0);">${page}</a></li>
					</c:if>
					<c:if test="${pageBean.currentPage!=page }">
						<li><a
							href="${pageContext.request.contextPath }/userfenye?currentPage=${page}">${page}</a></li>
					</c:if>

				</c:forEach>

				<!-- 判断当前页是否是最后一页 -->
				<c:if test="${pageBean.currentPage==pageBean.totalPage }">
					<li class="disabled"><a href="javascript:void(0);"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>
				<c:if test="${pageBean.currentPage!=pageBean.totalPage }">
					<li><a
						href="${pageContext.request.contextPath }/userfenye?currentPage=${pageBean.currentPage+1}"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>

			</ul>
		</div>
		<!-- 分页结束 -->





	</div>
</body>
</html>