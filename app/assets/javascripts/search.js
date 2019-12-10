  
  
  
  $(".product_text_field").on("keyup", function() {
    var input = $(".product_text_field").val();
    $(".form__select__product").remove()
    $.ajax({
      type: 'GET',
      url: "/products",
      data: { keyword: input },
      dataType: 'json'
    })

    .done(function(products){
      console.log("ddddd")
      search_list.empty();
      if (products.length !== 0) {
        products.forEach(function(product){
          appendproduct(product);
        });
      }
      else {
        search_list.empty();
      }
    })
    .fail(function() {
      alert('product検索に失敗しました');
    })
  })





