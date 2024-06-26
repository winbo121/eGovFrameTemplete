<%
 /**
  * @Class Name : EgovPhotoUpdt.jsp
  * @Description : EgovPhotoUpdt 화면
  * @Modification Information
  * @
  * @  수정일   	수정자		수정내용
  * @ ----------	------		---------------------------
  * @ 2011.08.11	정홍규		최초 생성
  *
  *  @author 정홍규 
  *  @since 2011.08.11
  *  @version 1.0
  *  @see
  *  
  */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="egovc" uri="/WEB-INF/tlds/egovc.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<title>사진 정보 수정</title>

<meta http-equiv="content-type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/com.css'/>"/>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/button.css'/>"/>

<!-- 신규공통컴포넌트 import -->
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/mbl/mcomd/egovMcomdAdmin.css'/>"/>

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/validator.mdo'/>"></script>
<validator:javascript formName="photo" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">

	/* ********************************************************
	 * 초기화
	 ******************************************************** */
	function fn_egov_initl_photo(){
	
	    // 첫 입력란에 포커스..
	    document.photo.photoSj.focus();
	
	    
	}
	
	/* ********************************************************
	 * 저장처리화면
	 ******************************************************** */
	function fn_egov_updt_photo(form){
	
		// 파일 Validator
		var existFileNum;
		var newFileNum;
		if (document.getElementById('fileListCnt') != null) {
	        existFileNum = document.getElementById('fileListCnt').value;
		}else{
			existFileNum =0;
		}
		if(document.getElementById('egovComFileList') != null){
			newFileNum = document.getElementById('egovComFileList').childNodes.length;
		}else{
			newFileNum = 0;
		}
		if((existFileNum+newFileNum) <= 0){
			alert("첨부파일은 필수 입력입니다.");
			return;
		}
		
		if (!validatePhoto(form)) {
		
			return;				
	
		} else {
	
			form.action = "<c:url value='/mbl/com/mpa/updatePhoto.mdo'/>";
			form.submit();
		
		}
	            
	}
	
	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function fn_egov_inqire_photolist() {
	
		document.photo.action = "<c:url value='/mbl/com/mpa/selectPhotoList.mdo'/>";
		document.photo.submit();
	        
	}
	
	/* ********************************************************
	 * 파일 첨부 여부 체크
	 ******************************************************** */
	function fn_egov_check_file(flag) {
	    
	    if(flag=="Y") {
	        document.getElementById('file_upload_posbl').style.display = "block";
	        document.getElementById('file_upload_imposbl').style.display = "none";          
	    } else {
	        document.getElementById('file_upload_posbl').style.display = "none";
	        document.getElementById('file_upload_imposbl').style.display = "block";
	    }
	
	    
	}   
