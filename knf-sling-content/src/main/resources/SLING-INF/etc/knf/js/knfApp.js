var knfApp = angular.module("knfApp", ['ngRoute']);

knfApp.config(['$routeProvider', function($routeProvider){
	
	$routeProvider.when('/listRecipes', {
		templateUrl: 'editor.list.html',
		controller: 'ListRecipesController'
	})
	.when('/viewRecipe', {
		templateUrl: 'editor.view.html',
		controller: 'ViewRecipeController'
	})
	.when('/editRecipe', {
		templateUrl: 'editor.edit.html',
		controller: 'EditRecipeController'
	})
	.otherwise({
		redirectTo: 'editor.list.html'
	});
	
}]);