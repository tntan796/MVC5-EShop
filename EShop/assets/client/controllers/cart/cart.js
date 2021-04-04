document.addEventListener('DOMContentLoaded', function () {
    $(".btnContinous").off("click").on("click", function () {
        window.location.href = "/";
    })

    $(".btnUpdate").off("click").on("click", function () {
        var quantities = $(".txtQuantity");
        var cartList = [];
        for (let i = 0; i < quantities.length; i++) {
            cartList.push({
                Quantity: +quantities[i].value,
                Product: {
                    ID: +quantities[i].getAttribute('data-id')
                }
            })
        }
        $.ajax({
            url: '/cart/UpdateCart',
            type: "POST",
            data: {
                carts: cartList
            },
            success: function (res) {
                console.log(res);
            },
            error: function (error) {
                console.log(error);
            }
        })
        console.log('tt:', cartList);
    })

    $(".btnDeleteAll").off("click").on("click", function () {
        $.ajax({
            url: '/Cart/DeleteAllCart',
            type: 'GET',
            success: function (res) {
                alert("Xóa thành công");
                window.location.href = "/cart";
            }
        })
    })

    $(".btnRemoveCartItem").off('click').on('click', function () {
        $.ajax({
            url: '/Cart/RemoveCartItem',
            data: {
                productID: $(this).attr('data-id')
            },
            type: 'GET',
            success: function (res) {
                window.location.href = "/cart";
            },
            error: function (err) {
                console.log('error:', err);
            }
        })
    })

    $(".btnPayment").off("click").on("click", function () {
        window.location.href = '/payment';
    });
})