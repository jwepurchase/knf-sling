<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/apps/knf/tld/knf-taglib.tld" prefix="knf"%>
<c:set var="props"
	value="${sling:adaptTo(resource,'org.apache.sling.api.resource.ValueMap')}"
	scope="request" />
	<div>
		<knf:recipeList var="recipes"/>
		<ul>
			<c:forEach items="${recipes}" var="recipe">
				<c:set var="recipeProps"
 					value="${sling:adaptTo(recipe,'org.apache.sling.api.resource.ValueMap')}" 
 					scope="page" /> 
 				<li> 
 					<a href="editor.view.html?recipe=${recipe.path}"> 
 						<c:out value="${recipeProps.title}"/> 
 					</a> 
 				</li>  
 			</c:forEach> 
 		</ul> 
 	</div> 
</div>
