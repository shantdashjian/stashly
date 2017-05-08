angular.module("authModule").component("login", {
	templateUrl : 'app/authModule/login/login.component.html',
	controller : function(authService, $location, $document) {
		var vm = this;
		
		var body = $document.find('body').eq(0);


		vm.login = function(user) {
			authService.login(user).then(function(res) {

				$location.path('/itemList')
			})
		}
		
		vm.signup = function(){
			$location.path('/signup')
		}
		
		
		body.css("background-image", "url('" + 'images/captainamerica.jpg' + "')");
		body.css("background-size", "cover");
	},
	controllerAs : 'vm'
});