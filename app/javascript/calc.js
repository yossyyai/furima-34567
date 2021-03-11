function calc (){
  var price = document.getElementById('item-price')
  price.addEventListener('input', () => {
    price = document.getElementById('item-price').value;
    const tax = parseInt(Number(price) * 0.1);
    const profit = price - tax;
    document.getElementById('add-tax-price').innerHTML = tax;
    document.getElementById('profit').innerHTML = profit;
  });
}

window.addEventListener('load', calc);