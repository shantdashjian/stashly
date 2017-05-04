angular.module('item')
	.component('newItem', {
		templateUrl: 'app/item/newItem/newItem.component.html',
		controller: function(itemService, $location, $routeParams) {
			var vm = this;
			
			vm.categories = itemService.getCategories();
			vm.conditions = itemService.conditions;
			
			vm.item = 0;
				
			if (!vm.item && parseInt($routeParams.id)) {
				itemService.show($routeParams.id)
				.then(function(response){
					vm.item = response.data;
				})
				.catch(function(error){
				    $location.path('/notfound');
				})
			};
			
			vm.update = function(item) {

				itemService.update(item).then(function(res) {
					$location.path('/itemList');
				})
			};
		},
		controllerAs: 'vm'
});