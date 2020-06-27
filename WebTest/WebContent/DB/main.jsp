<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>연암 부동산</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
		<div class="container">
			<jsp:include page="./layout/top.jsp" flush="false" />
		</div>
	</nav>

	<!-- Page Content -->
	<div class="container">
		<c:if test='<%=session.getAttribute("userType") != null%>'>
			<c:choose>
				<c:when test='<%=session.getAttribute("userType").toString() == "매수자"%>'>
					<div class="row">
						<div class="col-lg-12 text-center">
							<h1 class="mt-5"><%=session.getAttribute("userName")%>
								매수자님 환영합니다!
							</h1>
							<p>DB 최종 프로젝트 연암부동산 입니다!</p>
						</div>
					</div>
				</c:when>
				<c:when test='<%=session.getAttribute("userType").toString() == "매도자"%>'>

					<div class="row">
						<div class="col-lg-12 text-center">
							<h1 class="mt-5"><%=session.getAttribute("userName")%>
								매도자님 환영합니다!
							</h1>

							<p>DB 최종 프로젝트 연암부동산 입니다!</p>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="row">
						<div class="col-lg-12 text-center">
							<h1 class="mt-5">연암공과대학교 2B 이경민</h1>
							<p class="lead">학번 : 21660072</p>
							<p>DB 최종 프로젝트 연암부동산 입니다!</p>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</c:if>
	</div>
	<c:if test='<%=session.getAttribute("userType") == null%>'>
		<div class="row">
			<div class="col-lg-12 text-center">
				<h1 class="mt-5">연암공과대학교 스마트SW 학과 2B 이경민</h1>
				<p class="lead">학번 : 21660072</p>
				<p>DB 최종 프로젝트 연암부동산 입니다!</p>
			</div>
		</div>
	</c:if>

	<h3 style="text-align: center;">지도 api 연습</h3>
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.slim.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<div id="map" style="width: 500px; height: 400px; margin:auto;"></div>
	<div id="coordXY"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=baca3a5f6f931f8a69d6569bf6473bf5&libraries=services"></script>
	<!-- <script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script> -->
	<script>
		//////////////////// // 카카오 지도 API S /////////////////// 
		var coordXY = document.getElementById("coordXY"); //검색 지도 경도위도 알아내기 
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스 
		var options = { center: new kakao.maps.LatLng(33.450701, 126.570667), // 위도경도 
				level: 3 //지도의 레벨(확대, 축소 정도) 
		}; 
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴 
		// 지도타입 컨트롤, 줌 컨트롤 생성 
		var mapTypeControl = new kakao.maps.MapTypeControl(); 
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT); 
		var zoomControl = new kakao.maps.ZoomControl(); 
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT); 
		// ★ 주소-좌표 변환 객체를 생성 
		var geocoder = new kakao.maps.services.Geocoder(); 
		// ★ 주소로 좌표를 검색 
		geocoder.addressSearch('경상남도 진주시 가좌동 780', function(result, status) { 
			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) { 
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x); 
				yy = result[0].x; 
				xx = result[0].y; 
				// 결과값으로 받은 위치를 마커로 표시 
				var marker = new kakao.maps.Marker({ map: map, position: coords }); 
				// 인포윈도우로 장소에 대한 설명을 표시 
				var iwContent = '<div style="padding:5px;">연암공대<br>' + 
				'<a href="https://map.kakao.com/link/map/연암공대,35.16467999706, 128.099077952844" style="color:blue" target="_blank">큰지도보기</a>' + " " +
				'<a href="https://map.kakao.com/link/to/연암공대,35.16467999706, 128.099077952844" style="color:blue" target="_blank">길찾기</a>' 
				+'</div>' ;
				var infowindow = new kakao.maps.InfoWindow({ content : iwContent }); 
				infowindow.open(map, marker); 
				// 지도의 중심을 결과값으로 받은 위치로 이동 
				map.setCenter(coords); 
				// ★ resize 마커 중심 
				var markerPosition = marker.getPosition(); 
				$(window).on('resize', function(){ 
					map.relayout(); map.setCenter(markerPosition); 
					}); 
				// ★ 검색 경도위도 표시 
				coordXY.innerHTML = "<br>해당 주소의 X좌표(경도) : " + xx + "<br><br>해당 주소의 Y좌표(위도) : " + yy; } 
			else { 
				console.log('에러'); 
				} 
			}); 
		//////////////////// // 카카오 지도 API E ///////////////////
	</script>

</body>

</html>
