angular.module('item')
.factory('priceService', 
		function( $http, $filter, $location, authService){
		var service = {};
		
		var BASE_URL = "http://localhost:8080/CollectorsREST/rest/user/";
		
		service.index = function(){
			return $http({
				method:'GET',
				url: BASE_URL + authService.getToken().id + "/price/"
			})
		}
		
		// using for the graph on the show page
		service.indexByItem = function(iid){
			return $http({
				method:'GET',
				url: BASE_URL + authService.getToken().id + '/item/' + iid + "/price/"
			})
		}
		
		
		// using for the graph on the summary page
		service.summaryByItem = function(iid){
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
		
		service.create = function(price, id){
			
			return $http({
				method : 'POST',
				url : BASE_URL + authService.getToken().id + "/item/" + id + "/price/",
				header : {
					'Content-Type' : 'application/json'
				},
				data : price
			})
		}
		
		service.destroy = function(iid, pid){
	        return $http({
	            method: 'DELETE',
				url: BASE_URL + authService.getToken().id + '/item/' + iid + "/price/" + pid
	        })
		}
	
		return service;
})