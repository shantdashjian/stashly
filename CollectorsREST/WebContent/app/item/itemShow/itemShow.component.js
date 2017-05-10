angular.module('item')
.component('itemShow', {
	templateUrl : 'app/item/itemShow/itemShow.component.html',
	controller: function(itemService, $routeParams, $location, $document){
		var vm = this;
		vm.items = [];
		vm.currIndex = 0;
		
		var body = $document.find('body').eq(0);
		
		body.css("background-image", "url('" + 'images/comicbooks50.jpg' + "')");
		body.css("background-size", "cover");
		body.css("background-repeat", "repeat-y");
		
		if (!vm.item && parseInt($routeParams.id)) {
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

		};
		
		vm.retireItem = function(){
			var result = confirm('Are you sure you want to retire item?');
			if (result) {
				itemService.retire(vm.item).then(function(res){
					vm.goBackToItemList();
				});
			}
		}

		vm.reload = function(){
			itemService.index()
			.then(function(response){
			response.data.forEach(function(v){
				if(!v.retired){
					vm.items.push(v);
				}
			})
		})
	}
		vm.reload();
		
		vm.nextItem = function(){
			vm.currIndex++;
			if(vm.currIndex === vm.items.length){
			vm.currIndex = 0;
		
			}
			vm.item = vm.items[vm.currIndex];
	}


	vm.previousItem = function(){
		vm.currIndex--;
		if(vm.currIndex < 0){
		vm.currIndex = vm.items.length - 1;
		
}
		vm.item = vm.items[vm.currIndex];
		}
		
		vm.editItem = function(){
			$location.path("/update/" + $routeParams.id);
		}
	
	},
	controllerAs: 'vm'
})
	