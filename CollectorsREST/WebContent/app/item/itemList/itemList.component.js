angular.module('item')
.component('itemList', {
	templateUrl: 'app/item/itemList/itemList.component.html',
	controller: function(itemService){
		var vm = this;
		vm.items = []
		vm.reload = function(){
			itemService.index().then(function(response){
				vm.items = response.data
				
			})
		}
		vm.reload();
	},
	
	controllerAs: 'vm'
	
})