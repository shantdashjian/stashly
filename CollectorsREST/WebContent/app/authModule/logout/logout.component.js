angular.module("authModule").component("logout", {
	templateUrl : 'app/authModule/logout/logout.component.html',
	controller : function(authService, $location, $cookies) {
		var vm = this;
		vm.showButton = $cookies.get('id');
		var showLogoutButton = function() {
			vm.showButton = $cookies.get('id');
		};
		
		vm.logout = function() {
			authService.logout().then(function(res) {
				vm.showLogoutButton();
				$location.path('/')

			})

		}
	},
	controllerAs : 'vm'
});