angular.module('nav').component('navigation', {

	templateUrl : 'app/nav/navigation/navigation.component.html',
	controller : function(authService, $location) {
		var vm = this;
		vm.keywords = null;
		
		vm.logout = function() {
			authService.logout().then(function(res) {

				$location.path('/')

			})

		};
		
		vm.submit = function(keywords){
			$location.path('/search/' + keywords);
		}
	},

	controllerAs : 'vm'
})
