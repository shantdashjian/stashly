angular.module("appModule", ['nav','item','ngRoute', 'authModule', 'chartModule'])
.config(function($routeProvider){
	$routeProvider

	// Home path for both login and sign up on home page. DB
	.when('/',{
	template: '<login>Loading Login </login>'


	})
	.when('/itemList',{
		template: '<item-list> loading Item List</item-list>'
	})
	.when('/itemShow/:id',{
		template: '<item-show> loading Item show</item-show>'
	})
	.when('/itemShowArchive/:id',{
		template: '<item-show-archive> loading Item show</item-show-archive>'
	})
	.when('/signup',{
        template: '<signup> loading Item List</signup>'
	})
	.when('/add',{
		template: '<new-item> loading New Item</new-item>'
	})
	.when('/update/:id',{
		template: '<update-item> loading update Item</update-item>'
	})
	.when('/search/:keywords',{
		template: '<search-results> loading search-results</search-results>'
	})
	.when('/archive',{
		template: '<archive-list> loading archive</archive-list>'
	})

})
