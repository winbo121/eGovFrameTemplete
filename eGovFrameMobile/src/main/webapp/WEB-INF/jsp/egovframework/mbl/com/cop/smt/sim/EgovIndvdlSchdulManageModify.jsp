<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
 
<!DOCTYPE html>

<style type="text/css">
	.layer {display:none; position:fixed; _position:absolute; top:0; left:0; width:100%; height:100%; z-index:100000;}
	.layer_popup { position:absolute; left:10px; top:30px; z-index:10; width:100%; height:100%;}
	.layer_popup #layer_close { position:absolute; z-index:2; right:-2px; top:-2px;}
</style>
<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	
		<title>일정관리수정</title>
		
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/jquery.mobile-1.4.5.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/EgovMobile-1.4.5.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/com/uss/ussCommon.css"/>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery-1.11.2.js"></script>
		
		 
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery.mobile-1.4.5.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/EgovMobile-1.4.5.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/cop/smt/sdm/schdul-popup.js"></script>
		<!-- datebox javascript-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/com/datepicker/jqm-datebox.css"/>

		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/datepicker/jqm-datebox.core.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/datepicker/jqm-datebox.mode.calbox.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/datepicker/jqm-datebox.mode.datebox.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/datepicker/jqm-datebox.mode.flipbox.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/datepicker/jquery.mobile.datebox.i18n.ko.utf8.js"></script>
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/validator.mdo"></script>
		<validator:javascript formName="indvdlSchdulManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
		
		<script type="text/javascript"> 
		<!--

			function fn_sel_orgn(orgnztId, orgnztNm) {
				
				$('#schdulDeptName').val(orgnztNm);
				$('#schdulDeptId').val(orgnztId);

				$.mobile.changePage($("#view"));
			}

			function fn_sel_emp(chargerId, chargerNm) {
				
				$('#schdulChargerName').val(chargerNm);
				$('#schdulChargerId').val(chargerId);

				$.mobile.changePage($("#view"));
			}

			function fn_egov_updt() {
				
				if(!validateIndvdlSchdulManageVO(document.detailForm)) {
					return;
				}
									
				var url = "${pageContext.request.contextPath}/cop/smt/sim/EgovIndvdlSchdulManageModifyActor.mdo";
				$('#detailForm').attr('action', url);
				$('#detailForm').attr('data-ajax', 'false');
				$('#detailForm').submit();

			}

			function fn_show_list() {

				var url = "";
				var path = $('#path').val();
				
				if(path == "daily") {
					
					url = "${pageContext.request.contextPath}/cop/smt/sim/EgovIndvdlSchdulManageDailyList.mdo";
				}
				else {

					url = "${pageContext.request.contextPath}/cop/smt/sim/EgovIndvdlSchdulManageWeekList.mdo";
				}
					$('#searchVO').attr('action', url);
					$('#searchVO').attr('data-ajax', 'false');
					$('#searchVO').submit();
			}

			function fn_show_view() {

				var url = "${pageContext.request.contextPath}/cop/smt/sim/EgovIndvdlSchdulManageDetail.mdo";
				$('#searchVO').attr('action', url);
				$('#searchVO').attr('data-ajax', 'false');
				$('#searchVO').submit();
				
			}

		-->
		</script>
		<!-- 레이어팝업 -->
	</head>
	
	<body>
		
		<div id="view" data-role="page">
												
			<div data-role="header">
				<a href="javascript:fn_show_view();" data-icon="arrow-l">뒤로</a>
			    <h1>일정관리수정</h1>
			</div>
			
			<!-- searchVO start -->				
				<form id="searchVO" name="searchVO" method="post">
					<input type="hidden" id="selDate" name="selDate" value="${selDate}"/>
					<input type="hidden" id="path" name="path" value="${path}"/>
					<input type="hidden" id="searchCondition" name="searchCondition" value="${searchVO.searchCondition}"/>
					<input type="hidden" id="searchKeyword" name="searchKeyword" value="${searchVO.searchKeyword}"/>
					<input type="hidden" id="schdulId" name="schdulId" value="${indvdlSchdulManageVO.schdulId}"/>
				</form>
			<!-- searchVO end -->
			
			<form:form modelAttribute="indvdlSchdulManageVO" id="detailForm" name="detailForm" method="post">
				<form:hidden path="schdulId"/>
				
			<div data-role="content" class="com-ussContent">
				
				<div data-inline="true">
					<dl class="uss-registOk">
						<dt><label for="name"><strong>일정구분</strong></label></dt>
						<dd>
							<form:select path="schdulSe" data-role="none">
					            <form:options items="${schdulSe}" itemValue="code" itemLabel="codeNm"/>
					        </form:select>
						</dd>
						
						<dt><label for="ipcr"><strong>중요도</strong></label></dt>
						<dd>
							<form:select path="schdulIpcrCode" data-role="none">
					            <form:options items="${schdulIpcrCode}" itemValue="code" itemLabel="codeNm"/>
					        </form:select>
						</dd>
						
						<dt><label for="reptitSeCode"><strong>반복구분</strong></label></dt>
						<dd>
							<fieldset data-role="controlgroup" data-type="horizontal"  data-inline="true"> 	
				        		<c:forEach items="${reptitSeCode}" var="reptitSe">
				        			<form:radiobutton path="reptitSeCode" value="${reptitSe.code}" label="${reptitSe.codeNm}"/>
				        		</c:forEach>
			        		</fieldset>
						</dd>
						
						<dt><label for="dept"><strong>부서</strong></label></dt>
						<dd class="department">
							<div class="uss-typ3">
								<form:input path="schdulDeptName" maxlength="30" readonly="true"/>
							<form:hidden path="schdulDeptId" maxlength="30"/>
							</div>
							<div class="uss-typ4"><a href="${pageContext.request.contextPath}/uss/olp/mgt/EgovMeetingManageLisAuthorGroupPopupView.mdo" id="layer_1" data-rel="dialog" data-role="button" data-icon="search" data-iconpos="notext">조회</a></div>
						</dd>
						
						<dt><label for="schdulNm"><strong>일정명</strong></label></dt>
						<dd><form:input path="schdulNm" size="70" maxlength="70" title="일정명"/></dd>
						
						<dt><label for="schdulCn"><strong>일정내용</strong></label></dt>
						<dd><form:textarea path="schdulCn" cols="300" rows="20" cssClass="txaClass" title="일정내용"/></dd>
						
						<dt><label for="reptitSeCode"><strong>날짜/시간</strong></label></dt>
						<dd class="department">
							<div>
								<span class="uss-dataBox"><form:input path="schdulBgndeYYYMMDD" type="date" data-role="datebox" data-options='{"mode": "datebox"}' class="new"/></span>
				        		<span class="uss-dataBox"><form:input path="schdulBgndeHH" type="date" data-role="datebox" data-options='{"mode": "timebox", "overrideTimeFormat": 24}' class="new"/></span>
							</div>
							<div class="uss-time">
			        			<span class="uss-dataBox"><form:input path="schdulEnddeYYYMMDD" type="date" data-role="datebox" data-options='{"mode": "datebox"}' class="new"/></span>
				        		<span class="uss-dataBox"><form:input path="schdulEnddeHH" type="date" data-role="datebox" data-options='{"mode": "timebox", "overrideTimeFormat": 24}' class="new"/></span>
			        		</div>
						</dd>
						
						<dt><label for="dept"><strong>담당자</strong></label></dt>
						<dd>
							<div class="uss-typ3">
								<form:input path="schdulChargerName" maxlength="30" readonly="true"/>
								<form:hidden path="schdulChargerId"/>
							</div>
							<div class="uss-typ4"><a href="${pageContext.request.contextPath}/uss/olp/mgt/EgovMeetingManageLisEmpLyrPopupView.mdo" id="layer_2" data-rel="dialog" data-role="button" data-icon="search" data-iconpos="notext">조회</a></div>
						</dd>
					</dl>
				
				</div>
				
				<div class="ui-grid-a uss-clear">
					<div class="ui-block-a"><a href="javascript:fn_egov_updt();" data-role="button" data-theme="b" data-ajax="false">수정</a></div>
					<div class="ui-block-b"><a href='javascript:fn_show_list();' data-role="button" data-theme="b">목록</a></div>
				</div>						

			</div>
			</form:form>
			
			<!-- footer start -->
			<div data-role="footer" data-position="fixed">
				<h4>Copyright (c) MINISTRY OF SECURITY AND PUBLIC ADMINISTRATION.</h4>
			</div>
			<!-- footer end -->
				
			
								
		</div>
		
	</body>
</html>

