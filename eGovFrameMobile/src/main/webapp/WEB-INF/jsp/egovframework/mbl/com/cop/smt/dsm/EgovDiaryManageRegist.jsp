<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<!DOCTYPE html>

<html>
 
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>일지관리 등록</title>
		
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/jquery.mobile-1.4.5.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/EgovMobile-1.4.5.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/com/uss/ussCommon.css"/>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery-1.11.2.js"></script>
		
		 
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery.mobile-1.4.5.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/EgovMobile-1.4.5.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/cop/smt/dsm/diary-popup.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/validator.mdo"></script>
		<validator:javascript formName="diaryManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
		
		<script type="text/javaScript" language="javascript">
			<!--		
			/* ********************************************************
			 * 저장처리화면
			 ******************************************************** */
			function fn_egov_save_DiaryManage(){

				var vForm = document.registForm;
				
				vForm.action =  "${pageContext.request.contextPath}/cop/smt/dsm/EgovDiaryManageRegistActor.mdo"; 
				
				if(!validateDiaryManageVO(vForm)){
				 			
					return;
				}else{

					var process = vForm.diaryProcsPte.value;
					if(process > 100 || process < 0){
						jAlert("진척률을 확인해 주세요", "알림", "a");
						return;
					}
									
					vForm.submit();
				} 
			}  

			function fn_egov_show_list() {

				var vFrom = document.registForm;
				
				vFrom.action = "${pageContext.request.contextPath}/cop/smt/dsm/EgovDiaryManageList.mdo";
				vFrom.submit();
				
			}
					 			
		       	-->
        	
		</script>
	</head>
	
	<body>
		
		<div id="view" data-role="page">
									
			
			<div data-role="header">
			    <h1>일지관리 등록</h1>
			    <a href="javascript:fn_egov_show_list();" data-icon="arrow-l">뒤로</a>
			</div>
			
			<form:form modelAttribute="diaryManageVO" name="registForm" method="post">
			<form:hidden path="diaryId" value=""/>
			<form:hidden path="searchKeyword"/>
			<form:hidden path="searchCondition"/>
			<form:hidden path="pageIndex"/>
			
			<input name="cmd" id="cmd" type="hidden" value="<c:out value='save'/>"/>
			<div data-role="content" class="com-ussContent">
				
				<div data-inline="true">
					<dl class="uss-registOk">
						<dt><label for="name"><strong>일정정보</strong></label></dt>
						<dd>
							<div class="uss-typ3">
								<form:input path="schdulCn" maxlength="30"  readonly="true"/>
							</div>
			        		<div class="uss-typ4">
			        			<a href="${pageContext.request.contextPath}/cop/smt/sdm/EgovDeptSchdulManageListPopupView.mdo" data-rel="dialog" id="layer_1" data-role="button" data-icon="search" data-iconpos="notext"></a>
							</div>
							<form:hidden path="schdulId"/></dd>
							
						<dt><label for="diaryNm"><strong>일지명</strong></label></dt>
						<dd><form:input path="diaryNm" maxlength="300"/></dd>
						
						<dt><label for="drctMatter"><strong>지시사항</strong></label></dt>
						<dd><form:textarea path="drctMatter" maxlength="300"/></dd>
						
						<dt><label for="partclrMatter"><strong>특이사항</strong></label></dt>
						<dd><form:textarea path="partclrMatter" maxlength="300"/></dd>
						
						<dt><label for="diaryProcsPte"><strong>진척률</strong></label></dt>
						<dd>
							<div class="uss-typ1"><form:input path="diaryProcsPte" maxlength="30" style="width:100%;vertical-align:middle;"/></div>
							<div class="uss-typ2">%</div>
						</dd>
					</dl>
				</div>
				<div class="ui-grid-a uss-clear">	
					<div class="ui-block-a"><a href="javascript:fn_egov_save_DiaryManage();" data-role="button" data-theme="b">등록</a></div>
					<div class="ui-block-b"><a href='javascript:fn_egov_show_list();' data-role="button" data-theme="b">목록</a></div>
				</div>
			</div>
			</form:form>
			
			<!-- footer start -->
			<div data-role="footer">
				<h4>Copyright (c) MINISTRY OF SECURITY AND PUBLIC ADMINISTRATION.</h4>
			</div>
			<!-- footer end -->
				
		</div>
		
	</body>
</html>

