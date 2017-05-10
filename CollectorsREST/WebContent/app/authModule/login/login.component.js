angular.module("authModule").component("login", {
	templateUrl : 'app/authModule/login/login.component.html',
	controller : function(authService, $location, $document) {
		var vm = this;
		
		var body = $document.find('body').eq(0);

		body.css("background-image", "url('" + 'images/captainamerica.jpg' + "')");
		body.css("background-size", "cover");
		body.css("background-repeat", "no-repeat");
		body.css("background-attachment", "fixed");
		body.css("background-position", "0% 40%");

		vm.error = false;
		vm.login = function(user) {
			authService.login(user)
			.then(function(res) {
				body.css("background-image", "url('')");
				body.css("background-repeat", "repeat-y");
				body.css("background-attachment", "");
				body.css("background-position", "");
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