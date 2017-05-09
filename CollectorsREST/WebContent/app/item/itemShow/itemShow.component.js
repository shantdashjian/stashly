angular.module('item')
.component('itemShow', {
	templateUrl : 'app/item/itemShow/itemShow.component.html',
	controller: function(itemService, $routeParams, $location){
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
		
		vm.editItem = function(){
			$location.path("/update/" + $routeParams.id);
		}
	},
	controllerAs: 'vm'
})
	