</script>
</head>
<body onLoad="fn_egov_initl_photo();">
	<!-- header Start -->
	<div id="header">
		<a href="<c:url value='/index.jsp'/>"><span class="btnHome"></span></a>
		<h1><img src="<c:url value='/images/egovframework/mbl/mcomd/h1_logo.png'/>"/></h1>
		<a href="<c:url value='/mbl/com/mpa/selectPhotoList.mdo'/>"><span class="btnBack"></span></a>
	</div>
	<!-- header End -->
	
	<DIV id="content" class="contents">
	
	<!-- 상단타이틀(파일첨부를 위한 폼명 및 Enctype 설정 -->
	<form:form modelAttribute="photo" name="photo" action="" method="post"  enctype="multipart/form-data">
	
	<!-- 첨부파일을 위한 NAME 설정 -->   
	<input type="hidden" name="posblAtchFileNumber" id="posblAtchFileNumber" value="1"/>  
	
	<!-- 첨부파일 삭제 후 리턴 URL -->
	<input type="hidden" name="returnUrl" id="returnUrl" value="<c:url value='/mbl/com/mpa/goPhotoUpdt.mdo'/>"/>      
	      
	<!-- 상단 타이틀  영역 -->
	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	   <img src="<c:url value='/images/egovframework/mbl/mcomd/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" align="left" alt="타이틀이미지">&nbsp;사진 정보 수정</td>
	 </tr>
	</table>
	
	<!-- 줄간격조정  -->
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
	<tr>
	    <td height="3px"></td>
	</tr>
	</table>
	
	<!-- 등록  폼 영역  -->
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="사진정보 수정테이블.">
	  <tr> 
	    <th width="20%" height="23" class="required_text" nowrap ><label id="photoSj" for="photoSj">사진 제목</label><img src="<c:url value='/images/egovframework/mbl/mcomd/icon/required.gif'/>" width="15" height="15" alt="필수입력" ></th>
	    <td width="80%" nowrap>
	        <form:input path="photoSj" size="70" maxlength="70"/>
	        <div><form:errors path="photoSj"/></div>                               
	    </td>
	  </tr>
	  <!--첨부목록을 보여주기 위한 -->  
	<c:if test="${photo.atchFileId != ''}">
	    <tr> 
	        <th width="20%" height="23" class="required_text" nowrap >사진 파일<img src="<c:url value='/images/egovframework/mbl/mcomd/icon/required.gif'/>" width="15" height="15" alt="필수입력" ></th>
	        <td >
	            <c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfsForUpdate.mdo" >
	                <c:param name="param_atchFileId" value="${egovc:encrypt(photo.atchFileId)}"/>
	            </c:import>                             
	        </td>
	    </tr>
	  </c:if>
	  
	 		<!--첨부화일 업로드를 위한 Start -->
			<tr> 
				<th height="23"><label for="egovComFileUploader">파일 수정</label></th>
				<td colspan="3">
					<div id="file_upload_posbl"  style="display:none;" >    
						<table width="580px" cellspacing="0" cellpadding="0" border="0" align="center" class="UseTable">
							<tr>
								<td><input name="file_1" id="egovComFileUploader" type="file"></td>
							</tr>
							<tr>
								<td>
									<div id="egovComFileList"></div>
								</td>
							</tr>
						</table>          
					</div>
					<div id="file_upload_imposbl"  style="display:none;" >
						<table width="580px" cellspacing="0" cellpadding="0" border="0" align="center" class="UseTable">
							<tr>
								<td><spring:message code="common.imposbl.fileupload"/></td>
							</tr>
						</table>                
					</div>
				</td>                
			</tr>
			<!--첨부화일 업로드를 위한 end.. -->
	
	  
	</table>
	
	<!--첨부파일 업로드 가능화일 설정(Update) Start..-->
	<script type="text/javascript">
	
	    var existFileNum = null;        
	    var maxFileNum = null;
	
	    if (document.getElementById('fileListCnt') != null) {
	        existFileNum = document.getElementById('fileListCnt').value;
	    }
	
	    if (document.getElementById('posblAtchFileNumber') != null) {
	        maxFileNum = document.getElementById('posblAtchFileNumber').value;
	    }
	
	    if(existFileNum=="undefined" || existFileNum ==null){
	        existFileNum = 0;
	    }
	
	    if(maxFileNum=="undefined" || maxFileNum ==null){
	        maxFileNum = 0;
	    }       
	
	    var uploadableFileNum = maxFileNum - existFileNum;
	
	    if(uploadableFileNum<0) {
	        uploadableFileNum = 0;
	    }
	                
	    if(uploadableFileNum != 0){
	    
	        fn_egov_check_file('Y');
	    
	        var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), uploadableFileNum );
	        multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
	    
	    }else{
	        fn_egov_check_file('N');
	    }
	
	</script>   
	<!--첨부파일 업로드 가능화일 설정(Update) End.-->
	
	<!-- 줄간격조정  -->
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
	<tr>
	    <td height="3px"></td>
	</tr>
	</table>
	
	<!-- 목록/저장버튼  -->
	<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr> 
	    <td><span class="button"><input type="submit" value="<spring:message code="button.save"/>" onclick="fn_egov_updt_photo(document.forms[0]); return false;"></span></td>
	    <td>&nbsp;&nbsp;</td>
	    <td>
	        <span class="button">
	        <a href="<c:url value='/mbl/com/mpa/selectPhotoList.mdo'/>"
	           onclick="javascript:fn_egov_inqire_photolist(); return false;"><spring:message code="button.list"/></a>
	        </span> 
	    </td>
	        
	</tr>
	</table>
	
	<input name="sn" type="hidden" value="${photo.sn}">
	</form:form>
	</div>
	
	<!-- footer Start-->
	<div id="footer">
		<h4>Copyright(c)2011 Ministry of Government Administration and Home Affairs.</h4>
	</div>
	<!-- footer End -->
</body>
</html>