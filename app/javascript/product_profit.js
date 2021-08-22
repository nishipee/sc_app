function calculateProfit() {
  const priceInput = document.getElementById("item-price")
  const addTax = document.getElementById("add-tax")
  const profit = document.getElementById("profit")

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value
    addTax.innerHTML = Math.floor(inputValue * 0.2)
    profit.innerHTML = Math.floor(inputValue * 0.8) 
  })
}

window.addEventListener("load", calculateProfit )