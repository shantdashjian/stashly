angular.module('item')
.component('itemShowArchive', {
	templateUrl : 'app/item/itemShowArchive/itemShowArchive.component.html',
	controller: function(itemService, $routeParams, $location, $document){
		var vm = this;
		
		var body = $document.find('body').eq(0);
		
		body.css("background-image", "url('" + 'images/comicbooks.jpg' + "')");
		body.css("background-size", "cover");
		
		if (!vm.item && parseInt($routeParams.id)) {
			itemService.show($routeParams.id)
			.then(function(response){
				vm.item = response.data;
			})
			.catch(function(error){
			    $location.path('/notfound');
			})
		};
		
		vm.goBackToArchiveList = function(){
		    $location.path('/archive');

		};
		
		vm.editItem = function(){
			$location.path("/update/" + $routeParams.id);
		}
		
		vm.retireItem = function(){
			
				itemService.returnItem(vm.item).then(function(res){
					vm.goBackToArchiveList();
				});
			
		}
vm.nextItem = function(item){
			
			vm.item.id = vm.item.id + 1;
			if(vm.retired === true){
			$location.path("/itemShowArchive/" + vm.item.id);
			itemService.show(vm.item.id).then(function(res){
				vm.item = res.data;
			console.log(vm.item);
		})
	}
			else{
				$location.path("/itemShowArchive/1");
			
			}
	}
			
		vm.previousItem = function(){
			vm.item.id = vm.item.id - 1;
			$location.path("/itemShowArchive/" + vm.item.id);
			console.log(vm.item.id);
     			itemService.show(vm.item.id).then(function(res){
				vm.item = res.data;
				if(vm.item.description === undefined){
					console.log(vm.item.description);
					$location.path("/itemShowArchive/1");
				}
			});
		
		vm.deleteItem = function(){
			itemService.destroy(vm.item).then(function(res){
				vm.goBackToArchiveList();
			});
		}
	}
		
	},
	controllerAs: 'vm'
})
	