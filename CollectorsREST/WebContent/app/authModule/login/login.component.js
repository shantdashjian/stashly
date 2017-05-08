angular.module("authModule").component("login", {
	templateUrl : 'app/authModule/login/login.component.html',
	controller : function(authService, $location) {
		var vm = this;
		vm.error = false;
		vm.login = function(user) {
			authService.login(user)
			.then(function(res) {
				$location.path('/itemList')
			})
			.catch(function(error){
				vm.error = true;
			})
		}
		
		vm.signup = function(){
			$location.path('/signup')
		}
	},
	controllerAs : 'vm'
});