angular.module('cart', [])
  .factory('CartService', function(SessionService) {
    return {
      addProduct: function (supermarket_id, product) {
        SessionService.addProduct(supermarket_id, product);
      },

      removeProduct: function (supermarket_id, product) {
        SessionService.removeProduct(supermarket_id, product)
      },

      getTotalCart: function (supermarket_id) {
        return SessionService.getTotalCart(supermarket_id);
      },

      buy: function () {

      },

      getCart: function (supermarket_id) {
        return SessionService.getCart(supermarket_id);
      },

      newCart: function (supermarket_id) {
        SessionService.newCart(supermarket_id);
      },

      deleteCart: function (supermarket_id) {
        SessionService.deleteCart(supermarket_id);
      },

      getTotalItens: function (supermarket_id) {
        return SessionService.getTotalItens(supermarket_id);
      },

      getItemsCart: function (supermarket_id) {
        return SessionService.getItemsCart(supermarket_id);
      },

      resetCart: function (supermarket_id) {
        SessionService.resetCart(supermarket_id);
      }
    }
  });
