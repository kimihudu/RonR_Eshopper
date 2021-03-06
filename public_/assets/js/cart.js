$(document).ready(function() {

    var cartWrapper = $('.cd-cart-container');
    //product id - you don't need a counter in your real project but you can use your real product id
    var productId = 0;

    if (cartWrapper.length > 0) {
        //store jQuery objects
        var cartBody = cartWrapper.find('.body')
        var cartList = cartBody.find('ul').eq(0);
        var cartTotal = cartWrapper.find('.checkout').find('span');
        var cartCheckout = cartWrapper.find('.checkout');
        var cartTrigger = cartWrapper.children('.cd-cart-trigger');
        var cartCount = cartTrigger.children('.count')
        var addToCartBtn = $('.add-to-cart');
        var undo = cartWrapper.find('.undo');
        var undoTimeoutId;


        //add product to cart
        // addToCartBtn.on('click', function(event) {
        //     event.preventDefault();
        //     addToCart($(this));
        // });

        addToCartBtn.on('click', function(event) {

            var selectedProd = {};
            event.preventDefault();

			var page = $(location).attr('href');
			if(page.search('product_details') != -1){
				var _prod = $(this).parents('.product-details');
				var _id = _prod.find('.product-information').children('p').eq(0).text();
				selectedProd.id = _id.substr(8);
				selectedProd.img = _prod.find('.view-product img').attr('src');
				selectedProd.name = _prod.find('.product-information h2').html();
				selectedProd.price = _prod.find('.product-information span span').text().substr(3);
				selectedProd.quantity = _prod.find('.product-information span input').val();
				console.log(selectedProd);

			}else{
				//for cart without overlay
				//var _prod = $(this).parents();

				var _prod = $(this).parents('.single-products').children('.productinfo');
				selectedProd.img = _prod.children('img').attr('src');
				selectedProd.price = _prod.children('h2').html();
				selectedProd.name = _prod.children('p').text();
                selectedProd.quantity = "1";
			}




            addToCart(selectedProd);
        });

        cartCheckout.on('click', function(e) {

            event.preventDefault();
            var selectedList = { products: [] };
            cartList.children('li:not(.deleted)').each(function(i) {
                var selectedProd = {};
                selectedProd.id = i;
                selectedProd.img = $(this).find('img').attr('src');
                selectedProd.price = $(this).find('.price').text();
                selectedProd.name = $(this).find('h3').text();
                selectedProd.quantity = $(this).find('select').val();
                // collect products from cart
                selectedList.products.push(selectedProd);
            });
            // store to sessionstorage
            sessionStorage.setItem('products', JSON.stringify(selectedList));
            $(location).attr('href', 'checkout')
        });

        //open/close cart
        cartTrigger.on('click', function(event) {
            event.preventDefault();
            toggleCart();
        });

        //close cart when clicking on the .cd-cart-container::before (bg layer)
        cartWrapper.on('click', function(event) {
            if ($(event.target).is($(this))) toggleCart(true);
        });

        //delete an item from the cart
        cartList.on('click', '.delete-item', function(event) {
            event.preventDefault();
            removeProduct($(event.target).parents('.product'));
        });

        //update item quantity
        cartList.on('change', 'select', function(event) {
            quickUpdateCart();
        });

        //reinsert item deleted from the cart
        undo.on('click', 'a', function(event) {
            clearInterval(undoTimeoutId);
            event.preventDefault();
            cartList.find('.deleted').addClass('undo-deleted').one('webkitAnimationEnd oanimationend msAnimationEnd animationend', function() {
                $(this).off('webkitAnimationEnd oanimationend msAnimationEnd animationend').removeClass('deleted undo-deleted').removeAttr('style');
                quickUpdateCart();
            });
            undo.removeClass('visible');
        });
    }

    // public function: add multi items to cart
    window.addListToCart = function(products) {

        if (products.length > 0) {
            for (var i = 0; i < products.length; i++) {
                addToCart(products[i]);
            }
        } else
            addToCart(products);
    }

    function toggleCart(bool) {
        var cartIsOpen = (typeof bool === 'undefined') ? cartWrapper.hasClass('cart-open') : bool;

        if (cartIsOpen) {
            cartWrapper.removeClass('cart-open');
            //reset undo
            clearInterval(undoTimeoutId);
            undo.removeClass('visible');
            cartList.find('.deleted').remove();

            setTimeout(function() {
                cartBody.scrollTop(0);
                //check if cart empty to hide it
                if (Number(cartCount.find('li').eq(0).text()) == 0) cartWrapper.addClass('empty');
            }, 500);
        } else {
            cartWrapper.addClass('cart-open');
        }
    }

    // add single item to cart
    function addToCart(product) {
        var cartIsEmpty = cartWrapper.hasClass('empty');
        //update cart product list
        addProduct(product);
        //update number of items
        updateCartCount(cartIsEmpty);
        //update total price
        updateCartTotal(product.price.replace('$', ''), true);
        //show cart
        cartWrapper.removeClass('empty');
    }

    function addProduct(product) {
        //this is just a product placeholder
        //you should insert an item with the selected product info
        //replace productId, productName, price and url with your real product info

        productId = productId + 1;
        var productAdded = $(
            // `<li class="product">
            // <div class="product-image"><a href="#0"><img src="img/product-preview.png" alt="placeholder"></a></div><div class="product-details"><h3><a href="#0">Product Name</a></h3><span class="price">$25.99</span><div class="actions"><a href="#0" class="delete-item">Delete</a><div class="quantity"><label for="cd-product-'+ productId +'">Qty</label><span class="select"><select id="cd-product-'+ productId +'" name="quantity"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option></select></span></div></div></div></li>`
            `<li class="product">
				<div class="product-image">
					<a href="#0"><img src="` + product.img + `" alt="` + product.name + `"></a>
				</div>
				<div class="product-details">
					<h3><a href="#0">` + product.name + `</a></h3>
					<span class="price">` + product.price + `</span>
					<div class="actions">
						<a href="#0" class="delete-item">Delete</a>
						<div class="quantity">
							<label for="cd-product-4">Qty</label>
							<span class="select">
								<select id="cd-product-4" name="quantity" value="1">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
								</select>
							</span>
						</div>
					</div>
				</div>
    		 </li>`
        );
        cartList.prepend(productAdded);
		$('#cd-product-4').val(product.quantity)
    }

    function removeProduct(product) {
        clearInterval(undoTimeoutId);
        cartList.find('.deleted').remove();

        var topPosition = product.offset().top - cartBody.children('ul').offset().top,
            productQuantity = Number(product.find('.quantity').find('select').val()),
            productTotPrice = Number(product.find('.price').text().replace('$', '')) * productQuantity;

        product.css('top', topPosition + 'px').addClass('deleted');

        //update items count + total price
        updateCartTotal(productTotPrice, false);
        updateCartCount(true, -productQuantity);
        undo.addClass('visible');


        //wait 8sec before completely remove the item
        undoTimeoutId = setTimeout(function() {
            undo.removeClass('visible');
            cartList.find('.deleted').remove();
        }, 8000);
    }

    function quickUpdateCart() {
        var quantity = 0;
        var price = 0;

        cartList.children('li:not(.deleted)').each(function() {
            var singleQuantity = Number($(this).find('select').val());
            quantity = quantity + singleQuantity;
            price = price + singleQuantity * Number($(this).find('.price').text().replace('$', ''));
        });

        cartTotal.text(price.toFixed(2));
        cartCount.find('li').eq(0).text(quantity);
        cartCount.find('li').eq(1).text(quantity + 1);
    }

    function updateCartCount(emptyCart, quantity) {
        if (typeof quantity === 'undefined') {
            var actual = Number(cartCount.find('li').eq(0).text()) + 1;
            var next = actual + 1;

            if (emptyCart) {
                cartCount.find('li').eq(0).text(actual);
                cartCount.find('li').eq(1).text(next);
            } else {
                cartCount.addClass('update-count');

                cartCount.find('li').eq(0).text(actual);
                cartCount.find('li').eq(1).text(next);

                // setTimeout(function() {
                //     cartCount.find('li').eq(0).text(actual);
                // }, 150);

                setTimeout(function() {
                    cartCount.removeClass('update-count');
                }, 200);

                // setTimeout(function() {
                //     cartCount.find('li').eq(1).text(next);
                // }, 230);

            }
        } else {
            var actual = Number(cartCount.find('li').eq(0).text()) + quantity;
            var next = actual + 1;

            cartCount.find('li').eq(0).text(actual);
            cartCount.find('li').eq(1).text(next);
        }
    }

    function updateCartTotal(price, bool) {
        bool ? cartTotal.text((Number(cartTotal.text()) + Number(price)).toFixed(2)) : cartTotal.text((Number(cartTotal.text()) - Number(price)).toFixed(2));
    }
});