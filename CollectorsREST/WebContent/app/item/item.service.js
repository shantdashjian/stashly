angular.module('item')
.factory('itemService', 
		function( $http, $filter, $location){
		var service = {}
		
		var BASE_URL= "http://localhost:8080/CollectorsREST/rest/user/";
		
		var EBAY_URL = "http://svcs.ebay.com/services/search/FindingService/v1?";
		
		var APP_NAME = 'ShaunDas-Collecto-PRD-308fef0ab-269be395';
			
		var uid = 1;
		var items = [];
		service.index = function (){
			return $http({
				method:'GET',
				url: BASE_URL + uid + '/item'
				
			})
			
		}
		
		
		service.updateCurrentValue = function(keywords){
			return $http({
				method:'GET',
				url: 'https://crossorigin.me/' + EBAY_URL + 'OPERATION-NAME=findItemsByKeywords&SERVICE-VERSION=1.12.0&SECURITY-APPNAME='
				+ APP_NAME
				+ '&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&'
				+ 'keywords=' + keywords
				+ '&paginationInput.entriesPerPage=1'	

			})
			
		}
	
	return service;
	
	
})
