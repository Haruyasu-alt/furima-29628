window.addEventListener('load', () => {
  const newLocal = "item-price";
  const priceInput = document.getElementById(newLocal);
  priceInput.addEventListener("input", function () {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue*0.1)
    const profit = document.getElementById("profit");
    profit.innerHTML = Math.ceil(inputValue*0.9)
  })
});