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

    <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
      	<c:set var="feature" value="${sling:adaptTo(sling:getResource(resourceResolver, '/content/knifeandfork/recipes/BBQ_Pork_Ribs'), 'org.apache.sling.api.resource.ValueMap') }"/>
        <div class="item active">
          <img src="${feature.pictures[0]}" alt="${feature.title}">
          <div class="container">
            <div class="carousel-caption">
              <h1><a href="/content/knifeandfork/recipes/BBQ_Pork_Ribs.html"><c:out value="${feature.title}"/></a></h1>
            </div>
          </div>
        </div>
      	<c:set var="feature" value="${sling:adaptTo(sling:getResource(resourceResolver, '/content/knifeandfork/recipes/Croissant'), 'org.apache.sling.api.resource.ValueMap') }"/>
        <div class="item">
          <img src="${feature.pictures[0]}" alt="${feature.title}">
          <div class="container">
            <div class="carousel-caption">
              <h1><a href="/content/knifeandfork/recipes/Croissant.html"><c:out value="${feature.title}"/></a></h1>
            </div>
          </div>
        </div>
      	<c:set var="feature" value="${sling:adaptTo(sling:getResource(resourceResolver, '/content/knifeandfork/recipes/Poppy_Seed_Fish'), 'org.apache.sling.api.resource.ValueMap') }"/>
        <div class="item">
          <img src="${feature.pictures[0]}" alt="${feature.title}">
          <div class="container">
            <div class="carousel-caption">
              <h1><a href="/content/knifeandfork/recipes/Poppy_Seed_Fish"><c:out value="${feature.title}"/></a></h1>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->
    
		<sling:eval script="/apps/knf/template/footer.jsp" />
	</div>
</body>
</html>
