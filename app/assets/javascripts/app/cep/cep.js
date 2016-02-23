angular.module('cep', [])
  .controller('CEPController', function ($scope, $window, SessionService, CEPService, CartService) {
    $scope.cep = '';

    $scope.proceed = function (cep) {
      CEPService.query({cep: cep}).$promise.then(function (data) {
        SessionService.setCEP(data.ceps);
        $window.location.href = cep+'/supermarkets';
      }, function (err) {
        $scope.error = 'Ainda não estamos trabalando com o CEP informado.';
      })
    }

  })
  .factory('CEPService', function ($resource) {
    return $resource('/api/ceps/:id', {}, {
      query: {method: 'GET', isArray: false}
    });
  })
