(function() {
	angular
		.module('app')
		.config(function($stateProvider, $urlRouterProvider){
			$stateProvider
				.state("welcome", {
					url:'/welcome',
					templateUrl: 'welcome/welcome.html',
					controller: 'WelcomeController as vm'
				})
				.state('users/:id', {
					url: '/users/:id',
					templateUrl: 'user/user.html',
					controller: 'UserController as vm'
				})
				.state('users/:id/edit')

			$urlRouterProvider.otherwise('welcome');
		})
}());