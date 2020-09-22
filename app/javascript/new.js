function calculate() {
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");


  itemPrice.addEventListener('input', function() {
    let formData = itemPrice.value;
    let fee = Math.floor(formData * 0.1);
    let sales = formData - fee;
    fee = String(fee).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
    addTaxPrice.innerHTML = fee;

    sales = String(sales).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
    profit.innerHTML = sales;

  });
}

window.addEventListener('load', calculate)