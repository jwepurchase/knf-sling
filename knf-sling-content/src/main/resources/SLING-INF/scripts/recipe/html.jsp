<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<sling:defineObjects />
<c:set var="props"
	value="${sling:adaptTo(resource,'org.apache.sling.api.resource.ValueMap')}"
	scope="request" />
<sling:eval script="/apps/knf/template/head.jsp" />
<body>
	<div class="container">
		<sling:eval script="/apps/knf/template/header.jsp" />
		<sling:eval script="/apps/knf/template/nav.jsp" />
		<div class="recipe-article">
			<h2>
				<c:out value="${props.title}" />
			</h2>
			<div>
				<h3>Categories</h3>
				<ul>
					<c:forEach items="${props.categories}" var="category">
						<li><c:out value="${category}" /></li>
					</c:forEach>
				</ul>
			</div>
			<div>
				<p>Preparation Time: <c:out value="${props.time}"/></p>
				<p>Serves: <c:out value="${props.serves}"/></p>
			</div>
			<div>
				<c:forEach items="${props.pictures}" var="url">
					<img src="${url}">
				</c:forEach>
			</div>
			<div>
				<h3>Ingredients</h3>
				<ul>
					<c:forEach items="${props.ingredients}" var="ingredient">
						<li><c:out value="${ingredient}" /></li>
					</c:forEach>
				</ul>
			</div>
			<div>
				<h3>Directions</h3>
				<ul>
					<c:forEach items="${props.directions}" var="direction">
						<li><c:out value="${direction}" /></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<sling:eval script="/apps/knf/template/footer.jsp" />
	</div>
</body>
</html>
