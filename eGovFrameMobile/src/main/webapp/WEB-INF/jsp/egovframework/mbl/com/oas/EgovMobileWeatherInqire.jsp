<% 
/**
 * @Class Name : EgovMobileWeatherInqire.jsp
 * @Description : 기상청 날씨 조회 서비스 화면
 * @Modification Information
 * @
 * @  수정일      수정자            수정내용
 * @ -------        --------    ---------------------------
 * @ 2011.08.10   조재만          최초 생성
 *
 *  @author 모바일 신규공통컴포넌트개발팀 조재만
 *  @since 2011.08.10
 *  @version 1.0 
 *  @see
 *  
 */
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
		<title>기상청 날씨 조회</title>

		<!-- eGovFrame Common import -->
        <link rel="stylesheet" href="<c:url value='/css/egovframework/mbl/cmm/jquery.mobile-1.4.5.css'/>"/>
        <link rel="stylesheet" href="<c:url value='/css/egovframework/mbl/cmm/EgovMobile-1.4.5.css'/>"/>
        <script type="text/javascript" src="<c:url value='/js/egovframework/mbl/cmm/jquery-1.11.2.js'/>"></script>
        
		
        <script type="text/javascript" src="<c:url value='/js/egovframework/mbl/cmm/jquery.mobile-1.4.5.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/js/egovframework/mbl/cmm/EgovMobile-1.4.5.js'/>"></script>

		<!-- 신규공통컴포넌트 import -->
		<link rel="stylesheet" href="<c:url value='/css/egovframework/mbl/mcomd/egovMcomd.css'/>"/>
		<script type="text/javascript" src="<c:url value='/js/egovframework/mbl/com/oas/rotator.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/js/egovframework/mbl/com/oas/oas.js'/>"></script>
		
		<script type="text/javaScript" language="javascript" defer="defer">
			<!--		

			$(document).on('pageshow', "#main", initList);
			
			function initList() {
				var html = "";
				html += fn_egov_get_today("yyyy.mm.dd (D)");
				$('#today').html(html);
				html = "";

				// Loding 팝업 활성화
				$.mobile.loading("show");
				
                $.getJSON("<c:url value='/mbl/com/oas/selectWeather.mdo'/>", $('#searchVO').serialize().replace(/%/g,'%25'), function(json){
        			for (var i=0; i < json.count; i++) {
        				var weather = fn_egov_judge_weather(json.weatherInfo[i].currentWeatherStatus, json.weatherInfo[i].currentCloudAmount);
        					
        				html += '<div>';
        				html += '	<span class="city">' + json.stationId[i].codeNm + '</span>';
        				html += '	<span class="dosi">' + json.weatherInfo[i].currentTemperature +'˚C</span>';
        				html += '	<span><img width="30" height="30" alt="' + fn_egov_get_weather(weather) + '" src="<c:url value="/images/egovframework/mbl/com/oas/ic_weather' + weather + '.gif"/>"></span>';
        				html += '</div>';	
        			}

        			$('#rotator').html(html);
        			$("#rotator").rotator();
       		 	});

             	// Loding 팝업 비활성화
				$.mobile.loading("hide");
             	
                // 30분마다 반복 (1초 = 1000)
                setInterval('initList()', 1800000);
			}

        	-->
		</script>
	</head>
	<body>
		<div id="main" data-role="page" data-theme="d">
		
			<!-- header start -->
			<div data-role="header" data-theme="z">
				<a href="<c:url value='/index.jsp'/>" data-ajax="false" data-icon="home" class="ui-btn-left">메인</a>
				<h1><img src="<c:url value='/images/egovframework/mbl/mcomd/h1_logo.png'/>"/></h1>
				<div class="ui-body-a mcomd-title"><h3>기상청 날씨 조회</h3></div>
			</div>
			<!-- header end -->
			
			<!-- content start -->
			<div data-role="content" class="egov-mcomdContent">
				<div class="mcomd-weather">
					<dl>
						<dt id="today"></dt>
						<dd>
							<div id="rotator" style="overflow-x: hidden; overflow-y: hidden;">
					
							</div>
						</dd>
					</dl>
				</div>
				<div class="mcomd-openApi">
					<dl>
						<dt><img src="<c:url value='/images/egovframework/mbl/com/oas/img_api.gif'/>" style="max-width:100%"/></dt>
						<dd><span class="blue"><strong>Open API란?</strong></span><br>
						<span class="green">"플랫폼으로서의 웹" 이라는 특징을 기술적으로 구현한
						대표적인 Web 2.0의 기술</span>입니다.
						하나의 웹 사이트에서 자신이 가진 기능을 이용할 수 있도록
						공개한 프로그래밍 인터페이스를 OpenAPI라고 합니다. 
						기상청에서 제공하는 서비스 중 전국실황에 관한 서비스를 제공하고 있습니다.</dd>
					</dl>
				</div>
				<div class="weaterService">
					<h3>제공 서비스 목록</h3>
					<ul class="weaterSerList">
						<li>현재일기</li>
						<li>현재기온℃</li>
						<li>지역 - 춘천</li>
						<li>지역 - 서울</li>
						<li>지역 - 인천</li>
						<li>지역 - 수원</li>
						<li>지역 - 청주</li>
						<li>지역 - 대전</li>
						<li>지역 - 대구</li>
						<li>지역 - 전주</li>
						<li>지역 - 울산</li>
						<li>지역 - 창원</li>
						<li>지역 - 광주</li>
						<li>지역 - 부산</li>
						<li>지역 - 목포</li>
						<li>지역 - 여수</li>
						<li>지역 - 제주</li>
						<li>지역 - 서귀포</li>
					</ul>
				</div>
			</div>
			<!-- content end -->
			
			<!-- footer start -->
			<div data-role="footer" data-theme="z" data-position="fixed" class="egovBar">
				<h4>Copyright(c)2011 Ministry of Government Administration and Home Affairs.</h4>
			</div>
			<!-- footer end -->
			
		</div>
	</body>
</html> 