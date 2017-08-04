/*price range*/

// $('#sl2').slider();

// var RGBChange = function() {
//     $('#RGB').css('background', 'rgb(' + r.getValue() + ',' + g.getValue() + ',' + b.getValue() + ')')
// };


$(document).ready(function() {

    console.log('im load');


    var category = $('div.category-products');
    var catContainer = category.find('.panel-default');
    var categoryItem = catContainer.find('.panel-title a');
    var categorySubItem = catContainer.find('.panel-body a');
    var featureItem = $('#itemContainer');
    var data = $('.features_items').data();

    var brand = $('div.brands_products');
    var brandItem = brand.find('.brands-name a');

    var categoryTab = $('div.category-tab .nav-tabs li');
    var categoryTabContent = $('div.category-tab .tab-content .tab-pane');

    // console.log(categoryTab.html());

    // console.log(categorySubItem.html());

    //scrolling function

    // $(function() {
    //     $.scrollUp({
    //         scrollName: 'scrollUp', // Element ID
    //         scrollDistance: 300, // Distance from top/bottom before showing element (px)
    //         scrollFrom: 'top', // 'top' or 'bottom'
    //         scrollSpeed: 300, // Speed back to top (ms)
    //         easingType: 'linear', // Scroll to top easing (see http://easings.net/)
    //         animation: 'fade', // Fade, slide, none
    //         animationSpeed: 200, // Animation in speed (ms)
    //         scrollTrigger: false, // Set a custom triggering element. Can be an HTML string or jQuery object
    //         //scrollTarget: false, // Set a custom target element for scrolling to the top
    //         scrollText: '<i class="fa fa-angle-up"></i>', // Text for element, can contain HTML
    //         scrollTitle: false, // Set a custom <a> title if required.
    //         scrollImg: false, // Set true to use image
    //         activeOverlay: false, // Set CSS color to display scrollUp active point, e.g '#00FFFF'
    //         zIndex: 2147483647 // Z-Index for the overlay
    //     });
    // });

    /* initiate the plugin jpages */
    $("div.holder").jPages({
        containerID: "itemContainer",
        perPage: 6
            // startPage: 1,
            // startRange: 1,
            // midRange: 5,
            // endRange: 1
    });

    categoryItem.on("click", function() {

        var filter = $(this).text().trim();
        var element = "";
        console.log(filter);
        for (var i = 0; i < data.service.length; i++) {
            var item = data.service[i];
            // console.log(data.service[i].cat_name['sub']);
            // console.log(item);

            if (item.cat_name['name'] == filter) {
                console.log(item.cat_name['name']);
                element += `
                        <li>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="` + item.img + `" alt="" />
                                            <h2>$` + item.price + `</h2>
                                            <p>` + item.name + `</p>
                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                        </div>
                                        <div class="product-overlay">
                                            <div class="overlay-content">
                                                <h2>` + item.price + `</h2>
                                                <p>` + item.name + `</p>
                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="choose">
                                        <ul class="nav nav-pills nav-justified">
                                            <li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                            <li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </li>
                        `;
            }
        }
        // console.log(element);
        featureItem.empty();
        featureItem.append(element);
        reload_jpage("{{asset('theme/js/jPages.js')}}");
    });

    categorySubItem.on("click", function() {
        var filter = $(this).text().trim();
        var element = "";
        // console.log(filter);
        for (var i = 0; i < data.service.length; i++) {
            var item = data.service[i];
            // console.log(data.service[i].cat_name['sub']);
            // console.log(item);
            if (item.cat_name['sub'] == filter) {
                element += `
                        <li>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="` + item.img + `" alt="" />
                                            <h2>$` + item.price + `</h2>
                                            <p>` + item.name + `</p>
                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                        </div>
                                        <div class="product-overlay">
                                            <div class="overlay-content">
                                                <h2>` + item.price + `</h2>
                                                <p>` + item.name + `</p>
                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="choose">
                                        <ul class="nav nav-pills nav-justified">
                                            <li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                            <li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </li>
                        `;
            } else
                element = "";
        }
        // console.log(element);
        featureItem.empty();
        featureItem.append(element);
        reload_jpage("{{asset('theme/js/jPages.js')}}");
    });

    brandItem.on("click", function() {
        var filter = $(this).text().trim();
        var element = "";
        console.log(filter);
        for (var i = 0; i < data.service.length; i++) {
            var item = data.service[i];
            // console.log(data.service[i].cat_name['sub']);
            // console.log(item);
            if (item.cat_name['brand_name'] == filter) {
                element += `
                        <li>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="` + item.img + `" alt="" />
                                            <h2>$` + item.price + `</h2>
                                            <p>` + item.name + `</p>
                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                        </div>
                                        <div class="product-overlay">
                                            <div class="overlay-content">
                                                <h2>` + item.price + `</h2>
                                                <p>` + item.name + `</p>
                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="choose">
                                        <ul class="nav nav-pills nav-justified">
                                            <li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                            <li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </li>
                        `;
            } else
                element = "";
        }
        console.log(element);
        featureItem.empty();
        featureItem.append(element);

    });

    // categoryTab.on("click", function() {
        // var filter = $(this).text().trim();
        // var element = "";
        // console.log(filter);
        // for (var i = 0; i < data.service.length; i++) {
            // var item = data.service[i];
            // // console.log(data.service[i].cat_name['sub']);
            // // console.log(item);
            // if (item.cat_name['model'] == filter) {
                // element += `
                                // <div class="col-sm-3">
                                        // <div class="product-image-wrapper">
                                            // <div class="single-products">
                                                // <div class="productinfo text-center">
                                                    // <img src="` + item.img + `" alt="" />
                                                    // <h2>$` + item.price + `</h2>
                                                    // <p>` + item.name + `</p>
                                                    // <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                // </div>

                                            // </div>
                                        // </div>
                                    // </div>
                        // `;
            // } else
                // element = "";
        // }
        // console.log(element);
        // categoryTabContent.empty();
        // categoryTabContent.append(element);

    // });

    function reload_jpage(src) {

        $('script[src="' + src + '"]').remove();
        $('<script>').attr('src', src).appendTo('head');
    }

});