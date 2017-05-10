angular.module('item')
.component('archiveList',{
	templateUrl: 'app/item/archiveList/archiveList.component.html',
	controller: function(itemService, priceService, $location, $filter, $document){

		var vm = this;
		
		var body = $document.find('body').eq(0);
		
		body.css("background-image", "url('" + 'images/comicbooks50.jpg' + "')");
		body.css("background-size", "cover");
		body.css("background-repeat", "repeat-y");

		vm.buttonLoad = false;
		var updatedItem = new Map();
		var inflationPrice = new Map();
		vm.items = [];

		vm.selected = {name: "all "};
		
		vm.clearUpdateStatus = function(){
			vm.items.forEach(function(item){
				updatedItem.set(item.id, false);
			})
		}
		
		vm.reload = function(){
			itemService.index()
			.then(function(response){
				vm.items = response.data;
				vm.items.forEach((item) => {
					itemService.getInflation(item)
						.then(function(res){
							inflationPrice.set(item.id, res.data.substring(4,res.data.length-2));
					
						})
				})
				vm.clearUpdateStatus();
			
			
			})
		}
		
		vm.reload();
		// injected filters
		var categorySort = $filter('categorySort');
		var searchByName = $filter('searchByName');
		
		vm.category = function(){
			itemService.getCategories()
			.then(function(category){
				vm.categories = category.data;
				vm.categories.unshift({name: "all"})
				vm.selected = vm.categories[0];
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
			var items = searchByName(vm.items, vm.keywords);
			items = categorySort(items, vm.selected.name);
			items.forEach(function(item){
			if(item.retired)
				total += parseFloat(item.currentValue);
			})			
			return total;
		}
		

		
		vm.totalPurchasePrice = function (){
			var total = 0;
			var items = searchByName(vm.items, vm.keywords);
			items = categorySort(items, vm.selected.name);
			items.forEach(function(item){
				if (item.retired){
					total += item.purchasePrice;
				}

			})
			return total;
		}

		vm.updateCurrentValues = function(){
			vm.buttonLoad = true;
			
			var stamp = new Date();

			vm.items.forEach(function(item){
				itemService.updateCurrentValue(item.name)
				.then(function(response){

					item.currentValue  = response.data.findItemsByKeywordsResponse[0].searchResult[0].item[0].sellingStatus[0].currentPrice[0].__value__;
					
					var price = {
							itemPrice: item.currentValue,
							date: stamp
					};
										
					itemService.update(item);
					priceService.create(price, item.id);

					vm.buttonLoad = false;

					updatedItem.set(item.id, true);
				})

			})

		}

		vm.showItem = function(item){
			$location.path('/itemShowArchive/'+item.id);
		}
		
		vm.updated = function(item){
			if (updatedItem.get(item.id) && item.currentValue >= item.purchasePrice){
				return 'updated-up';
			} else if (updatedItem.get(item.id) && item.currentValue < item.purchasePrice){
				return 'updated-down';
			} else {
				return 'not-updated';
			}
		}
		
		vm.getInflationPrice = function(item){
			return inflationPrice.get(item.id);
		}
			

	},

	controllerAs: 'vm',
	
	bindings:{
		keywords: '<'
	}

})

