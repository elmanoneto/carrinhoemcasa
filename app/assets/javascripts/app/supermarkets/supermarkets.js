  angular.module('supermarkets', [])
  .controller('SupermarketsController', function ($scope, $window,
    SessionService, SupermarketsService, $location) {

    $scope.cep = SessionService.getCEP();

    SupermarketsService.query({cep: $scope.cep.id}).$promise.then(function (data) {
      SessionService.setSupermarket(data.supermarkets)
      $scope.supermarkets = data.supermarkets;
    }, function (err) {
      console.log(err);
    })

    $scope.goToSupermarket = function (id) {
      $window.location.href = '/supermarkets/'+id+'/categories';
    }
  })
  .factory('SupermarketsService', function ($resource) {
    return $resource('/api/supermarkets/:id', {}, {
      query: {method: 'GET', isArray: false}
    })
  })
