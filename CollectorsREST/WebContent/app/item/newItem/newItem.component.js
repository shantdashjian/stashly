angular.module('item')
	.component('newItem', {
		templateUrl: 'app/item/newItem/newItem.component.html',
		controller: function(itemService, categoryService, $location) {
			var vm = this;
			
			vm.categories = [];
			vm.conditions = categoryService.conditions;
			
			var getCategories = function() {
				categoryService.index().then(function(res){
						vm.categories = res.data;
				});
			};
			
			getCategories();
			
			vm.create = function(item) {

				itemService.create(item).then(function(res) {
					$location.path('/itemList');
				})
			};
		},
		controllerAs: 'vm'
	})