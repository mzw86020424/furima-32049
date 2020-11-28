window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const addProfit = document.getElementById("profit")

  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value
    addTaxPrice.innerHTML = inputValue * 0.1
    addProfit.innerHTML = inputValue - inputValue * 0.1
  });
})