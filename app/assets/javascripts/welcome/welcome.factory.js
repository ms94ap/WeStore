(function() {

	function PostFactory($http) {
		return {
			showPosts: showPosts
		}

		function showPosts() {
			console.log("hello!")
			return $http.get('/posts', {'Content-Type': 'application/json'})
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