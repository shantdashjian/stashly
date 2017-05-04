angular.module('authModule').factory('authService',
		function($http, $cookies, $location) {
			var service = {};
			var Base_Url = 'http://localhost:8080/CollectorsREST/'
			var saveToken = function(user) {
				$cookies.put('id', user.id);
				$cookies.put('username', user.username);
			}

			service.getToken = function() {
				return {
					id : $cookies.get('id'),
					username : $cookies.get('username')
				}
			}

			var removeToken = function() {
				$cookies.remove('id', 'email');
			}

			service.login = function(user) {
				return $http({
					method : 'POST',
					url : Base_Url + 'rest/login',
					headers : {
						'Content-Type' : 'application/json'
					},
					data : user
				}).then(function(res) {
					saveToken(res.data);
				})

			}

			service.signup = function(user) {
				console.log(user)
				return $http({
					method : 'POST',
					url : Base_Url + 'rest/signup',
					headers : {
						'Content-Type' : 'application/json'
					},
					data : user
				}).then(function(res) {
					saveToken(res.data);
				})

			}

			service.logout = function() {
				return $http({
					method : 'POST',
					url : Base_Url + 'rest/logout',
			}).then(function(res) {
				removeToken(res.data);
			})

			}

			return service;
		})