(function() {
	'use strict'
	function WelcomeController(PostFactory) {
		var vm = this;


		vm.showPosts = showPosts;
		// vm.deletePostAdmin = deletePostAdmin;

		activate();

		function activate() {
			showPosts()
		}
 		
		function showPosts() {
			return PostFactory.showPosts()
				.then(setPosts)
		}

		function setPosts(data) {
			return vm.posts = data;
		}

	}

	angular
		.module('app')
		.controller('WelcomeController', WelcomeController)
}());