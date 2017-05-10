angular.module('appModule')
.filter('capitalize', function(){
	return function(name){
		
		if(name){
			return name.charAt(0).toUpperCase() + name.substring(1);
		}
		
	}
})