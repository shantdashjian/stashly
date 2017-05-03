angular.module('item')
.factory('itemService', 
		function( $http, $filter, $location){
		var service = {}
		
		var BASE_URL= "/rest/user/";
		var uid = 1;
		var items = [];
		service.index = function (){
			
			return $http({
				method:'GET',
				url: BASE_URL + '/' + uid + '/item'
				
			})
			
		}
	
	return service;
	
	
}
		












)