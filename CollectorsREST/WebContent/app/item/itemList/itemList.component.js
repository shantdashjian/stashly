angular.module('item')
.component('itemList', {
	templateUrl: 'app/item/itemList/itemList.component.html',
	controller: function(itemService, $location){
		var vm = this;
//		vm.searchByName = $filter('searchByName');
		
		vm.items = [];
		vm.categories = [{name: "all"}];
		vm.selected = vm.categories[0];
		
		vm.clearUpdateStatus = function(){
			vm.items.forEach(function(item){
				item.updated = false;
			})
		}
		
		vm.reload = function(){
			itemService.index()
			.then(function(response){
				vm.items = response.data;
				vm.clearUpdateStatus();
			})
		}
		
		vm.reload();

		vm.category = function(){
			itemService.getCategories()
			.then(function(category){
				vm.categories = category.data;
				vm.categories.unshift({name: "all"})
				})
			}
		vm.category();

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
		
		vm.currentTotalValue = function (){
			var total = 0;
			vm.items.forEach(function(item){
				if (!item.retired){
					total += parseFloat(item.currentValue);
				}

			})
			return total;
		}
		vm.totalPurchasePrice = function (){
			var total = 0;
			vm.items.forEach(function(item){
				if (!item.retired){

					total += item.purchasePrice;
				}

			})
			return total;
		}

		vm.updateCurrentValues = function(){

			vm.items.forEach(function(item){
				itemService.updateCurrentValue(item.name)
				.then(function(response){
					item.currentValue  = response.data.findItemsByKeywordsResponse[0].searchResult[0].item[0].sellingStatus[0].currentPrice[0].__value__;
					itemService.update(item);
					item.updated = true;
					
				})

			})
		}

		vm.showItem = function(item){
			$location.path('/itemShow/'+item.id);
		}
		
		vm.updated = function(item){
			if (item.updated){
				return 'updated';
			} else {
				return 'not-updated';
			}
		}

	},

	controllerAs: 'vm',
	
	bindings:{
		keywords: '<'
	}

})

//				vm.items = [{
//						imageUrl: 'http://i.ebayimg.com/images/g/XbEAAOSww9xZA~V-/s-l1600.jpg',
//						name: "Uncanny X-Men (1963 1st Series) #2 FR 1.0",
//						currentValue: 220,
//						purchasePrice : 10,
//						purchaseDate: '1989-07-07'
//				},
//				{
//                    imageUrl: 'http://i.ebayimg.com/images/g/XbEAAOSww9xZA~V-/s-l1600.jpg',
//					name: "The X-Men #11 (May 1965, Marvel)",
//					currentValue: 500,
//					purchasePrice : 9000,
//					purchaseDate: '2001-07-07'
//
//				}
//				]

//			})
