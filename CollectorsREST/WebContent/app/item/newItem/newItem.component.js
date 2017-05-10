angular.module('item')
	.component('newItem', {
		templateUrl: 'app/item/newItem/newItem.component.html',
		controller: function(itemService, categoryService, $location, $document) {
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

				itemService.create(item).then(function(res) {
					$location.path('/itemList');
				})
			};
		},
		controllerAs: 'vm'
	})