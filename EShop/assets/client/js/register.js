$(document).ready(function () {
    var dataDVHC;
    $.ajax({
        url: '/user/LoadDVHC',
        type: 'json',
        method: 'get',
        success: function (result) {
            console.log('Result:', result);
            dataDVHC = result;
            var provinceOption = "";
            dataDVHC.Province.forEach(item => {
                provinceOption += `<option value="${item.ID}">${item.Name}</option>`;
            });
            $("#ddlProvinces").html(provinceOption);
            handChangeProvince(dataDVHC.Province[0].ID);
        },
        error: function (error) {
            console.log('error:', error);
        }
    })

    $("#ddlProvinces").on("change", function (e) {
        handChangeProvince(e.target.value);
    })

    function handChangeProvince(provinceId) {
        if (dataDVHC.District && dataDVHC.District.length > 0) {
            var districts = dataDVHC.District.filter(t => t.ParentID == (provinceId + ''));
            var districtOption = "";
            districts.forEach(item => {
                districtOption += `<option value="${item.ID}">${item.Name}</option>`;
            });
            $("#ddlDistricts").html(districtOption);
        }
    }
})