<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/apps/knf/tld/knf-taglib.tld" prefix="knf"%>

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
		<h2>
			Index
		</h2>
		<div>
			<knf:recipeList var="recipes"/>
			<ul>
				<c:forEach items="${recipes}" var="recipe">
					<c:set var="recipeProps"
						value="${sling:adaptTo(recipe,'org.apache.sling.api.resource.ValueMap')}"
						scope="page" />
					<li>
						<a href="${recipe.path}.html">
							<c:out value="${recipeProps.title}"/>
						</a>
					</li> 
				</c:forEach>
			</ul>
		</div>
		<sling:eval script="/apps/knf/template/footer.jsp" />
	</div>
</body>
</html>
