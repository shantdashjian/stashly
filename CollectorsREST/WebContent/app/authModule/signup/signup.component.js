angular.module("authModule").component("signup",{
	templateUrl : 'app/authModule/signup	/signup.component.html',
	controller : function(authService, $location, $document) {
		var vm = this;
		
		var body = $document.find('body').eq(0);
		
		body.css("background-image", "url('" + 'images/captainamerica.jpg' + "')");
		body.css("background-size", "cover");
		
		vm.signup = function(user) {
			console.log(user)
			authService.signup(user).then(function(res) {
				body.css("background-image", "url('')");
				$location.path('/stash')
			})
		}
	},
	controllerAs : 'vm'
});