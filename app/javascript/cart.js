var selectedProducts = [];
var selectedProductQuantities = {};

function ids(productId, productPrice) {
  var quantityInput = document.getElementById('quantity_' + productId);
  var quantity = parseInt(quantityInput.value);

  if (quantity > 0) {
    var existingProductIndex = selectedProducts.findIndex(product => product.productId === productId);

    if (existingProductIndex !== -1) {
      selectedProducts[existingProductIndex].quantity += quantity;
      selectedProductQuantities[productId] += quantity;
    } else {
      selectedProducts.push({
        productId: productId,
        quantity: quantity,
        price: productPrice
      });
      selectedProductQuantities[productId] = quantity;
    }
    updateCartCount(Object.keys(selectedProductQuantities).length)
    updateQuantitySpace(selectedProducts);
    
  } else {
    console.error("La cantidad no es válida");
  }
}

function updateQuantitySpace(selectedProducts) {
  var quantitySpace = document.getElementById('quantity_space');
  quantitySpace.textContent = JSON.stringify(selectedProducts);
}
function updateCartCount(count) {
  var cartCountElement = document.getElementById('cartCount');
  cartCountElement.textContent = count;
}

function resetIds() {
  selectedProductQuantities = {};
  selectedProductCount = 0;

  updateQuantitySpace(selectedProductQuantities);
  updateCartCount(selectedProductCount);
}

function saveIds() {
  var idsAndQuantities = Object.entries(selectedProductQuantities).map(([id, quantity]) => id + ":" + quantity);
  var url = '/sales/new?selected_ids_and_quantities=' + idsAndQuantities.join(',');
  window.location.href = url;
}

document.addEventListener('DOMContentLoaded', function () {
  window.ids = ids;
  window.resetIds = resetIds;
});

window.addEventListener('beforeunload', function () {
  resetIds();
});