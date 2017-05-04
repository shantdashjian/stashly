angular.module("authModule").component("logout", {
	templateUrl : 'app/authModule/logout/logout.component.html',
	controller : function(authService, $location, $cookies) {
		var vm = this;
		vm.showButton = $cookies.get("id");
		console.log(vm.showButton);
		vm.logout = function() {
			authService.logout().then(function(res) {
				$location.path('/')

			})

		}
	},
	controllerAs : 'vm'
});