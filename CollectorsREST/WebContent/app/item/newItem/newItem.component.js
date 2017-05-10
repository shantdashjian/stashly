angular.module('item')
	.component('newItem', {
		templateUrl: 'app/item/newItem/newItem.component.html',
		controller: function(itemService, categoryService, $location, $document, $http) {
			var vm = this;
			
			var body = $document.find('body').eq(0);
			
			body.css("background-image", "url('" + 'images/comicbooks50.jpg' + "')");
			body.css("background-size", "cover");
			body.css("background-repeat", "repeat-y");
			
			vm.categories = [];
			vm.conditions = categoryService.conditions;
			
			var getCategories = function() {
				categoryService.index().then(function(res){
						vm.categories = res.data;
				});
			};
			
			getCategories();
			
			vm.create = function(item) {

				if (!item.imageUrl){
//					item.imageUrl = 'images/noimage.jpg';
					item.imageUrl = ' '
					
				}
				$http({
					method: 'GET',
					url: item.imageUrl
				})
				.then(function(res){
					itemService.create(item).then(function(res) {
						$location.path('/stash');
					})
					
				})
				.catch(function(error){
//					item.imageUrl = 'images/noimage.jpg';
					itemService.create(item).then(function(res) {
						$location.path('/stash');
					})
				})
			};
		},
		controllerAs: 'vm'
	})