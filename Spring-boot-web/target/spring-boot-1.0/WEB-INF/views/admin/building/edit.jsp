<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>

<c:url var="buildingEditURL" value="/admin/building-edit"/>
<html>
<head>
    <title>Thông tin tòa nhà</title>
</head>
<body>
<div class="main-content" id="main-content">
  <div class="main-content">
    <div class="main-content-inner">
      <div class="breadcrumbs" id="breadcrumbs">
        <script type="text/javascript">
          try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
        </script>

        <ul class="breadcrumb">
          <li>
            <i class="ace-icon fa fa-home home-icon"></i>
            <a href="#">Home</a>
          </li>

          <li>
            <a href="#">UI &amp; Elements</a>
          </li>
          <li class="active">Content Sliders</li>
        </ul><!-- /.breadcrumb -->
      </div>
      <div class="page-content">
        <div class="page-header">
          <h1>Thông tin tòa nhà
          </h1>
        </div><!-- /.page-header -->
        <div class="row" style="font-family: 'Times New Roman', Times, serif;">
          <form:form modelAttribute="buildingEdit" method="GET" action="${buildingEditURL}" id="form-edit">
            <div class="col-xs-12">
              <form class="form-horizontal">
                <div class="form-group">
                  <label class="col-xs-3">Tên tòa nhà</label>
                  <form:input path="name" class="col-xs-9"/>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Quận</label>
                  <div class="col-xs-4">
                    <form:select path="district" id="district" class="form-control">
                      <form:option value="" label="---Chọn Quận---"></form:option>
                      <form:options items="${districts}"/>
                    </form:select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Phường</label>
                  <form:input path="ward" class="col-xs-9"/>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Đường</label>
                  <form:input path="street" class="col-xs-9"/>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Kết cấu</label>
                  <form:input path="structure" class="col-xs-9"/>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Số tầng hầm</label>
                  <form:input path="numberOfBasement" class="col-xs-9"/>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Diện tích sàn</label>
                  <form:input path="floorArea" class="col-xs-9"/>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Hướng</label>
                  <form:input path="direction" class="col-xs-9"/>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Hạng</label>
                  <form:input path="level" class="col-xs-9"/>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Diện tích thuê</label>
                  <form:input path="rentArea" class="col-xs-9"/>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Gía thuê</label>
                  <form:input path="rentPrice" class="col-xs-9"/>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Mô tả giá</label>
                  <form:input path="rentPriceDescription" class="col-xs-9"/>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Phí dịch vụ</label>
                  <form:input path="serviceFee" class="col-xs-9"/>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Phí ô tô</label>
                  <form:input path="carFee" class="col-xs-9"/>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Phí mô tô</label>
                  <form:input path="motoFee" class="col-xs-9"/>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Phí ngoài giờ</label>
                  <form:input path="overtimeFee" class="col-xs-9"/>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Tiền điện</label>
                  <form:input path="electricityFee" class="col-xs-9"/>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Đặt cọc</label>
                  <form:input path="deposit" class="col-xs-9"/>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Thanh toán</label>
                  <form:input path="payment" class="col-xs-9"/>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Thời hạn thuê</label>
                  <form:input path="rentTime" class="col-xs-9"/>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Thời gian trang trí</label>
                  <form:input path="decorationTime" class="col-xs-9"/>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Tên quản lý</label>
                  <form:input path="managerName" class="col-xs-9"/>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">SĐT quản lý</label>
                  <form:input path="managerPhoneNumber" class="col-xs-9"/>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Phí mô giới</label>
                  <form:input path="brokerageFee" class="col-xs-9"/>
                </div>
                <div class="form-group">
                  <label  class="col-xs-3">Loại tòa nhà</label>
                  <div class="col-xs-9">
                    <form:checkboxes path="rentType" items="${typeCodes}"/>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Ghi chú</label>
                  <form:input path="note" class="col-xs-9"/>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 no-padding-right">Hình đại diện</label>
                  <input class="col-sm-3 no-padding-right" type="file" id="uploadImage"/>
                  <div class="col-sm-9">
                    <c:if test="${not empty buildingEdit.image}">
                      <c:set var="imagePath" value="/repository${buildingEdit.image}"/>
                      <img src="${imagePath}" id="viewImage" width="300px" height="300px" style="margin-top: 50px">
                    </c:if>
                    <c:if test="${empty buildingEdit.image}">
                      <img src="/admin/image/default.png" id="viewImage" width="300px" height="300px">
                    </c:if>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3"></label>
                  <div class = "col-xs-9">
                    <c:if test="${empty buildingEdit.id}">
                      <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">
                        Thêm tòa nhà
                      </button>
                    </c:if>
                    <c:if test="${not empty buildingEdit.id}">
                      <security:authorize access="hasRole('MANAGER')">
                        <button type="button" class="btn btn-warning" onclick="btnAddOrUpdateBuilding1(${buildingEdit.id})">
                          Sửa tòa nhà
                        </button>
                      </security:authorize>
                    </c:if>
                    <a class="btn btn-primary" href="/admin/building-list">
                      Hủy thao tác
                    </a>
                    <img src="/img/loading.gif" style="display: none; height: 100px" id="loading_image">
                  </div>
                </div>
              </form>
            </div>
          </form:form>
        </div><!-- /.row -->

      </div><!-- /.page-content -->

    </div>
  </div><!-- /.main-content -->
