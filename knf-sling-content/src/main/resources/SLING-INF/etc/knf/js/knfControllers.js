knfApp.controller("ListRecipesController", function($scope, $http){
	$scope.message = "Recipe List";
});

knfApp.controller("ViewRecipeController", function($scope) {
	$scope.message = "View Recipe";
});

knfApp.controller("EditRecipeController", function($scope, $http) {
	function getUrlParam(name) {
		return decodeURIComponent((new RegExp('[?|&]' + name +'=' + '([^&;]+?)(&|#|;|$)').exec(location.search)||[,""])[1].replace(/\+/g, '%20'))||null;
	}
	
	function appendParams(params, paramName, paramValue) {
		var result = params;
		if (params.length > 0) {
			result += "&";
		}
		
		paramValue = [].concat(paramValue);
		for (i = 0; i< paramValue.length; i++) {
			result += paramName +"=" + paramValue[i];
			if(i < paramValue.length -1) {
				result += "&";
			}
		}
		
		return result;
	}
	
	function serializeForm(data) {
		var result = "";
		for (var key in data) {
			if (data.hasOwnProperty(key) 
					&& typeof data[key] !== 'function' 
					&& key.indexOf('jcr') != 0 
					&& key.indexOf('sling') != 0
			){
				var propArray = [].concat(data[key]);
				for(var i = 0; i < propArray.length; i++) {
					result += key + "=" + propArray[i] + "&";
				}
				if (propArray.length > 1) {
					result += key +"@TypeHint=String[]&";
				}
			}
		}
		
		return result + "sling:resourceType=/apps/knf/recipe";
	}
	
	function addElement(array) {
		if (typeof element === 'undefined') {
			array = [];
		}
		array.push();
	}
	
	function removeElement(array) {
		if(array.length > 1) {
			array.pop;
		} else {
			array[0] = "";
		}
	}
	
	function initializeEmptyArray(array) {
		if (typeof array === 'undefined'){
			array = [];
		}
		
		if (array.length == 0 ){
			array.push("");
		}
		return array;
	}
	
	var recipePath = getUrlParam('recipe');
	$http.get(recipePath + ".json")
		.success(function (response){
			console.log(JSON.stringify(response));
			$scope.recipe = response;
			$scope.recipe.pictures = initializeEmptyArray($scope.recipe.pictures);
			$scope.recipe.ingredients = initializeEmptyArray($scope.recipe.ingredients);
			$scope.recipe.directions = initializeEmptyArray($scope.recipe.directions);
			$scope.recipe.categories = initializeEmptyArray($scope.recipe.categories);
		});
	
	$scope.defaultList = function(listName) {
		if (typeof this.recipe[listName] === 'undefined') {
			this.recipe[listName] = [];
			this.recipe[listName].push('');
		} else if (this.recipe[listName].length == 0) {
			this.recipe.push('');
		}
	}
	
	$scope.addPicture = function() {
		addElement($scope.recipe.pictures);
	};
	
	$scope.removePicture = function() {
		removeElement($scope.recipe.pictures);
	};
	
	$scope.addIngredient = function() {
		addElement($scope.recipe.ingredients);
	};
	
	$scope.removeIngredient = function() {
		removeElement($scope.recipe.ingredients);
	};
	
	$scope.addDirection = function() {
		addElement($scope.recipe.directions);
	};
	
	$scope.removeDirection = function() {
		removeElement($scope.recipe.directions);
	};
	$scope.update = function() {
		var url = getUrlParam('recipe');
		var data = serializeForm($scope.recipe);
		console.log("Params");
		console.log(data);
		$http({
			method:'POST',
			url:url,
			data:data,
			headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
			
		}).success(function(){
			alert("success");
		});
	}
	
	
});
