<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="buildingAPI" value="/api/buildings"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>
<c:url var="formUrl" value="/admin/building-list"/>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
    <title>Danh sách tòa nhà</title>
</head>
<body>
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
                <h1>Danh sách tòa nhà
                </h1>
            </div><!-- /.page-header -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="widget-box" style="font-family: 'Times New Roman', Times, serif;">
                        <div class="widget-header">
                            <h4 class="widget-title">Tìm kiếm</h4>
                            <span class="widget-toolbar">
											<a href="#" data-action="reload">
												<i class="ace-icon fa fa-refresh"></i>
											</a>

											<a href="#" data-action="collapse">
												<i class="ace-icon fa fa-chevron-up"></i>
											</a>
										</span>
                        </div>
                        <div class="widget-body">
                            <div class="widget-main">
                                <form:form action="/admin/building-list" method="GET" id="listForm" modelAttribute="modelSearch">
                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
                                                    <label for="name">Tên tòa nhà</label>
                                                     <form:input path="name" class="form-control" id="name"/>
                                                </div>
                                                <div class="col-xs-6">
                                                    <label for="number">Diện tích sàn</label>
                                                    <form:input path="floorArea" class="form-control" id="number"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-2">
                                                    <label for="district">Quận hiện có</label>
                                                    <form:select path="district" id="district" class="form-control">
                                                        <form:option value="" label="---Chọn Quận---"></form:option>
                                                        <form:options items="${districts}"/>
                                                    </form:select>
                                                </div>
                                                <div class="col-xs-5">
                                                    <label for="ward">Phường</label>
                                                    <form:input path="ward" class="form-control" id="ward"/>
                                                </div>
                                                <div class="col-xs-5">
                                                    <label for="street">Đường</label>
                                                    <form:input path="street" class="form-control" id="street"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-4">
                                                    <label for="numberBasement">Số tầng hầm</label>
                                                    <form:input path="numberOfBasement" class="form-control" id="numberBasement"/>
                                                </div>
                                                <div class="col-xs-4">
                                                    <label for="direction">Hướng</label>
                                                    <form:input path="direction" class="form-control" id="direction"/>
                                                </div>
                                                <div class="col-xs-4">
                                                    <label for="rate">Hạng</label>
                                                    <form:input path="level" class="form-control" id="rate"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-3">
                                                    <label for="areaFrom">Diện tích từ</label>
                                                    <form:input path="wordArea" class="form-control" id="areaFrom"/>
                                                </div>
                                                <div class="col-xs-3">
                                                    <label for="arrivalArea">Diện tích đến</label>
                                                    <form:input path="arrivalArea" class="form-control" id="arrivalArea"/>
                                                </div>
                                                <div class="col-xs-3">
                                                    <label for="rentFrom">Gía thuê từ</label>
                                                    <form:input path="rentalPriceFrom" class="form-control" id="rentFrom"/>
                                                </div>
                                                <div class="col-xs-3">
                                                    <label for="rentTo">Gía thuê đến</label>
                                                    <form:input path="rentalPriceCome" class="form-control" id="rentTo"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-5">
                                                    <label for="managerName">Tên quản lý</label>
                                                    <form:input path="managerName" class="form-control" id="managerName"/>
                                                </div>
                                                <div class="col-xs-5">
                                                    <label for="managerPhoneNumber">SĐT quản lý</label>
                                                    <form:input path="managerPhone" class="form-control" id="managerPhoneNumber"/>
                                                </div>
                                                <div class="col-xs-2">
                                                    <security:authorize access="hasRole('MANAGER')">
                                                        <label for="staff">Nhân viên phụ trách</label>
                                                        <form:select path="staffID" id="staff" class="form-control">
                                                            <form:option value="" label="---Chọn nhân viên---"></form:option>
                                                            <form:options items="${staffs}"/>
                                                        </form:select>
                                                    </security:authorize>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
                                                    <form:checkboxes path="rentType" items="${typeCodes}"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
                                                    <button class="btn btn-danger" id="btnSearch">
                                                        <i class="ace-icon glyphicon glyphicon-search"></i>
                                                        Tìm kiếm
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                    <security:authorize access="hasRole('MANAGER')">
                        <div class="pull-right">
                            <a href="/admin/building-edit">
                                <button title="Thêm tòa nhà" class="btn btn-primary">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-fill-add" viewBox="0 0 16 16">
                                        <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                        <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v7.256A4.5 4.5 0 0 0 12.5 8a4.5 4.5 0 0 0-3.59 1.787A.5.5 0 0 0 9 9.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .39-.187A4.5 4.5 0 0 0 8.027 12H6.5a.5.5 0 0 0-.5.5V16H3a1 1 0 0 1-1-1zm2 1.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3 0v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zM4 5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                    </svg>
                                </button>
                            </a>
                            <button title="Xóa tòa nhà" class="btn btn-danger" id="btnDeleteBuildings">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-fill-dash" viewBox="0 0 16 16">
                                    <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                    <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v7.256A4.5 4.5 0 0 0 12.5 8a4.5 4.5 0 0 0-3.59 1.787A.5.5 0 0 0 9 9.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .39-.187A4.5 4.5 0 0 0 8.027 12H6.5a.5.5 0 0 0-.5.5V16H3a1 1 0 0 1-1-1zm2 1.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3 0v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zM4 5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                </svg>
                            </button>
                        </div>
                    </security:authorize>
                </div>
            </div><!-- /.row -->
            <div class="hr hr-18 dotted hr-double"></div>
            <div class="row" style="font-family: 'Times New Roman', Times, serif;">
                <div class="col-xs-12">
                    <display:table name="buildings.listResult" cellspacing="0" cellpadding="0"
                                   requestURI="${formUrl}" partialList="true" sort="external"
                                   size="${buildings.totalItems}" defaultsort="2" defaultorder="ascending"
                                   id="tableList" pagesize="${buildings.maxPageItems}"
                                   export="false"
                                   class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                   style="margin: 3em 0 1.5em;">
                        <display:column title="<fieldset class='form-group'>
												        <input type='checkbox' id='checkAll' class='check-box-element'>
												        </fieldset>" class="center select-cell"
                                        headerClass="center select-cell">
                            <fieldset>
                                   <input type="checkbox" name="checkList" value="${tableList.id}"
                                          id="checkbox_${tableList.id}" class="check-box-element"/>
                            </fieldset>
                        </display:column>
                        <display:column headerClass="text-left" property="name" title="Tên tòa nhà"/>
                        <display:column headerClass="text-left" property="address" title="Địa chỉ"/>
                        <display:column headerClass="text-left" property="numberOfBasement" title="Số tầng hâm"/>
                        <display:column headerClass="text-left" property="managerName" title="Tên quản lý"/>
                        <display:column headerClass="text-left" property="managerPhone" title="Số điện thoại"/>
                        <display:column headerClass="text-left" property="rentArea" title="Diện tích thuê"/>
                        <display:column headerClass="text-left" property="floorArea" title="D.T sàn"/>
                        <display:column headerClass="text-left" property="emptyArea" title="D.T trống"/>
                        <display:column headerClass="text-left" property="rentPrice" title="Gía thuê"/>
                        <display:column headerClass="text-left" property="serviceFee" title="Phí dịch vụ"/>
                        <display:column headerClass="text-left" property="brokerageFee" title="Phí MG"/>
                        <display:column headerClass="text-left" title="Thao tác">
                            <security:authorize access="hasRole('MANAGER')">
                                <button class="btn btn-success" title="Giao tòa nhà" onclick="assignmentBuilding(${tableList.id})">
                                    <i class="ace-icon glyphicon glyphicon-align-justify"></i>
                                </button>
                            </security:authorize>
                                <a href="/admin/building-edit-${tableList.id}" title="Sửa tòa nhà" class="btn btn-info">
                                    <i class="ace-icon fa fa-pencil-square-o"></i>
                                </a>
                            <security:authorize access="hasRole('MANAGER')">
                                <button class="btn btn-danger" title="Xóa tòa nhà" onclick="btnDeleteBuilding(${tableList.id})">
                                    <i class="ace-icon glyphicon glyphicon-trash"></i>
                                </button>
                            </security:authorize>
                        </display:column>
                    </display:table>
                </div>
            </div>
        </div><!-- /.page-content -->
    </div>

