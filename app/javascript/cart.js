var selectedProducts = []; // Array para almacenar los productos seleccionados
var selectedProductQuantities = {}; // Objeto para almacenar id:cantidad

function ids(productId, productPrice) {
  // Obtener la cantidad desde el input correspondiente
  var quantityInput = document.getElementById('quantity_' + productId);
  var quantity = parseInt(quantityInput.value);

  // Verificar que la cantidad sea válida
  if (quantity > 0) {
    // Comprobar si el producto ya está en el array
    var existingProductIndex = selectedProducts.findIndex(product => product.productId === productId);

    if (existingProductIndex !== -1) {
      // Si el producto ya está en el array, actualizar la cantidad
      selectedProducts[existingProductIndex].quantity += quantity;
      selectedProductQuantities[productId] += quantity;
    } else {
      // Si el producto no está en el array, agregarlo
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

  // Actualizar el espacio de cantidad (si es necesario)
  updateQuantitySpace(selectedProductQuantities);
  // Actualizar el conteo en el botón del carrito
  updateCartCount(selectedProductCount);
}

function saveIds() {
  // Redirigir a una nueva URL con los IDs y cantidades como parámetros
  var idsAndQuantities = Object.entries(selectedProductQuantities).map(([id, quantity]) => id + ":" + quantity);
  var url = '/sales/new?selected_ids_and_quantities=' + idsAndQuantities.join(',');
  window.location.href = url;
}

document.addEventListener('DOMContentLoaded', function () {
  // Hacer las funciones accesibles globalmente
  window.ids = ids;
  window.resetIds = resetIds;
});

window.addEventListener('beforeunload', function () {
  resetIds();
});