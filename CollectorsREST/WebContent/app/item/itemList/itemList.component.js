angular.module('item')
.component('itemList', {
	templateUrl: 'app/item/itemList/itemList.component.html',
	controller: function(itemService){
		var vm = this;
		vm.items = []
		vm.reload = function(){
//			itemService.index().then(function(response){
//				vm.items = response.data
				vm.items = [{
						imageUrl: 'http://i.ebayimg.com/images/g/XbEAAOSww9xZA~V-/s-l1600.jpg',
						name: "stuff",
						currentValue: 220,
						purchasePrice : 10,
						purchaseDate: '1989-07-07'
				}]
				
//			})
		}
		vm.reload();
	},
	
	controllerAs: 'vm'
	
})