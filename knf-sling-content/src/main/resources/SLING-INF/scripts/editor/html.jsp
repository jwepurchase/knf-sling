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
<body ng-app='knfApp'>
	<div class="container">
		<sling:eval script="/apps/knf/template/header.jsp" />
		<sling:eval script="/apps/knf/template/nav.jsp" />
		<div><a href='#listRecipes'>list</a></div>
		
		<div ng-view></div>
		
		<script type="text/javascript" src="/etc/knf/js/knfApp.js"></script>
		<script type="text/javascript" src="/etc/knf/js/knfControllers.js"></script>
		
		<sling:eval script="/apps/knf/template/footer.jsp" />
	</div>
</body>
</html>
