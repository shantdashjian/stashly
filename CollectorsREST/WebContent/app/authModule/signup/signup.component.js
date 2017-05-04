angular.module("authModule").component("signup", {
	templateUrl : 'app/authModule/signup	/signup.component.html',
	controller : function(authService, $location) {
		var vm = this;
		vm.signup = function(user) {
			console.log(user)
			authService.signup(user).then(function(res) {
				$location.path('/itemList')

			})
		}
	},
	controllerAs : 'vm'
});