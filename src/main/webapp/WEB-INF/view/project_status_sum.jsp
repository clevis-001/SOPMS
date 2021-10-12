<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>SOPMS</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/favicon.png">
<link rel="stylesheet"
	href="./vendor/owl-carousel/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="./vendor/owl-carousel/css/owl.theme.default.min.css">
<link href="./vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
<link href="./css/style.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<style>
	#sp_list{
		height:80px;
		padding:5px;
		border:1px dashed gray;
		border-radius:5px;
	}
	#add_sp_btn{
		display:inline-block;
		border:2px solid gray;
		border-radius:5px;
		width:60px;
		height:100%;
		background-color:white;
	}
	#case_left{
		display:inline-block;
		float:left;
		width:20px;
		height:100%;
		border:2px solid black;
		border-radius:4px;
		margin-right:10px;
		background-color:white;
	}
	#case_right{
		display:inline-block;
		float:right;
		width:20px;
		height:100%;
		border:2px solid black;
		border-radius:4px;
		margin-left:10px;
		background-color:white;
	}
</style>

<title>Insert title here</title>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
</head>
<body hoe-navigation-type="horizontal" hoe-nav-placement="left"
	theme-layout="wide-layout">
	
	<div class="row h4 font-weight-bold ml-4 my-2 text-primary">프로젝트 등록
		정보</div>
	<hr class="mx-3">
	<div id="sp_list" class="mx-3">
		<button id="case_left">
			<i class="bi bi-caret-left-fill text-dark align-middle"></i>
		</button>
		<button id="add_sp_btn">
			<i class="bi bi-plus-circle fa-2x align-middle"></i>
		</button>
		<button id="case_right">
			<i class="bi bi-caret-right-fill text-dark align-middle"></i>
		</button>
	</div>
	<br>
	<div class="row mx-2 mb-5">
		<div class="col-2 font-weight-bold text-right text-dark">프로젝트 제목</div>
		<div id="pj_name" class="col text-dark"></div>
	</div>
	<div class="row mx-2 my-5">
		<div class="col-2 font-weight-bold text-right text-dark">프로젝트 분류</div>
		<div id="pj_type" class="col-4 text-dark"></div>
		<div class="col-2 font-weight-bold text-right text-dark">프로젝트 상태</div>
		<div id="pj_status" class="col-4 text-dark"></div>
	</div>
	<div class="row mx-2 my-5">
		<div class="col-2 font-weight-bold text-right text-dark">부서</div>
		<div class="col-4 text-dark"></div>
		<div class="col-2 font-weight-bold text-right text-dark">PM</div>
		<div id="pj_pm" class="col-4 text-dark"></div>
	</div>
	<div class="row mx-2 my-5">
		<div class="col-2 font-weight-bold text-right text-dark">시작일</div>
		<div id="pj_start_date" class="col-4 text-dark"></div>
		<div class="col-2 font-weight-bold text-right text-dark">종료일</div>
		<div id="pj_end_date" class="col-4 text-dark"></div>
	</div>
	<div class="row mx-2 my-5">
		<div class="col-2 font-weight-bold text-right text-dark">팀원수</div>
		<div id="pj_max_headCnt" class="col-4 text-dark"></div>
	</div>
	<div class="row mx-2 my-5">
		<div class="col-2 font-weight-bold text-right text-dark">프로젝트 설명</div>
		<br>
		<p id="pj_explanation" class="col-8 text-dark"></p>
	</div>
	<div class="row">
		<div class="offset-9">
			<button id="uptbtn"
				class="btn btn-primary">수정</button>
			<button id="delbtn"
				class="btn btn-danger ml-2">삭제</button>
		</div>
	</div>
	
	<div class="modal fade" id="small_project">
		<div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	            	head
	            </div>
	            <div class="modal-body">
	            	body
	            </div>
	    	</div>
		</div>
	</div>
</body>
<!-- Required vendors -->
<script src="./vendor/global/global.min.js"></script>
<script src="./js/quixnav-init.js"></script>
<script src="./js/custom.min.js"></script>


<!-- Vectormap -->
<script src="./vendor/raphael/raphael.min.js"></script>
<script src="./vendor/morris/morris.min.js"></script>


<script src="./vendor/circle-progress/circle-progress.min.js"></script>
<script src="./vendor/chart.js/Chart.bundle.min.js"></script>

<script src="./vendor/gaugeJS/dist/gauge.min.js"></script>

<!--  flot-chart js -->
<script src="./vendor/flot/jquery.flot.js"></script>
<script src="./vendor/flot/jquery.flot.resize.js"></script>

<!-- Owl Carousel -->
<script src="./vendor/owl-carousel/js/owl.carousel.min.js"></script>

<!-- Counter Up -->
<script src="./vendor/jqvmap/js/jquery.vmap.min.js"></script>
<script src="./vendor/jqvmap/js/jquery.vmap.usa.js"></script>
<script src="./vendor/jquery.counterup/jquery.counterup.min.js"></script>


<script src="./js/dashboard/dashboard-1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		getProjectData();
	})
	function getProjectData(){
		$.ajax({
			type:'POST',
			url:'${path}/projectSum.do',
			data:'pcode=16',
			dataType:'json',
			success:function(data){
				printData(data);
			},
			error:function(err){
				alert(err);
			}
		});
	}
	function printData(data){
		let pjInfo = data;
		console.log('data:'+JSON.stringify(data));
		$('#pj_name').text(pjInfo.pname);
		$('#pj_pm').text(pjInfo.name);
		$('#pj_start_date').text(pjInfo.startdate);
		$('#pj_end_date').text(pjInfo.enddate);
		$('#pj_max_headCnt').text(pjInfo.teamnum);
		$('#pj_explanation').text(pjInfo.explanation);
	}
	
	$('#add_sp_btn').click(function(){
		$('#small_project').modal('show');
	});
</script>
</html>