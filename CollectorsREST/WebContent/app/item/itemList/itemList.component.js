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
						name: "Stuff",
						currentValue: 220,
						purchasePrice : 10,
						purchaseDate: '1989-07-07'
				},
				{					
                    imageUrl: 'http://i.ebayimg.com/images/g/XbEAAOSww9xZA~V-/s-l1600.jpg',
					name: "More Stuff",
					currentValue: 500,
					purchasePrice : 9000,
					purchaseDate: '2001-07-07'
					
				}
				]
			
//			})
		}
		vm.orderBy = null;
		vm.reverse = false;
		vm.changeOrderBy = function (columnName){
			if (vm.orderBy === columnName) {
                if (!vm.reverse) {
                    vm.reverse = true;
                } else {
                    vm.reverse = false;
                    vm.orderBy = null;
                }
            } else {
                vm.orderBy = columnName;
            }
			
		}
		vm.reload();
	},
	
	controllerAs: 'vm'
	
})