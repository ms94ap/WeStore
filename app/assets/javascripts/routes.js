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
				// .state('home.signup', {
				// 	url: '/singup',
				// 	templateUrl: 'user/singup.html',
				// 	controller: 'SingupController as vm'
				// })

			$urlRouterProvider.otherwise('welcome');
		})
}());