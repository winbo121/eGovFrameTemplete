<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:scriptlet>

	pageContext.setAttribute("crlf", "\r\n");

</jsp:scriptlet>

<!DOCTYPE html>
<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>마이페이지 컨텐츠 미리보기 </title>
		
       	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/jquery.mobile-1.4.5.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/EgovMobile-1.4.5.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/com/uss/ussCommon.css"/>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery-1.11.2.js"></script>
		
		 
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery.mobile-1.4.5.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/EgovMobile-1.4.5.js"></script>

	</head>
	
	<body>
		
		<!-- View start -->
		<div id="view" data-role="page">
						
				<!-- header start -->
				<div data-role="header">
					<a href="#list" data-icon="arrow-l">뒤로</a>
				    <h1 id="viewTitle">컨텐츠미리보기</h1>
				</div>
				<!-- header end -->
				
				<!-- contents start -->
				<div data-role="content" class="com-copContent">
					<form:form modelAttribute="indvdlPgeInfo" name="detailForm" method="post">
						
						<form:hidden path="cntntsId" value=""/>
						<ul class="uss-hpcDetail">
						
							<li>	
								<span class="uss-tit">컨텐츠명</span>
								<span class="uss-con">
						        	<label for="name-d">
						        		<c:out value="${indvdlPgeInfo.cntntsNm}"/>
						        	</label>
								</span>
							</li>
							
							<li>
								<span class="uss-tit">컨텐츠 설명</span>
							</li>
							<li class="uss-contentsView"><label for="name-d">${fn:replace(indvdlPgeInfo.cntntsDc , crlf , '<br>')}</label></li>
							
							<li>	
								<span class="uss-tit">상세보기URL</span>
								<span class="uss-con">
						        	<label for="name-d">
						        		<c:out value="${indvdlPgeInfo.cntntsLinkUrl}"/>
						        	</label>
								</span>
							</li>
							
						</ul>
						<div class="ui-grid-a">
							<div class="ui-block-a"><a href='javascript:fn_show_preview("${pageContext.request.contextPath}${indvdlPgeInfo.cntcUrl}")' data-role="button" data-theme="b" id="btn_preview">미리보기</a></div>
							<div class="ui-block-b"><a href="javascript:fn_insert_cntnts('${indvdlPgeInfo.cntntsId}');" data-role="button" data-theme="b" id="btn_insert">바로추가</a></div>
						</div>
						<div id="preview" style="display: none;"></div>
						
					</form:form>
				</div>
				<!-- contents end -->
				
				<!-- footer start -->
				<div data-role="footer" data-position="fixed">
					<h4>Copyright (c) MINISTRY OF SECURITY AND PUBLIC ADMINISTRATION.</h4>
				</div>
				<!-- footer end -->
						
								
		</div>
		<!-- view end -->
		
	</body>
</html>

