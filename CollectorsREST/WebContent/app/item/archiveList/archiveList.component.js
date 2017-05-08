angular.module('item')
.component('archiveList', {
	templateUrl: 'app/item/archiveList/archiveList.component.html',
	controller: function(itemService, $location){
		var vm = this;
		
		vm.items = [];
		vm.categories = [];
		
		
		vm.reload = function(){
			itemService.index()
			.then(function(response){
				vm.items = response.data;
			})
		}

		vm.reload();

		vm.category = function(){
			itemService.getCategories()
			.then(function(category){
				vm.categories = category.data;
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
			vm.reload();

			vm.items.forEach(function(item){
				itemService.updateCurrentValue(item.name)
				.then(function(response){
					item.currentValue  = response.data.findItemsByKeywordsResponse[0].searchResult[0].item[0].sellingStatus[0].currentPrice[0].__value__;
					
					itemService.update(item);
				})
			})
		}

		vm.showItem = function(item){
			$location.path('/itemShowArchive/'+item.id);
		}
		
	},
	controllerAs: 'vm'
});