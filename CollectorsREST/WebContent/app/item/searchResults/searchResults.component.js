angular.module('item')
.component('searchResults', {
	templateUrl: 'app/item/searchResults/searchResults.component.html',
	controller: function($routeParams){
		var vm = this;
		vm.keywords = $routeParams.keywords;
	},
	controllerAs: 'vm'
})