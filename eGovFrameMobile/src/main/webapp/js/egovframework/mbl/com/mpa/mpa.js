/*********************************************************
 * 초기화
 ******************************************************** */
var totcnt;
var imgNum;
var resultList;

function fn_egov_initl_mobilephotolist(){
	$.getJSON(contextPath + "/mbl/com/mpa/selectMobilePhotoList.mdo", function(json) {
		var list_html = "";
		var detail_html = "";
		resultList = json.resultList;

		totcnt = json.resultList.length;
		
		for (var i = 0; i < totcnt; i++) {
			var result = resultList[i];

			list_html += "<a href=\"javascript\:fn_photodetail('" + i + "')\">";
			list_html += "<li><img alt=\"" + result.photoSj +"\" title=\""+ result.photoSj +"\" src='" + contextPath + "/cmm/fms/getImage.mdo?atchFileId=" + result.atchFileId + "&fileSn=0'/></li>";
			list_html += "</a>";

		}
		detail_html += "<li>";
		detail_html += '<img id="imgSrc" src="" title="" alt=""/>';
		detail_html += "</li>";
							
		$('div[id="photoList"] ul[data-role="listview"]').html(list_html);
		$('div[id="detailview"]').html(detail_html);

		$('div[id="photoDetail"]').bind('swipeleft ', (function() {
			imgNum++;
			if (imgNum > totcnt-1){
			    imgNum = 0;
			}
			// id 값으로 이미지를 바꿈
			$('#imgSrc').attr('src', contextPath + '/cmm/fms/getImage.mdo?atchFileId=' + resultList[imgNum].atchFileId + '&fileSn=0');
			$('#imgSrc').attr('title', resultList[imgNum].photoSj);
			$('#imgSrc').attr('alt', resultList[imgNum].photoSj);
        }));
        
		$('div[id="photoDetail"]').bind('swiperight', (function() {
			imgNum--;
			if (imgNum < 0){
				imgNum = totcnt-1;
			} 
			$('#imgSrc').attr('src', contextPath + '/cmm/fms/getImage.mdo?atchFileId=' + resultList[imgNum].atchFileId + "&fileSn=0");
			$('#imgSrc').attr('title', resultList[imgNum].photoSj);
			$('#imgSrc').attr('alt', resultList[imgNum].photoSj);
        }));
		
		$('div[id="photoDetail"]').bind('tap', (function() {
			imgNum++;
			if (imgNum > totcnt-1){
			    imgNum = 0;
			}
			// id 값으로 이미지를 바꿈
			$('#imgSrc').attr('src', contextPath + '/cmm/fms/getImage.mdo?atchFileId=' + resultList[imgNum].atchFileId + '&fileSn=0');
			$('#imgSrc').attr('title', resultList[imgNum].photoSj);
			$('#imgSrc').attr('alt', resultList[imgNum].photoSj);
        }));
		
	});
}

/* ********************************************************
 * 상세화면 처리 함수
 ******************************************************** */
function fn_photodetail(index) {
	$('#imgSrc').attr('src', contextPath + '/cmm/fms/getImage.mdo?atchFileId=' + resultList[index].atchFileId + '&fileSn=0');
	$('#imgSrc').attr('title', resultList[index].photoSj);
	$('#imgSrc').attr('alt', resultList[index].photoSj);
	
	imgNum = index;
	$.mobile.changePage("#photoDetail", "slide", false, false);
}