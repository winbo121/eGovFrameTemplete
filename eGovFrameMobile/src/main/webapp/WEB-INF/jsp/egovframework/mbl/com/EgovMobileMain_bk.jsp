<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
  <head>
        <title>모바일 화면</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

        <!-- eGovFrame Common import -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/jquery.mobile-1.4.5.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/EgovMobile-1.4.5.css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery-1.11.2.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery.mobile-1.4.5.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/EgovMobile-1.4.5.js"></script>

	</head>
<body>

<div data-role="page" class="type-home">
	<div data-role="header" data-position="inline" data-theme="z" class="egovBarHeader">
	   <h1><img src="${pageContext.request.contextPath}/images/egovframework/mbl/mcomd/h1_logo.png"/></h1>
	</div>

	<div data-role="content" data-theme="d">
		<ul data-role="listview" data-inset="true" >
			<li data-role="list-divider" class="egov-bar-main2">Front</li>
			<li><a href="${pageContext.request.contextPath}/mbl/com/rns/goRealtimeNoticeMsg.mdo" rel="external">실시간 공지 서비스</a></li>
			<li><a href="${pageContext.request.contextPath}/mbl/com/mpa/goMobilePhotoList.mdo" rel="external">모바일 사진 앨범</a></li>
			<div data-role="collapsible-set">
				<div data-role="collapsible" data-collapsed="true">
					<h3>OPEN-API 연계 서비스</h3>
						<ul data-role="listview" data-inset="true" data-theme="d">
							<li><a href="${pageContext.request.contextPath}/mbl/com/oas/goWeatherInqire.mdo" rel="external">기상청 날씨 조회</a></li>
						</ul>
				</div>
			</div>
			<li><a href="${pageContext.request.contextPath}/mbl/com/mcg/goMobileChartGraph.mdo" rel="external">모바일 차트/그래프</a></li>
			<li><a href="${pageContext.request.contextPath}/mbl/com/mdi/goMobileDeviceIdent.mdo" rel="external">모바일 기기 식별</a></li>
			<li><a href="${pageContext.request.contextPath}/mbl/com/syn/goMobileSyncList.mdo" rel="external"">동기화 서비스</a></li>
			<li><a href="${pageContext.request.contextPath}/mbl/com/mlt/goMobileMultimediaList.mdo" rel="external">멀티미디어 제어</a></li>
			<li><a href="${pageContext.request.contextPath}/mbl/com/ows/goMobileOfflineWebList.mdo" rel="external">오프라인 웹 서비스</a></li>
			<div data-role="collapsible-set">
				<div data-role="collapsible" data-collapsed="true">
					<h3>위치 정보 연계</h3>
						<ul data-role="listview" data-inset="true" data-theme="d">
							<li><a href="${pageContext.request.contextPath}/mbl/com/geo/goGeoLocationPublicInqire.mdo" rel="external">공공 지도 연계 서비스</a></li>
							<li><a href="${pageContext.request.contextPath}/mbl/com/geo/goGeoLocationPrivateInqire.mdo" rel="external">민간 지도 연계 서비스</a></li>
						</ul>
				</div>
			</div>
			<li><a href="${pageContext.request.contextPath}/mbl/com/mms/goMmsWrite.mdo" rel="external">MMS 서비스 연계</a></li>

			<li data-role="list-divider" class="egov-bar-main3">Back</li>
			<li><a href="${pageContext.request.contextPath}/mbl/com/rns/goRealtimeNoticeList.mdo" rel="external">실시간 공지 서비스</a></li>
			<li><a href="${pageContext.request.contextPath}/mbl/com/mpa/selectPhotoList.mdo" rel="external">모바일 사진 앨범</a></li>
			<li><a href="${pageContext.request.contextPath}/mbl/com/oas/selectOpenApiInquiryHistoryList.mdo" rel="external">OPEN-API 연계 서비스</a></li>
			<li><a href="${pageContext.request.contextPath}/mbl/com/mcg/selectChartGraphList.mdo" rel="external">모바일 차트/그래프</a></li>
			<li><a href="${pageContext.request.contextPath}/mbl/com/mdi/selectDeviceIdentList.mdo" rel="external">모바일 기기 식별</a></li>
			<li><a href="${pageContext.request.contextPath}/mbl/com/syn/selectSyncList.mdo" rel="external">동기화 서비스</a></li>
			<li><a href="${pageContext.request.contextPath}/mbl/com/mlt/selectMultimediaList.mdo" rel="external">멀티미디어 제어</a></li>
			<li><a href="${pageContext.request.contextPath}/mbl/com/ows/selectOfflineWebList.mdo" rel="external">오프라인 웹 서비스</a></li>
			<li><a href="${pageContext.request.contextPath}/mbl/com/geo/selectBuildingLocationInfoList.mdo" rel="external">위치 정보 연계</a></li>
			<div data-role="collapsible-set">
				<div data-role="collapsible" data-collapsed="true">
					<h3>MMS 서비스 연계</h3>
						<ul data-role="listview" data-inset="true" data-theme="d">
							<li><a href="${pageContext.request.contextPath}/mbl/com/mms/selectMmsTransResultList.mdo" rel="external">MMS 전송 결과 조회</a></li>
							<li><a href="${pageContext.request.contextPath}/mbl/com/mms/selectMmsAttachFileList.mdo" rel="external">MMS 첨부파일 관리</a></li>
						</ul>
				</div>
			</div>
		</ul>
	</div>

	<div data-role="footer" data-theme="z"  class="egovBar">
		<h4>Copyright(c)2011 Ministry of security and republic administration.</h4>
	</div>

</div>
</body>
</html>