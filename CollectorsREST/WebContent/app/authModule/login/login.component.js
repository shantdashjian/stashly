angular.module("authModule").component("login", {
	templateUrl : 'app/authModule/login/login.component.html',
	controller : function(authService, $location) {
		var vm = this;
		
		vm.login = function(user) {
			authService.login(user).then(function(res) {
				$location.path('/itemList')

			})

		}
	},
	controllerAs : 'vm'
});