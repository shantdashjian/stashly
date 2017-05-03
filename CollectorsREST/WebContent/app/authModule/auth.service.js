angular.module('authModule').factory('authService', function($http, $cookies) {
	var service = {};
	var Base_Url = 'http://localhost:8080/CollectorsREST/'
	var saveToken = function(user) {
		$cookies.put('userId', user.id);
		$cookies.put('userEmail', user.email);
	}

	service.getToken = function() {
		return {
			id : $cookies.get('userId'),
			email : $cookies.get('userEmail')
		}
	}

	var removeToken = function() {
		$cookies.remove('userId', 'email');
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
			saveToken(data.res);
		})

	}

	service.signup = function(user) {
		return $http({
			method : 'POST',
			url : Base_Url + 'rest/signup',
			headers : {
				'Content-Type' : 'application/json'
			},
			data : user
		}).then(function(res) {
			saveToken(data.res);
		})

	}

	service.logout = function() {
		return $http({
			method : 'PUT',
			url : Base_Url + 'rest/logout',
			headers : {
				'Content-Type' : 'application/json'
			},
			data : user
		}).then(function(res) {
			removeToken(data.res);
		})

	}

	return service;
})