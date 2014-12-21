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
		<knf:valueMap path="/content/knifeandfork/recipes/Banana_Bread" var="recipe"/>
		
		<div ng-app="knfApp" ng-controller="loginController">
			<form novalidate>
				<label>User Name:</label>
				<input ng-model="credentials.j_username" type="text"/>
				<label>Password:</label>
				<input ng-model="credentials.j_password" type="password"/>
				<button type="button" class="btn btn-default" ng-click="submit()">Login</button>
			</form>
		</div>
		<script type="text/javascript" src="/etc/knf/js/knfApp.js"></script>
		<script type="text/javascript" src="/etc/knf/js/loginController.js"></script>
		
		<sling:eval script="/apps/knf/template/footer.jsp" />
	</div>
</body>
</html>
