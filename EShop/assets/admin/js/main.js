$('#test').on("click", function () {
    notification(content = "Tano", color = "#1E90FF");
});

document.addEventListener("DOMContentLoaded", function () {
    $("#ddlLanguage").on("change", function (e) {
        $.ajax({
            url: '/base/ChangeCulture',
            data: {
                ddlCulture: e.target.value,
                returnUrl: ''
            },
            type: 'JSON',
            method: 'post',
            success: function (result) {
                console.log(result);
            },
            error: function (error) {
                console.log(error);
            }
        });
    })
})