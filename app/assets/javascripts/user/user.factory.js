(function(){
	function UserFactory($http) {
		return {
			getUser: getUser,
			editUser: editUser
		}

		function getUser() {
			return $http.get('/users/:id')
				.then(handleResponse)
				.catch(handleError);

		}

		function editUser(user){
			return $http.post('users/:id')
					.then(handleResponse)
					.catch(handleError);
		}

		function handleResponse(response) {
			console.log(response)
			return response.data

		}

		function handleError(error) {
			console.log(error);
		}
	}

	angular
		.module('app')
		.factory('UserFactory', UserFactory)
}());