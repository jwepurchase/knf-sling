<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/apps/knf/tld/knf-taglib.tld" prefix="knf"%>
<sling:defineObjects />
<c:set var="props"
	value="${sling:adaptTo(resource,'org.apache.sling.api.resource.ValueMap')}"
	scope="request" />
<sling:eval script="/apps/knf/template/head.jsp" />
<div class="container">
	<sling:eval script="/apps/knf/template/header.jsp" />
	<sling:eval script="/apps/knf/template/nav.jsp" />
	<div ng-app="knfApp" ng-controller="viewRecipeController">
		{{view recipe}}
	</div>
	<script type="text/javascript" src="/etc/knf/js/knfApp.js"></script>
	<script type="text/javascript" src="/etc/knf/js/recipeEditorController.js"></script>
	
	<sling:eval script="/apps/knf/template/footer.jsp" />
</div>
