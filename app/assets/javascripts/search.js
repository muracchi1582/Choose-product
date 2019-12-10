$(function() {  
  var search_list = $("#product-search-result");
  var product_list = $(".selected-product")

  function appendproduct(product) {
    var html =` <div class="product_list_form" id="chat-user-8">
                <p class="product_list_form__name">${product.title}</p>
                <div class="product_list_add"  data-product-id="${product.id}" data-product-title="${product.title}">追加</div>
                </div>`
                search_list.append(html);
  }

  function appendProduct_list(id,name){
    var html=`<div class='form__select__product' >
              <input name='video[product_id]' type='hidden' value='${id}'>
              <p class='form__select__product__title'>${name}</p>
              <div class='product-search-remove'>削除</div>
              </div>`
              product_list.append(html);
  }

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
  $(document).on("click",".product_list_add ", function() {
    var id =$(this).attr("data-product-id")
    var name=$(this).attr("data-product-title")
    appendProduct_list(id,name)
    $("#product-search-result").empty()
  });
  $(document).on("click",".product-search-remove", function() {
    $(".form__select__product").remove()
  });
  $(document).on("click",".check_box_title", function(){
    console.log("ok")
  });
});




