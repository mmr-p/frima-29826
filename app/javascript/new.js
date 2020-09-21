function calculate() {
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");


  itemPrice.addEventListener('input', function() {
    let formData = itemPrice.value;
    let fee = formData * 0.1;
    let sales = formData - fee;
    addTaxPrice.innerHTML = fee;
    profit.innerHTML = sales;

  });
}

window.addEventListener('load', calculate)