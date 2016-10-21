(function() {
'use strict'
	function PostFactory($http) {
		return {
			showPosts: showPosts
		}

		function showPosts() {
			
			return $http.get('/')
				.then(handleResponse)
				.catch(handleError);

		}

		function handleResponse(response) {
			console.log(response)
			return response.data

		}

		function handleError(error) {
			console.log(error)
		}

	}

	angular
		.module('app')
		.factory('PostFactory', PostFactory)

}());