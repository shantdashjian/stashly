angular.module("appModule", ['nav','item','ngRoute'])
.config(function($routeProvider){
	$routeProvider
	.when('/',{
	template: '<login>Loading Login </login>'
		
	})
	.when('/itemList',{
		template: '<item-list> loading Item List</item-list>'

	})
	
	
	
	
	
	
	
	
	
	
	
})