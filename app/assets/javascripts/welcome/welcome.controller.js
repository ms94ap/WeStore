(function() {
	'use strict'
	function WelcomeController($scope, PostFactory, $filter) {
		var vm = this;
		vm.search= '';


		vm.showPosts = showPosts;
		// vm.deletePostAdmin = deletePostAdmin;

		activate();

		function activate() {
			showPosts();
		}
 		
		function showPosts() {
			return PostFactory.showPosts()
				.then(setPosts)
		}

		function setPosts(data) {
			return vm.posts = data;
		}

		vm.filteredPosts = $filter('filter')(vm.posts, vm.search);
		
		vm.refilter = function(){
	      vm.filteredPosts = $filter('filter')(vm.posts, vm.search);
		
		}

	}

	angular
		.module('app')
		.controller('WelcomeController', WelcomeController)
}());