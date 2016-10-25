(function() {
    'use strict';
    
    function PostsController(PostFactory) {
    
        var vm = this;
        
        vm.getPosts = getPosts;
        vm.getPost = getPost;
        vm.createPost = createPost;
        vm.editPost = editPost;
        vm.deletePost = deletePost;
        
        
        activate();
            
        
        function activate() {
            getPosts()
        }
       
        function getPosts() {
            return PostFactory.getPosts()
                    .then(setPosts)
        }
        
        function getPost() {
            return PostFactory.getPost();
        }
       
        function createPost() {
            return PostFactory.createPost(vm.newPost)
                .then(getPosts)
        }
        
        function editPost() {
            
        
        }
    
        function deletePost() {
        
        }

        function setPosts(data) {
            return vm.posts = data;
        }
    };
    
    angular
        .module('app')
        .controller('PostsController', PostsController);
}());