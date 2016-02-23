angular.module('session', [])
  .factory('SessionService', function (store) {
    return {
      setCEP: function (cep) {
        store.set('cep', cep);
      },

      getCEP: function () {
        return store.get('cep');
      },

      deleteCEP: function () {
        store.remove('cep');
      },

      setSupermarket: function (supermarket) {
        store.set('supermarket', supermarket)
      },

      getSupermarket: function () {
        return store.get('supermarket')
      },

      deleteSupermarket: function () {
        store.remove('supermarket');
      },

      newCart: function (supermarket_id) {
        if (!store.get(String(supermarket_id))) {
          store.set(String(supermarket_id), []);
        } else {
          return;
        }
      },

      addProduct: function (supermarket_id, product) {
        var cart = store.get(supermarket_id);
        cart.push(product);
        store.set(String(supermarket_id), cart);
      },

      removeProduct: function (supermarket_id, product) {
        var cart = store.get(String(supermarket_id));
        for (var i in cart) {
          if (cart[i].id == product.id) {
            cart.splice(i, 1);
          }
        }
        store.set(String(supermarket_id), cart);
      },

      getCart: function (supermarket_id) {
        return store.get(String(supermarket_id));
      },

      getTotalCart: function (supermarket_id) {
        var cart = store.get(supermarket_id);
        var price = 0;
        for (var i in cart) {
          price += Number(cart[i].price);
        }
        return price;
      },

      deleteCart: function () {
        store.remove('cart');
      },

      getTotalItens: function (supermarket_id) {
        var cart = store.get(String(supermarket_id));
        return cart.length;
      },

      getItemsCart: function (supermarket_id) {
        var cart = store.get(String(supermarket_id));
        var items = cart.reduceRight(function (r, a) {
            r.some(function (b) { return a.name === b.name; }) || r.push(a);
            return r;
        }, []);
        return items;
      },

      resetCart: function (supermarket_id) {
        store.remove(String(supermarket_id));
      }
    }
  })
