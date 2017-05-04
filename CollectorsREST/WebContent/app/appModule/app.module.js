angular.module("appModule", ['nav','item','ngRoute', 'authModule'])
.config(function($routeProvider){
	$routeProvider
	.when('/',{
	template: '<login>Loading Login </login>'
		
	})
	.when('/itemList',{
		template: '<item-list> loading Item List</item-list>'

	})
	.when('/signup',{
		template: '<signup> loading Item List</signup>'
	})
	.when('/newItem',{
		template: '<new-item> loading New Item</new-item>'
	})
})