angular.module('item').factory('categoryService',
		function($http) {
		service = {};
		
		var BASE_URL= "http://localhost:8080/CollectorsREST/rest/category/";

		service.index = function (){
			return $http({
				method:'GET',
				url: BASE_URL
			})
		};
		
		service.conditions = [
			'poor',
			'fair',
			'good',
			'very good',
			'excellent',
			'mint/unopened'
		];
	
		return service;
})
