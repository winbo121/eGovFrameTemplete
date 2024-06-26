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
		<title>용어사전상세조회 </title>
		
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/jquery.mobile-1.4.5.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/EgovMobile-1.4.5.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/com/uss/ussCommon.css"/>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery-1.11.2.js"></script>
		
		 
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery.mobile-1.4.5.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/EgovMobile-1.4.5.js"></script>
				

        <script type="text/javaScript" language="javascript" defer="defer">
        </script>
		
	</head>
	
	<body>
		
		<div id="view" data-role="page">
			
			
			<!-- header start -->
			<div data-role="header">
				<a href="#list" data-icon="arrow-l">뒤로</a>
			    <h1 id="viewTitle">용어사전상세조회</h1>
			</div>
			<!-- header end -->
			
			<div data-role="content" class="com-copContent">
				<form:form modelAttribute="result" name="detailForm">
					
					<!-- searchVO start -->
					<form:hidden path="searchCondition" value="${searchVO.searchCondition}"/>
					<form:hidden path="searchKeyword" value="${searchVO.searchKeyword}"/>
					<!-- searchVO end -->
				
				<ul class="uss-hpcDetail">
					<li>
						<span class="uss-tit">용어명 </span>
						<span class="uss-con gray">
							<label for="name-d"><c:out value="${result.wordNm}"/></label>
						</span>
					</li>
					
					<li>
						<span class="uss-tit">영문명 </span>
						<span class="uss-con">
							<label for="name-d"><c:out value="${result.engNm}"/></label>
						</span>
					</li>		
					
					<li>			
						<span class="uss-tit">용어 설명 </span>
					</li>
					<li class="uss-contentsView uss-bodeB">
						<label for="name-d">${fn:replace(result.wordDc , crlf , '<br>')}</label>
					</li>
					<li>
						<span class="uss-tit">동의어 </span>
						<span class="uss-con">
							<label for="name-d"><c:out value="${result.synonm}"/></label>
						</span>
					</li>
					
					<li>
						<span class="uss-tit">등록일자 </span>
						<span class="uss-con">
							<label for="name-d"><c:out value="${result.frstRegisterPnttm}"/></label>
						</span>
					</li>
					
					<li>
						<span class="uss-tit">등록자 </span>
						<span class="uss-con">
							<label for="name-d"><c:out value="${result.emplyrNm}"/></label>
						</span>
					</li>
					
					
				</ul>
					<fieldset style="clear:both">
						<div class="com-addBgBtn">
							<a href='javascript:fn_show_page();' data-role="button" data-theme="b">목록</a>			
						</div>
					</fieldset>
				</form:form>
			</div>
			
			<!-- footer start -->
			<div data-role="footer"  data-position="fixed">
				<h4>Copyright (c) MINISTRY OF SECURITY AND PUBLIC ADMINISTRATION.</h4>
			</div>
			<!-- footer end -->
						
								
		</div>
		
	</body>
</html>

