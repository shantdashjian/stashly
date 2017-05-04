angular.module('item')
.factory('itemService', 
		function( $http, $filter, $location, authService){
		var service = {}
		
		var BASE_URL= "http://localhost:8080/CollectorsREST/rest/user/";

		var EBAY_URL = "http://svcs.ebay.com/services/search/FindingService/v1?";
		
		var APP_NAME = 'ShaunDas-Collecto-PRD-308fef0ab-269be395';
			

		var items = [];
		
		var checkLogin = function() {
			if(!authService.getToken().id) {
				$location.path('/login');
			}
		}
		
		service.index = function (){
			return $http({
				method:'GET',
				url: BASE_URL + authService.getToken().id + '/item'
				
			})
			
		};
		
		service.show = function (iid){
			return $http({
				method:'GET',
				url: BASE_URL + authService.getToken().id + '/item/' + iid
			})
		};
		
		
		service.updateCurrentValue = function(keywords){
			return $http({
				method:'GET',
				url: 'https://crossorigin.me/' + EBAY_URL 
				+ 'OPERATION-NAME=findItemsByKeywords&SERVICE-VERSION=1.12.0&SECURITY-APPNAME='
				+ APP_NAME
				+ '&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&'
				+ 'keywords=' + keywords
				+ '&paginationInput.entriesPerPage=1'	

			})
			
		};
		
		service.retire = function(item){
			item.retired = true;
			return $http({
				method : 'PUT',
				url : BASE_URL + authService.getToken().id + '/item/' + item.id,
				headers : {
					'Content-Type' : 'application/json'
				},
				data : item
			})
		}
		
		service.update = function(item){
			return $http({
				method : 'PUT',
				url : BASE_URL + authService.getToken().id + '/item/' + item.id,
				headers : {
					'Content-Type' : 'application/json'
				},
				data : item
			})
		}
		
		service.create = function(item) {
			item.retired = false;
			checkLogin();

			return $http({
				method : 'POST',
				url : BASE_URL + authService.getToken().id + "/item",
				header : {
					'Content-Type' : 'application/json'
				},
				data : item
			}).then(function(res) {
				return res;
			});
		};
		
		service.update = function(item) {
			checkLogin();
			
			return $http({
				method : 'PUT',
				url : BASE_URL + authService.getToken().id + "/item/" + item.id,
				header : {
					'Content-Type' : 'application/json'
				},
				data : item
			}).then(function(res) {
				return res;
			});
		};
	
	return service;
	
	
})
