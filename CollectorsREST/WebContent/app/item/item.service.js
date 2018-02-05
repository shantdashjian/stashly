angular.module('item')
.factory('itemService', 
		function( $http, $filter, $location, authService){
		var service = {}
		
		var BASE_URL= "rest/user/";

		var EBAY_URL = "http://svcs.ebay.com/services/search/FindingService/v1?";
		
		var APP_NAME = 'ShaunDas-Collecto-PRD-308fef0ab-269be395';
		
		var INF_URL = 'https://www.statbureau.org/calculate-inflation-price-jsonp?jsoncallback=?';

		var CORS_PROXY = "https://cors-anywhere.herokuapp.com/";
		
		var currentDate = function() {
			var today = new Date();
			var date = today.getFullYear()+'/'+(today.getMonth()+1)+'/'+today.getDate();
			return date;
		}
		

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
		
		service.getCategories = function(category){
			return $http({
				method:'GET',
				url: 'rest/category'
			})
		};
			
		
		service.show = function (iid){
			return $http({
				method:'GET',
				url: BASE_URL + authService.getToken().id + '/item/' + iid
			})
			.then(function(response){
				response.data.purchaseDate = new Date(response.data.purchaseDate);
				return response;
			})
		};
		
		service.destroy = function (item){
		
			return $http({
				method:'DELETE',
				url: BASE_URL + authService.getToken().id + '/item/' + item.id
			})
		};
		
		service.updateCurrentValue = function(keywords){
			return $http({
				method:'GET',
				url: CORS_PROXY + EBAY_URL 
				+ 'OPERATION-NAME=findItemsByKeywords&SERVICE-VERSION=1.12.0&SECURITY-APPNAME='
				+ APP_NAME
				+ '&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&'
				+ 'keywords=' + keywords
				+ '&paginationInput.entriesPerPage=1'	

			})
			
		};
		
		service.getInflation = function(item) {
			return $http({
				url : INF_URL,
				method : 'GET',
				params : {
					country: 'united-states',
                	start: item.purchaseDate,
                	end: currentDate(),
                	amount: item.purchasePrice,
                	format: true
				}
		    
			}).then(function(res) {

				return res;
			}).catch(function(err) {
				console.log(err);
			})

		}
		
		service.retire = function(item){			
			item.retired = true;		
			return service.update(item);
		}
		
		service.returnItem = function(item){			
			item.retired = false;		
			return service.update(item);
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
			
			
			// check if the item.imageUrl is valid
			// if not put 'images/noimage.jpg'
			
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
		

	
	return service;
})
