angular.module('item')
	.component('newItem', {
		templateUrl: 'app/item/newItem/newItem.component.html',
		controller: function(itemService, $location) {
			var vm = this;
			
			vm.conditions = [
				'poor',
				'fair',
				'good',
				'very good',
				'excellent',
				'mint/unopened'
			];
			
			vm.create = function(item) {
				console.log(item);
				itemService.create(item).then(function(res) {
					$location.path('/itemList');
				})
			}
		},
		controllerAs: 'vm'
	})