</div><!-- /.main-container -->
<script>
  var imageBase64 = '';
  var imageName = '';

  $('#btnAddOrUpdateBuilding').click(function(){
    var data = {};
    var rentType = [];
    var formData = $('#form-edit').serializeArray();
    $.each(formData, function(i, it){
      if(it.name != 'rentType'){
        if ('' !== imageBase64) {
          data['imageBase64'] = imageBase64;
          data['imageName'] = imageName;
        }
        if(it.value == ""){
          data["" + it.name + ""] = null;
        }
        else{
          data["" + it.name + ""] = it.value;
        }
        // data["" + it.name + ""] = it.value;
      }
      else{
        rentType.push(it.value);
      }
    });
    if(data['name'] == null){
      return alert("Tên tòa nhà không được thiếu!");
    }
    data['rentType'] = rentType;
    if(rentType.length == 0){
      return alert("Loại tòa nhà không được thiếu!");
    }
    else{
      btnAddOrUpdate(data);
    }
  });

  function btnAddOrUpdateBuilding1(buildingID) {
    var data = {};
    var rentType = [];
    var formData = $('#form-edit').serializeArray();
    $.each(formData, function(i, it){
      if(it.name != 'rentType'){
        if ('' !== imageBase64) {
          data['imageBase64'] = imageBase64;
          data['imageName'] = imageName;
        }
        if(it.value == ""){
          data["" + it.name + ""] = null;
        }
        else{
          data["" + it.name + ""] = it.value;
        }
        // data["" + it.name + ""] = it.value;
      }
      else{
        rentType.push(it.value);
      }
    });
    data['rentType'] = rentType;
    data['id'] = buildingID;
    if(data['name'] == null){
      return alert("Tên tòa nhà không được thiếu!");
    }
    if(rentType.length == 0){
      return alert("Loại tòa nhà không được thiếu!");
    }
    else{
      btnAddOrUpdate(data);
    }
  }

  function btnAddOrUpdate(data){
    $('#loading_image').show();
    $.ajax({
      type: "POST",
      url: "/api/buildings",
      data: JSON.stringify(data),
      contentType: "application/json",
      dataType: "text",
      success: function(response){
        $('#loading_image').hide();
        alert(response);
        window.location.replace("/admin/building-list");
      },
      error:(response) =>{
        $('#loading_image').hide();
        console.log("Failed");
        console.log(response);
      }
    });
  }

  $('#uploadImage').change(function (event) {
    var reader = new FileReader();
    var file = $(this)[0].files[0];
    reader.onload = function(e){
      imageBase64 = e.target.result;
      imageName = file.name; // ten hinh khong dau, khoang cach. Dat theo format sau: a-b-c
    };
    reader.readAsDataURL(file);
    openImage(this, "viewImage");
  });


  function openImage(input, imageView) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#' +imageView).attr('src', reader.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

</script>
</body>
</html>
