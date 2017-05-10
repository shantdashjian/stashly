angular.module('static').component('notFound', {
		templateUrl : 'app/static/notFound/notFound.component.html',
		controller : function($document) {
			var vm = this;
			
			var body = $document.find('body').eq(0);

			body.css("background-image", "url('" + 'images/ironman.jpg' + "')");
			body.css("background-size", "cover");
			
			
		},
		controllerAs : 'vm'
	})