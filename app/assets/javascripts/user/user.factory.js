(function(){
	function UserFactory($http) {
		return {
			getUser: getUser;
			editUser: editUser;
		}

		function getUser() {
			return $http.get('/users/:id')
				.then(handleResponse)
				.catch(handleError);

		}

		function editUser(){
			return $http.post('users/:id/edit')
			//edit needs more editing
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
		.factory('UserFactory', UserFactory)
}());