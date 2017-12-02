receta = angular.module('receta',[
    'templates',
    'ngRoute',
    'controllers',
])

receta.config(['$routeProvider',
    ($routeProvider)->
        $routeProvider
            .when('/',
            templateUrl: 'index.html',
            controller: 'RecipesController')
])

# list of recipes to search through
recipes = [
  {
    id: 1
    name: 'Baked Potato w/ Cheese'
  },
  {
    id: 2
    name: 'Garlic Mashed Potatoes',
  },
  {
    id: 3
    name: 'Potatoes Au Gratin',
  },
  {
    id: 4
    name: 'Baked Brussel Sprouts',
  },
]

controllers = angular.module('controllers', [])

# $routeParams for access to the query string, $location for routing
controllers.controller('RecipesController', ['$scope','$routeParams', '$location',
    ($scope, $routeParams, $location)->
        # re-routes to self with the keywords in the query string
        $scope.search = (keywords)-> $location.path('/').search('keywords', keywords)

        if $routeParams.keywords
            keywords = $routeParams.keywords.toLowerCase()
            $scope.recipes = recipes.filter (recipe)-> recipe.name.toLowerCase().indexOf(keywords) != -1
        else
            $scope.recipes = []
])