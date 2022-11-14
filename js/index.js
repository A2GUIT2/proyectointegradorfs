let allContainerCart = document.querySelectorAll('.producto');

let containerBuyCart = document.querySelector('.productos');

let priceTotal = document.querySelector('.precio-total')

let butTrings =[];

let totalCart = 0;

loadEventListenrs();
function loadEventListenrs(){
    allContainerCart.addEventListener('click' , addProduct);

    containerBuyCart.addEventListener('click', deleteProducto);
}

function addProduct(e){
    e.preventDefault();
    if (e.target.classList.contains ('btn-add-cart')){
        const selectProduct = e.target.parentElement;
        readTheContent(selectProduct);
    }
    
}

function deleteProducto(e){
    if (e.target.classList.contains ('delete-product')){
        const deleteId = e.target.getAttribute('data-id')

        butTrings.forEach(value =>{
            if(value.id == deleteId){
                let priceReduce = parseFloat(value.price) * parseFloat(value.amount);
                totalCart = totalCart - priceReduce;
                totalCart = totalCart.toFixed(2)
            }
        })
        butTrings = butTrings.filter(producto => producto.id !== deleteId);
    }
    loadHtml();
}


function readTheContent(producto){
    const infoProducto = {
        Image: producto.querySelector('div img').src,
        title: producto.querySelector('p .producto-nombre').textContent,
        price: producto.querySelector('p .producto-precio').textContent,
        id: producto.querySelector('a').getAttribute('data-id'),
        amount: 1
    }

    totalCart = parseFloat(totalCart) + parseFloat(infoProducto.price)
    totalCart = totalCart.toFixed(2);

const exist = butTrings.some (producto => producto.id === infoProducto.id)
if (exist){
    const pro = butTrings.map(producto =>{
        if(producto.id == infoProducto.id){
            producto.amount++;
            return producto;
        } else{
            return producto
        }
    });
    butTrings = [...pro];
}else{
    butTrings = [...butTrings, infoProducto]
}

   
    loadHtml();
    //console.log(infoProducto);
}
function loadHtml(){
    clearHtml();
    buyThings.forEach(producto =>){
        const{ image, title, price, amount, id} = producto;
        const row = document.createElement('div');
        row.classList.add('item');
        row.innerHtml =`
        <img src="${image}" />
        </div>
        <div class="producto-informacion">
          <p>${title}</p>
          <p> ${price}</p>
          <a href="#" class="btn-add-cart" data-id="${id}"
    `;
    containerBuyCart.appendChild(row);

     priceTotal.innerHTML = totalCart;

    };
}
function clearHtml(){
    containerBuyCart.innerHTML = '';
}