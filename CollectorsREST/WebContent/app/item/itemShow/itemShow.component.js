angular.module('item')
.component('itemShow', {
	templateUrl : 'app/item/itemShow/itemShow.component.html',
	controller: function(itemService, $routeParams, $location){
		var vm = this;
		
		if (!vm.item && parseInt($routeParams.id)) {
			console.log('getting item');
			itemService.show($routeParams.id)
			.then(function(response){
				vm.item = response.data;
			})
			.catch(function(error){
			    $location.path('/notfound');
			})
		};
		
		vm.goBackToItemList = function(){
		    $location.path('/itemList');

		}
	},
	controllerAs: 'vm'
})
	