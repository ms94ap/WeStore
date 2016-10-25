(function() {
	'use strict'
	function UserController(UserFactory, $state) {

		var vm = this;
		vm.user = user;
		vm.editUser = editUser;

		activate();

		function activate() {
			getUser().then(setUser)
		}

		function getUser(){
			return UserFactory.getUser();
		}

		function setUser(){
			return vm.user = data;
		}		

		function updateUser(user){
		   UserFactory.editUser(vm.user)
	}


	angular
		.module('app')
		.controller('UserController', UserController)
}());