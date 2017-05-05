angular.module('item')
.factory('priceService', 
		function( $http, $filter, $location, authService){
		var service = {};
		
		var BASE_URL = "http://localhost:8080/CollectorsREST/rest/user/";
		
		service.index = function(iid){
			return $http({
				method:'GET',
				url: BASE_URL + authService.getToken().id + '/item/' + iid + "/price/"
			})
		}
		
		service.show = function(iid, pid){
			return $http({
				method:'GET',
				url: BASE_URL + authService.getToken().id + '/item/' + iid + "/price/" + pid
			})
		}
		
		service.create = function(price){
			price.date = new Date();

			return $http({
				method : 'POST',
				url : BASE_URL + authService.getToken().id + "/item",
				header : {
					'Content-Type' : 'application/json'
				},
				data : item
			})
		}
		
		service.destroy = function(){
			
		}
		
		
		
		return service;
})