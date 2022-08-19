


//new Code
 let totalPrice = 0;
let  quanti=0;
function add_to_cart(pid, pName, pPrice, pquantity) {
    quanti=pquantity;
    let cart = localStorage.getItem("cart");
    if (cart == null) {

        let products = [];
        let product = {productId: pid, productName: pName, productQuantity: 1, productPrice: pPrice};
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        console.log("product added first time")
    } else {
        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find((item) => item.productId == pid);
        if (oldProduct) {
            oldProduct.productQuantity = oldProduct.productQuantity + 1;
            pcart.map((item) => {
                if (item.productId == oldProduct.productId) {
                    item.productQuantity = oldProduct.productQuantity;
                }
            })
            localStorage.setItem("cart", JSON.stringify(pcart))
            console.log("product quantity is increased")
        } else {
            let product = {productId: pid, productName: pName, productQuantity: 1, productPrice: pPrice};
            pcart.push(product)
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("new product is added")

        }

    }
    updateCart();
}

function updateCart() {

    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if (cart == null || cart == 0) {
        console.log("Cart is empty !");
        $(".cart-items").html("(0)");
        $(".cart-body").html("<h3>Cart have no any item</h3>");
        $(".checkout-btn").attr("disabled", true)
    } else
    {
//     there is something in the cart to show
        console.log(cart);
        $(".cart-items").html(`(${cart.length})`);
        let table = `
            <table class='table'>
                <thead class='thead-light'>
                <tr>
                    <th>Item Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                    <th>Action</th>
                </tr>
                </thead>
                `;
       
        cart.map((item) => {
            table += `
                <tr>
                    <td id='pNameTd' value='${item.productName}' >${item.productName}</td>
                    <td id='pPriceTd ' value='${item.productPrice}'>${item.productPrice}</td>
                    <td id='pQuantityTd' value='${item.productQuantity}' >${item.productQuantity}</td>
                    <td id='pTotalTd'  value='${item.productQuantity * item.productPrice}'>${item.productQuantity * item.productPrice}</td>
                    <td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>
                </tr>
                `
            totalPrice += item.productQuantity * item.productPrice;
        })


        table = table + `
            <tr><td colspan='5' class='text-right font-weight-bold m-3'> Total Price : ${totalPrice} </td></tr>
            </table>`
        $(".cart-body").html(table);
        $(".checkout-btn").attr("disabled", false)
    }

}

//delete function

function deleteItemFromCart(pid) {
    let cart = JSON.parse(localStorage.getItem('cart'));
    let newcart = cart.filter((item) => item.productId != pid);
    localStorage.setItem('cart', JSON.stringify(newcart));

    updateCart();
}

$(document).ready(function () {
    updateCart();
})

function goToCheckout() {
    window.location = "checkout.jsp"
}


$(document).ready(function(){
    

alert("Hello");
    
    $('.orderNow').click(function()
    {
      var  pNameTd=$('#pNameTd').val();
      var pPriceTd =$('#pPriceTd ').val();
      var pQuantityTd=$('$pQuantityTd').val();
      var pTotalTd=$('pTotalTd').val();
      alert("Hello");
      $.ajax({
          type:'POST',
          data:{pNameTd:pNameTd,pPriceTd:pPriceTd,pQuantityTd:pQuantityTd,pTotalTd:pTotalTd},
          url:'com.mycompany.mycart.servlets/OrderServlet',
          success:function(result){   
          $('#result1').html(result);
          }
          
          
      });
      
            
    });
    
});    
//    var pNameTd=
//    $ajax({
//        
//        
//      url:"order",
//      data:{totalPrice:totalPrice},
//      type:'POST',
//      success:function(result){
//          $("#result1").html(result)
//          alert("success");
//          
//      },
//      error:function(error){
//          console.log(error);
//          alert("Something went Wrong")
//      }
//    })
    
