angular.module('categories', [])
  .controller('CategoriesController', function ($scope, $window, SessionService,
    ProductsService, CartService) {

    var supermarket_id =  $window.location.pathname.match(/\d+/)[0];
    CartService.newCart(supermarket_id);
    $scope.totalCart = CartService.getTotalCart(supermarket_id);
    $scope.totalItens = CartService.getTotalItens(supermarket_id);
    $scope.supermarkets = SessionService.getSupermarket(supermarket_id);
    $scope.itemsCart = CartService.getItemsCart(supermarket_id);


    ProductsService.query({supermarket: supermarket_id}).$promise.then(function (data) {
      $scope.products = data.products;
    }, function (err) {
      console.log(err);
    });

    $scope.add = function (product) {
      CartService.addProduct(supermarket_id, product);
      $scope.totalCart = CartService.getTotalCart(supermarket_id);
      $scope.totalItens = CartService.getTotalItens(supermarket_id);
      $scope.itemsCart = CartService.getItemsCart(supermarket_id)
    }

    $scope.remove = function (product) {
      CartService.removeProduct(supermarket_id, product);
      $scope.totalCart = CartService.getTotalCart(supermarket_id);
      $scope.totalItens = CartService.getTotalItens(supermarket_id);
      $scope.itemsCart = CartService.getItemsCart(supermarket_id)
    }

    $scope.buy = function () {
      $window.location.href = "buy";
    }

    $scope.end = function () {
      CartService.resetCart(supermarket_id);
      $window.location.href = "/";
    }

    $scope.back = function () {
      $window.history.go(-1);
    }

  })
  .factory('ProductsService', function ($resource) {
    return $resource('/api/products/:id', {}, {
      query: {method: 'GET', isArray: false}
    })
  })
