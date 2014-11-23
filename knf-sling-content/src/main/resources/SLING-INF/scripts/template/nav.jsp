<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<sling:defineObjects/>

<c:choose>
	<c:when test="${resource.path eq '/content/knifeandfork/recipes' }">
		<c:set var="indexActive" value="active"/>
	</c:when>
	<c:when test="${resource.path eq '/content/knifeandfork/landing' }">
		<c:set var="homeActive" value="active"/>
	</c:when>
</c:choose>

<div class="navigation">
	<ul class="nav nav-pills">
		<li class="presentation ${homeActive}">
			<a href="/content/knifeandfork/landing.html">
				<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
				<span>Home</span>
			</a>
		</li>
		<li class="presentation ${indexActive}">
			<a href="/content/knifeandfork/recipes.html">
				<span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
				<span>Index</span>
			</a>
		</li>
		<li class="presentation">
			<a href="#">
				<span class="glyphicon glyphicon-tags" aria-hidden="true"></span>
				<span>Categories</span>
			</a>
		</li>
		<li class="presentation">
			<a href="#">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
				<span>Search</span>
			</a>
		</li>
	</ul>
</div>