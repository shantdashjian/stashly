angular.module('nav')
.component('navigation', {
	
	templateUrl: 'app/nav/navigation/navigation.component.html',
	controller: function(authService, $location){
		var vm = this;
//
//vm.userLoggedIn = function(){
//    if(!authService.getToken().id){
//        return false;
//    } else {
//        return true;
//    }
//}
//
//vm.login = function(){
//    $location.path(“/login”);
//}
//
//vm.register = function(){
//    $location.path(“/register”);
//}

//vm.makeActive = function($event){
//        var $allNavbarButtons = angular.element($event.currentTarget).parent().children();
//        $allNavbarButtons.each(function(){
//            $(this).removeClass(‘active’);
//        });
//        angular.element($event.currentTarget).addClass(‘active’);
//    }
//

},
	
	controllerAs: 'vm'
	
	
})

