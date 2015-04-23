<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/apps/knf/tld/knf-taglib.tld" prefix="knf"%>
<sling:defineObjects />
<c:set var="props"
	value="${sling:adaptTo(resource,'org.apache.sling.api.resource.ValueMap')}"
	scope="request" />
<sling:eval script="/apps/knf/template/head.jsp" />
<div ng-controller="recipeEditorController">
	<form novalidate>
		<input type="hidden" name="sling:resourceType" value="/apps/knf/recipe">
		<label>Title:</label>
		<input type="text" ng-model="recipe.title"><br>
		<label>Serves:</label>
		<input type="text" ng-model="recipe.serves"><br>
		<label>Time:</label>
		<input type="text" ng-model="recipe.time"><br>
		<fieldset>
			<legend>Pictures</legend>
			<div ng-repeat ="picture in recipe.pictures track by $index">
				<label>{{$index+1}}:</label>
				<input ng-model="recipe.pictures[$index]" type="text"/>
			</div>
			<div class="btn-group" role="group" aria-label="...">
			  <button type="button" class="btn btn-default" ng-click="addPicture()"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
			  <button type="button" class="btn btn-default" ng-click="removePicture()"><span class="glyphicon glyphicon-minus" aria-hidden="true"></span></button>
			</div>
		</fieldset>
		<fieldset>
			<legend>Ingredients</legend>
			<div ng-repeat ="ingredient in recipe.ingredients track by $index">
				<label>{{$index+1}}:</label>
				<input ng-model="recipe.ingredients[$index]" type="text"/>
			</div>
			<div class="btn-group" role="group" aria-label="...">
			  <button type="button" class="btn btn-default" ng-click="addIngredient()"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
			  <button type="button" class="btn btn-default" ng-click="removeIngredient()"><span class="glyphicon glyphicon-minus" aria-hidden="true"></span></button>
			</div>
		</fieldset>
		<fieldset>
			<legend>Directions</legend>
			<div ng-repeat ="direction in recipe.directions track by $index">
				<label>{{$index+1}}:</label>
				<input ng-model="recipe.directions[$index]" type="text"/>
			</div>
			<div class="btn-group" role="group" aria-label="...">
			  <button type="button" class="btn btn-default" ng-click="addDirection()"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
			  <button type="button" class="btn btn-default" ng-click="removeDirection()"><span class="glyphicon glyphicon-minus" aria-hidden="true"></span></button>
			</div>
		</fieldset>
		<button type="button" class="btn btn-default" ng-click="update()">Save</button>
	</form>
</div>
