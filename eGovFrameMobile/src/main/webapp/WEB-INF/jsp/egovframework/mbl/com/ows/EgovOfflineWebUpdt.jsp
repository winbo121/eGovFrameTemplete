<%
 /**
  * @Class Name : EgovOfflineWebUpdt.jsp
  * @Description : EgovOfflineWebUpdt 화면
  * @Modification Information
  * @
  * @  수정일   	수정자		수정내용
  * @ ----------	------		---------------------------
  * @ 2011.08.25	서형주		최초 생성
  *
  *  @author 서형주 
  *  @since 2011.08.25
  *  @version 1.0
  *  @see
  *  
  */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<title>오프라인웹 서비스  수정</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/com.css'/>"/>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/button.css'/>"/>

<!-- 신규공통컴포넌트 import -->
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/mbl/mcomd/egovMcomdAdmin.css'/>"/>

<script type="text/javascript" src="<c:url value="/validator.mdo"/>"></script>
<validator:javascript formName="offlineWebForm" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_offlineWeb(){

    // 첫 입력란에 포커스..
    //document.offlineWebForm.offlineWebSj.focus()();

    
}

/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_updt_offlineWeb(form){

	if (!validateOfflineWebForm(form)) {
	
		return;				

	} else {
	
		form.action = "<c:url value='/mbl/com/ows/updateOfflineWeb.mdo'/>";
		form.submit();
	
	}
            
}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
 function fn_egov_inqire_OfflineWeblist() {

	 document.offlineWebForm.action = "<c:url value='/mbl/com/ows/selectOfflineWebList.mdo'/>";
	 document.offlineWebForm.submit();
	        
}


</script>
</head>
<body onLoad="fn_egov_initl_offlineWeb();">
	<!-- header Start -->
	<div id="header">
		<a href="<c:url value='/index.jsp'/>"><span class="btnHome"></span></a>
		<h1><img src="<c:url value='/images/egovframework/mbl/mcomd/h1_logo.png'/>"/></h1>
		<a href="<c:url value='/mbl/com/ows/selectOfflineWebList.mdo'/>"
	           onclick="fn_egov_inqire_OfflineWeblist(); return false;"><span class="btnBack"></span></a>
	</div>
	<!-- header End -->
	
	<div id="content" class="contents">
	
	<!-- 상단타이틀 -->
	<form:form modelAttribute="offlineWebForm" action="" method="post" >
	
	<!-- 상단 타이틀  영역 -->
	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	   <img src="<c:url value='/images/egovframework/mbl/mcomd/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" align="left" alt="타이틀이미지">&nbsp;오프라인웹 서비스 수정</td>
	 </tr>
	</table>
	
	<!-- 줄간격조정  -->
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
	<tr>
	    <td height="3px"></td>
	</tr>
	</table>
	
	<!-- 등록  폼 영역  -->
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="차트/그래프 데이터 수정테이블.">
	  <tr> 
	    <th width="20%" height="23" class="required_text" nowrap >제목
	    	<img src="<c:url value='/images/egovframework/mbl/mcomd/icon/required.gif'/>" width="15" height="15" alt="필수입력" ></th>
	    <td width="80%" nowrap>
	        <form:input path="offlineWebSj" size="70" maxlength="70"/>
	        <div><form:errors path="offlineWebSj"/></div>                               
	    </td>
	  </tr>
	    <tr> 
	    <th width="20%" height="23" class="required_text" nowrap ><label id="mberId" for="mberId">작성자</label></th>
	    <td width="80%" nowrap>
	        <c:out value="${offlineWebForm.mberId}"/>                              
	    </td>
	  </tr>
	    <tr> 
	    <th width="20%" height="23" class="required_text" nowrap ><label id="creatDt" for="creatDt">생성일시</label></th>
	    <td width="80%" nowrap>
	        <c:out value="${offlineWebForm.creatDt}"/>                           
	    </td>
	  </tr>
	  </tr>
	    <tr> 
	    <th width="20%" height="23" class="required_text" nowrap ><label id="updtDt" for="updtDt">수정일시</label></th>
	    <td width="80%" nowrap>
	        <c:out value="${offlineWebForm.updtDt}"/>                              
	    </td>
	  </tr>
	  </tr>
	    <tr> 
	    <th width="20%" height="70" class="required_text" nowrap ><label id="offlineWebCn" for="offlineWebCn">글내용</label><img src="<c:url value='/images/egovframework/mbl/mcomd/icon/required.gif'/>" width="15" height="15" alt="필수입력" ></th>
	    <td width="80%" nowrap>
	        <form:textarea path="offlineWebCn" rows="15" cols="70" size="70" maxlength="70"/>
	        <div><form:errors path="offlineWebCn"/></div>                               
	    </td>
	  </tr>
	</table>
	
	<!-- 줄간격조정  -->
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
	<tr>
	    <td height="3px"></td>
	</tr>
	</table>
	
	<!-- 목록/저장버튼  -->
	<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr> 
	    <td><span class="button"><input type="submit" value="<spring:message code="button.save"/>" onclick="fn_egov_updt_offlineWeb(document.forms[0]); return false;"></span></td>
	    <td>&nbsp;&nbsp;</td>
	    <td>
	        <span class="button">
	        <a href="<c:url value='/mbl/com/ows/selectOfflineWebList.mdo'/>"
	           onclick="javascript:fn_egov_inqire_OfflineWeblist(); return false;"><spring:message code="button.list"/></a>
	        </span>
	    </td>
	        
	</tr>
	</table>
	
	<input name="sn" type="hidden" value="${offlineWebForm.sn}">
	
	</form:form>
	</div>
	
	<!-- footer Start-->
	<div id="footer">
		<h4>Copyright(c)2011 Ministry of Government Administration and Home Affairs.</h4>
	</div>
	<!-- footer End -->
</body>
</html>