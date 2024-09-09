<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="buildingAPI" value="/api/customers"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>
<c:url var="formUrl" value="/admin/customer-list"/>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
    <title>Danh sách khách hàng</title>
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
                <h1>Danh sách khách hàng
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
                                <form:form action="/admin/customer-list" method="GET" id="listForm" modelAttribute="modelSearch">
                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-4">
                                                    <label for="name">Tên khách hàng</label>
                                                    <form:input path="fullName" class="form-control" id="name"/>
                                                </div>
                                                <div class="col-xs-4">
                                                    <label for="phoneNumber">Di động</label>
                                                    <form:input path="phone" class="form-control" id="phoneNumber"/>
                                                </div>
                                                <div class="col-xs-4">
                                                    <label for="email">Email</label>
                                                    <form:input path="email" class="form-control" id="email"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-4">
                                                <security:authorize access="hasRole('MANAGER')">
                                                    <label for="staff">Nhân viên phụ trách</label>
                                                    <form:select path="staffID" id="staff" class="form-control">
                                                        <form:option value="" label="---Chọn nhân viên---"></form:option>
                                                        <form:options items="${staffs}"/>
                                                    </form:select>
                                                </security:authorize>
                                            </div>
                                            <div class="col-xs-4">
                                                <label for="staff">Tình trạng</label>
                                                <form:select path="status" id="staff" class="form-control">
                                                    <form:option value="" label="---Chọn tình trạng---"></form:option>
                                                    <form:options items="${status}"/>
                                                </form:select>
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
                    <div class="pull-right">
                        <a href="/admin/customer-edit">
                            <button title="Thêm khách hàng" class="btn btn-primary">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill-add" viewBox="0 0 16 16">
                                    <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0m-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                                    <path d="M2 13c0 1 1 1 1 1h5.256A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1 1.544-3.393Q8.844 9.002 8 9c-5 0-6 3-6 4"/>
                                </svg>
                            </button>
                        </a>
                        <security:authorize access="hasRole('MANAGER')">
                            <button title="Xóa khách hàng" class="btn btn-danger" id="btnDeleteBuildings">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill-dash" viewBox="0 0 16 16">
                                    <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1m0-7a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                                    <path d="M2 13c0 1 1 1 1 1h5.256A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1 1.544-3.393Q8.844 9.002 8 9c-5 0-6 3-6 4"/>
                                </svg>
                            </button>
                        </security:authorize>
                    </div>
                </div>
            </div><!-- /.row -->
            <div class="hr hr-18 dotted hr-double"></div>
            <div class="row" style="font-family: 'Times New Roman', Times, serif;">
                <div class="col-xs-12">
                    <display:table name="customers.listResult" cellspacing="0" cellpadding="0"
                                   requestURI="${formUrl}" partialList="true" sort="external"
                                   size="${customers.totalItems}" defaultsort="2" defaultorder="ascending"
                                   id="tableList" pagesize="${customers.maxPageItems}"
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
                        <display:column headerClass="text-left" property="name" title="Tên khách hàng"/>
                        <display:column headerClass="text-left" property="phoneNumber" title="Di động"/>
                        <display:column headerClass="text-left" property="email" title="Email"/>
                        <display:column headerClass="text-left" property="demand" title="Nhu cầu"/>
                        <display:column headerClass="text-left" property="createdBy" title="Người thêm"/>
                        <display:column headerClass="text-left" property="createdDate" title="Ngày thêm"/>
                        <display:column headerClass="text-left" property="status" title="Tình trạng"/>
                        <display:column headerClass="text-left" title="Thao tác">
                            <security:authorize access="hasRole('MANAGER')">
                                <button class="btn btn-success" title="Giao khách hàng" onclick="assignmentBuilding(${tableList.id})">
                                    <i class="ace-icon glyphicon glyphicon-align-justify"></i>
                                </button>
                            </security:authorize>
                            <a href="/admin/customer-edit-${tableList.id}" title="Sửa thông tin khách hàng" class="btn btn-info">
                                <i class="ace-icon fa fa-pencil-square-o"></i>
                            </a>
                            <security:authorize access="hasRole('MANAGER')">
                                <button class="btn btn-danger" title="Xóa khách hàng" onclick="btnDeleteBuilding(${tableList.id})">
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
                <button type="button" class="btn btn-default" id="btnAssignmentBuilding">Giao khách hàng</button>
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
        data['customerId'] = $('#buildingID').val();
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
                alert("Giao khách hàng thành công!");
            },
            error: function(response){
                alert("Giao khách hàng không thành công!");
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
            url: "/api/customers/" + data['buildingIDs'],
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "text",
            success:(response)=>{
                alert(response);
                window.location.replace("/admin/customer-list");
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

