angular.module('item')
.component('itemShowArchive', {
	templateUrl : 'app/item/itemShowArchive/itemShowArchive.component.html',
	controller: function(itemService, $routeParams, $location, $document){
		var vm = this;
		vm.items = [];
		vm.currIndex = 0;
		
		
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
		
		vm.reload = function(){
			itemService.index()
			.then(function(response){
			response.data.forEach(function(v){
				if(v.retired){
					vm.items.push(v);
				}
			})
		})
	}
		vm.reload();
		
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


			vm.nextItem = function(){
					vm.currIndex++;
					console.log(vm.currindex)
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

		
		vm.deleteItem = function(){
			itemService.destroy(vm.item).then(function(res){
				console.log(vm.item);
				vm.goBackToArchiveList();
				
			});
		}
		
	},
	controllerAs: 'vm'
})
	