</div><!-- /.main-content -->
<div class="modal fade" id="assignmentBuildingModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" style="color: rgb(233, 21, 21);">Danh sách nhân viên</h4>
            </div>
            <div class="modal-body">
                <table class="table table-striped table-bordered table-hover" id="staffList">
                    <thead>
                    <tr>
                        <th class="center">
                            Chọn
                        </th>
                        <th class="center">Tên Nhân Viên</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
                <input type="hidden" id="buildingID" name="buildingID" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnAssignmentBuilding">Giao tòa nhà</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<script>
    function assignmentBuilding(buildingID) {
        $('#assignmentBuildingModal').modal();
        $('#buildingID').val(buildingID);
        loadStaffs(buildingID);
    }

    function loadStaffs(buildingID){
        $.ajax({
            type: "GET",
            url: "${buildingAPI}/" + buildingID + "/staffs",
            dataType: "json",
            success:(response)=>{
                var row = '';
                $.each(response.data, function (index, item){
                   row += '<tr>';
                   row += '<td class = "center"><input type= "checkbox" value=' + item.staffId + ' ' + item.checked + '></td>';
                   row += '<td class = "text-center">'+ item.fullName + '</td>';
                   row += '</tr>';
                });
                $('#staffList tbody').html(row);
            },
            error: function (response) {
                console.log("Failed");
                console.log(response);
            }
        });
    }

    $('#btnAssignmentBuilding').click(function(e) {
        e.preventDefault();
        var data = {};
        data['buildingId'] = $('#buildingID').val();
        var staffs = $('#staffList').find('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        data['staffs'] = staffs;


        $.ajax({
            type: "PUT",
            url: "${buildingAPI}",
            data: JSON.stringify(data),
            contentType: "application/json",
            success:()=>{
                alert("Giao tòa nhà thành công!");
            },
            error: function(response){
                alert("Giao tòa nhà không thành công!");
            }
        });
    });

    // $('#btnDeleteBuildings').click(function(e){
    //     e.preventDefault();
    //     var data = {};
    //     var buildingIDs = $('#buildingList').find('tbody input[type=checkbox]:checked').map(function(){
    //         return $(this).val();
    //     }).get();
    //     data['buildingIDs'] = buildingIDs;
    //     deleteBuilding(data);
    // });

    $('#btnDeleteBuildings').click(function(e){
        e.preventDefault();
        var data = {};
        var buildingIDs = $('#tableList').find('fieldset input[type=checkbox]:checked').map(function(){
            if($(this).val() != "on"){
                return $(this).val();
            }
            // return $(this).val();
        }).get();
        data['buildingIDs'] = buildingIDs;
        deleteBuilding(data);
    });

    function btnDeleteBuilding(buildingID){
        var data = {};
        data['buildingIDs'] = buildingID;
        deleteBuilding(data);
    }

    function deleteBuilding(data){
        $.ajax({
            type: "DELETE",
            url: "/api/buildings/" + data['buildingIDs'],
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "text",
            success:(response)=>{
                alert(response);
                window.location.replace("/admin/building-list");
            },
            error: function(response){
                alert("Xóa không thành công!");
                console.log(response);
            }
        });

        $('#btnSearch').click(function(e){
            e.preventDefault();
            $('#listForm').submit();
        });
    }
</script>
</body>
</html>
