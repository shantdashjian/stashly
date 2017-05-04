angular.module('item')
	.component('newItem', {
		templateUrl: 'app/item/newItem/newItem.component.html',
		controller: function(itemService, categoryService, $location) {
			var vm = this;
			
			vm.conditions = [
				'poor',
				'fair',
				'good',
				'very good',
				'excellent',
				'mint/unopened'
			];
			
			vm.categories = [];
			
			var getCategories = function() {
				categoryService.index().then(function(res){
					res.data.forEach(function(v,i,a){
						vm.categories.push(v);
					});
				});
			};
			
			getCategories();
			
			vm.create = function(item) {
				console.log(item);
				itemService.create(item).then(function(res) {
					$location.path('/itemList');
				})
			}
		},
		controllerAs: 'vm'
	})