angular.module('item')
	.component('updateItem', {
		templateUrl: 'app/item/updateItem/updateItem.component.html',
		controller: function(itemService, categoryService, $location, $routeParams, $document, $http) {
			var vm = this;
			
			var body = $document.find('body').eq(0);
			
			body.css("background-image", "url('" + 'images/comicbooks50.jpg' + "')");
			body.css("background-size", "cover");
			body.css("background-repeat", "repeat-y");
			
			vm.categories = [];
			vm.conditions = categoryService.conditions;
			vm.item = {};
			vm.editItem = null;
			
			var setEditItem = function(){
				vm.editItem = angular.copy(vm.item);
			}
			
			var getCategories = function() {
				categoryService.index().then(function(res){
						vm.categories = res.data;
				});
			};
			
			getCategories();
			
//			if (!vm.item && parseInt($routeParams.id)) {
				itemService.show($routeParams.id)
				.then(function(response){
					vm.item = response.data;
					setEditItem();
				})
				.catch(function(error){
				    $location.path('/notfound');
				})
//			};
			
			vm.update = function(item) {

					if (!item.imageUrl){
//						item.imageUrl = 'images/noimage.jpg';
						item.imageUrl = ' '

						
					}
					$http({
						method: 'GET',
						url: item.imageUrl
					})
					.then(function(res){
						itemService.update(item).then(function(res) {
							$location.path('/stash');
						})
						
					})
					.catch(function(error){
//						item.imageUrl = 'images/noimage.jpg';
						itemService.update(item).then(function(res) {
							$location.path('/stash');
						})
					})
				
			};
		},
		controllerAs: 'vm',
});