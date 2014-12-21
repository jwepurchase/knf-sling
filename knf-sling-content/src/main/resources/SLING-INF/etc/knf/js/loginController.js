knfApp.controller("loginController", function($scope, $http) {

	$scope.submit = function() {
		var url = "http://localhost:8080/content/knifeandfork/j_security_check";
		$scope.credentials['j_validate'] = 'true';
		var data = $.param($scope.credentials).replace(/%5[BD]/g, "");
		
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
