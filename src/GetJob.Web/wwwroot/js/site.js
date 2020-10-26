function toHome() {
    window.location.href = "/Home/Index";
}

function selectAll() {
    var checkedAllBox = document.getElementById("checkedAll");
    var items = document.getElementsByClassName("itemCheck");
    for (var i = 0; i < items.length; i++) {
        items[i].checked = checkedAllBox.checked;
    }
}


function PopulateSecondKinds() {
    var firstKindId = $("#FirstKind").val();
    $.ajax({
        url: "/Hire/PopulateSecondKinds",
        type: "GET",
        dataType: "JSON",
        data: { firstKindId: firstKindId },
        success: function(kinds) {
            $("#SecondKind").html('<option value="">-- 选择岗位类别 --</option>');
            $.each(kinds,
                function(i, kind) {
                    console.log(kind);
                    $("#SecondKind").append($("<option></option>").val(kind.jobKindId).html(kind.text));
                });
        }
    });
}

function PopulateCities() {
    var provinceId = $("#ProvinceId").val();
    $.ajax({
        url: "/Hire/PopulateCities",
        type: "GET",
        dataType: "JSON",
        data: { provinceId: provinceId },
        success: function(cities) {
            $("#CityId").html('<option value="">-- 选择市 --</option>');
            $("#LocationId").html('<option value="">-- 选择区 --</option>');
            $.each(cities,
                function(i, city) {
                    console.log(city);
                    $("#CityId").append($("<option></option>").val(city.locationId).html(city.text));
                });
        }
    });
}

function PopulateDistricts() {
    var cityId = $("#CityId").val();
    $.ajax({
        url: "/Hire/PopulateDistricts",
        type: "GET",
        dataType: "JSON",
        data: { cityId: cityId },
        success: function(districts) {
            $("#LocationId").html('<option value="">-- 选择区 --</option>');
            $.each(districts,
                function(i, district) {
                    console.log(district);
                    $("#LocationId").append($("<option></option>").val(district.locationId).html(district.text));
                });
        }
    });
}

// /Recruiter/PersonalInfo
function ChangeEmail() {
    var emailAddress = $('#changeEmailAddress').val();
    $.ajax({
        url: "/Recruiter/ChangeEmail",
        type: "POST",
        dataType: "JSON",
        data: { emailAddress: emailAddress },
        success: function (res) {
            if (res.succeeded == true) {
                window.location.reload();
            } else {
                console.log(res);
                alert('修改失败');
            }
        }
    });
}

// /Recruiter/PersonalInfo
function ChangePhoneNumber() {
    var phoneNumber = $('#changePhoneNumber').val();
    $.ajax({
        url: "/Recruiter/ChangePhoneNumber",
        type: "POST",
        dataType: "JSON",
        data: { phoneNumber: phoneNumber },
        success: function (res) {
            if (res.succeeded == true) {
                window.location.reload();
            } else {
                console.log(res);
                alert('修改失败');
            }
        }
    });
}

function ChangeHeader() {

}