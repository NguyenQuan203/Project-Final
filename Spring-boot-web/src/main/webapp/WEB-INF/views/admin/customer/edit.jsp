<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>

<c:url var="buildingEditURL" value="/admin/customer-edit"/>
<html>
<head>
    <title>Thông tin khách hàng</title>
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
                    <h1>Thông tin khách hàng
                    </h1>
                </div><!-- /.page-header -->
                <div class="row" style="font-family: 'Times New Roman', Times, serif;">
                    <form:form modelAttribute="buildingEdit" method="GET" action="${buildingEditURL}" id="form-edit">
                        <div class="col-xs-12">
                            <form class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-xs-3">Tên khách hàng</label>
                                    <form:input path="name" class="col-xs-9"/>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Số điện thoại</label>
                                    <form:input path="phoneNumber" class="col-xs-9"/>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Email</label>
                                    <form:input path="email" class="col-xs-9"/>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Tên công ty</label>
                                    <form:input path="companyName" class="col-xs-9"/>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Nhu cầu</label>
                                    <form:input path="demand" class="col-xs-9" />
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Tình trạng</label>
                                    <div class="col-xs-3">
                                        <form:select path="status" id="district" class="form-control">
<%--                                            <form:option value="" label="---Chọn tình trạng---"></form:option>--%>
                                            <form:options items="${status}"/>
                                        </form:select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3"></label>
                                    <div class = "col-xs-9">
                                        <c:if test="${empty buildingEdit.id}">
                                            <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">
                                                Thêm khách hàng
                                            </button>
                                        </c:if>
                                        <c:if test="${not empty buildingEdit.id}">
                                            <security:authorize access="hasRole('MANAGER')">
                                                <button type="button" class="btn btn-warning" onclick="btnAddOrUpdateBuilding1(${buildingEdit.id})">
                                                    Sửa thông tin khách hàng
                                                </button>
                                            </security:authorize>
                                        </c:if>
                                        <a class="btn btn-primary" href="/admin/customer-list">
                                            Hủy thao tác`
                                        </a>
                                        <input type="hidden" id="buildingID" name="buildingID" value="${buildingEdit.id}">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </form:form>
                </div><!-- /.row -->
            </div><!-- /.page-content -->
            <c:forEach var="item" items="${transactionType}">
                <div class="col-xs-12">
                    <div class="col-sm-12">
                        <h3 class="header smaller lighter blue">${item.value}</h3>
                        <button class="btn btn-lg btn-primary" onclick="transactionType('${item.key}', $('#buildingID').val())">
                            <i class="orange ace-icon fa fa-location-arrow bigger-130"></i>Add
                        </button>
                    </div>
                    <c:if test="${item.key == 'CSKH'}">
                        <div class="col-xs-12">
                            <table id="simple-table" class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>Ngày tạo</th>
                                    <th>Người tạo</th>
                                    <th>Ngày sửa</th>
                                    <th>Người sửa</th>
                                    <th>Chi tiết giao dịch</th>
                                    <th>Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="it" items="${cus1}">
                                    <tr>
                                        <td>${it.createdDate}</td>
                                        <td>${it.createdBy}</td>
                                        <c:if test="${it.createdDate.compareTo(it.modifiedDate) == 0}">
                                            <td></td>
                                            <td></td>
                                        </c:if>
                                        <c:if test="${it.createdDate.compareTo(it.modifiedDate) != 0}">
                                            <td>${it.modifiedDate}</td>
                                            <td>${it.modifiedBy}</td>
                                        </c:if>
                                        <td>${it.transactionDetail}</td>
                                        <td>
                                            <div class="hidden-sm hidden-xs btn-group">
                                                <button class="btn btn-xs btn-info" data-toggle="tooltip" title="Sửa thông tin giao dịch" onclick="UpdateTransaction(${it.id}, '${it.transactionDetail}')">
                                                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>
                    <c:if test="${item.key == 'DDX'}">
                        <div class="col-xs-12">
                            <table id="" class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>Ngày tạo</th>
                                    <th>Người tạo</th>
                                    <th>Ngày sửa</th>
                                    <th>Người sửa</th>
                                    <th>Chi tiết giao dịch</th>
                                    <th>Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="itt" items="${cus2}">
                                    <tr>
                                        <td>${itt.createdDate}</td>
                                        <td>${itt.createdBy}</td>
                                        <c:if test="${itt.createdDate.compareTo(itt.modifiedDate) == 0}">
                                            <td></td>
                                            <td></td>
                                        </c:if>
                                        <c:if test="${itt.createdDate.compareTo(itt.modifiedDate) != 0}">
                                            <td>${itt.modifiedDate}</td>
                                            <td>${itt.modifiedBy}</td>
                                        </c:if>
                                        <td>${itt.transactionDetail}</td>
                                        <td>
                                            <div class="hidden-sm hidden-xs btn-group">
                                                <button class="btn btn-xs btn-info" data-toggle="tooltip" title="Sửa thông tin giao dịch" onclick="UpdateTransaction(${itt.id}, '${itt.transactionDetail}')">
                                                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>
                </div>
            </c:forEach>
        </div>
    </div><!-- /.main-content -->
    <input type="hidden" name="transaction" id="transaction" value="">
    <div class="modal fade" id="transactionTypeModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Nhập giao dịch</h4>
            </div>
            <div class="modal-body">
                <div class="form-group has-success">
                    <label for="transactionDetail" class="col-xs-12 col-sm-3 control-label no-padding-right">Chi tiết giao dịch</label>
                    <div class="col-xs-12 col-sm-9">
                    <span class="block input-icon input-icon-right">
                        <input type="text" id="transactionDetail" class="width-100">
                    </span>
                    </div>
                </div>
                <input type="hidden" name="customerId" id="customerId" value="">
                <input type="hidden" name="code" id="code" value="">
                <input type="hidden" name="idd" id="idd" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnAddOrUpdateTransaction">Thêm giao dịch</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>
</div><!-- /.main-container -->
<script>

    function transactionType(code, customerId){
        $('#transactionTypeModal').modal();
        $('#customerId').val(customerId);
        $('#code').val(code);
    }

    function UpdateTransaction(id, it){
        $('#transaction').val(it);
        $('#transactionTypeModal').modal();
        $('#idd').val(id);
    }

    $('#btnAddOrUpdateTransaction').click(function (e){
        e.preventDefault();
        var data = {};
        data['id'] = $('#idd').val();
        data['customerId'] = $('#customerId').val();
        data['code'] = $('#code').val();
        data['transactionDetail'] = $('#transactionDetail').val();
        addTransaction(data);
    });

    function addTransaction(data){
        $('#idd').val("");
        $.ajax({
            type: "POST",
            url: "/api/customers/transaction",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function(){
                console.log("success");
                alert("Add Or Update Transaction Success");
                window.location.replace("/admin/customer-edit-" + $('#buildingID').val());
            },
            error: function(){
                console.log("Failed");
                alert("Thêm hoặc sửa giao dịch không thành công!");
            }
        });
    }

    $('#btnAddOrUpdateBuilding').click(function(){
        var data = {};
        var formData = $('#form-edit').serializeArray();
        $.each(formData, function(i, it){
            if(it.value == ""){
                data["" + it.name + ""] = null;
            }
            else{
                data["" + it.name + ""] = it.value;
            }
        });
        if(data['name'] == null){
            return alert("Tên khách hàng không được thiếu!");
        }
        if(data['phoneNumber'] == null){
            return alert("Số điện thoại không được thiếu!");
        }
        else{
            btnAddOrUpdate(data);
        }
    });

    function btnAddOrUpdateBuilding1(buildingID) {
        var data = {};
        var rentType = [];
        var formData = $('#form-edit').serializeArray();
        $.each(formData, function(i, it) {
            if (it.value == "") {
                data["" + it.name + ""] = null;
            } else {
                data["" + it.name + ""] = it.value;
            }
        });
        data['id'] = buildingID;
        if(data['name'] == null){
            return alert("Tên khách hàng không được thiếu!");
        }
        if(data['phoneNumber'] == null){
            return alert("Số điện thoại không được thiếu!");
        }
        else{
            btnAddOrUpdate(data);
        }
    }

    function btnAddOrUpdate(data){
        $.ajax({
            type: "POST",
            url: "/api/customers",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "text",
            success: function(response){
                alert(response);
                window.location.replace("/admin/customer-list");
            },
            error:(response) =>{
                console.log("Failed");
                console.log(response);
            }
        });
    }
</script>
</body>
</html>
