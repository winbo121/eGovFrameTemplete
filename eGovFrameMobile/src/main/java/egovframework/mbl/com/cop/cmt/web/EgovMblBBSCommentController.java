package egovframework.mbl.com.cop.cmt.web;

import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.bbs.service.Comment;
import egovframework.com.cop.bbs.service.CommentVO;
import egovframework.com.cop.bbs.service.EgovBBSCommentService;
import egovframework.com.utl.sim.service.EgovFileScrty;

/**
 * 댓글관리 서비스 컨트롤러 클래스
 * @author 공통컴포넌트개발팀 한성곤
 * @since 2009.06.29
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.06.29  한성곤          최초 생성
 *
 * Copyright (C) 2009 by MOPAS  All right reserved.
 * </pre>
 */
@Controller
public class EgovMblBBSCommentController {

	@Autowired(required=false)
    protected EgovBBSCommentService bbsCommentService;

    @Resource(name="propertiesService")
    protected EgovPropertyService propertyService;

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Autowired
    private DefaultBeanValidator beanValidator;

    /**
     * 댓글관리 목록 조회를 제공한다.
     *
     * @param boardVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmt/selectCommentList.mdo")
    public String selectCommentList(@ModelAttribute("searchVO") CommentVO commentVO, ModelMap model) throws Exception {

	//------------------------------------------
	// JSP의 <head> 부분 처리 (javascript 생성)
	//------------------------------------------
	model.addAttribute("type", commentVO.getType());	// head or body

	if (commentVO.getType().equals("head")) {
		return "egovframework/mbl/com/cop/cmt/EgovCommentList";
	}
	////----------------------------------------

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

	model.addAttribute("sessionUniqId", user.getUniqId());

	commentVO.setWrterNm(user.getName());

	commentVO.setSubPageUnit(propertyService.getInt("pageUnit"));
	commentVO.setSubPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();
	paginationInfo.setCurrentPageNo(commentVO.getSubPageIndex());
	paginationInfo.setRecordCountPerPage(commentVO.getSubPageUnit());
	paginationInfo.setPageSize(commentVO.getSubPageSize());

	commentVO.setSubFirstIndex(paginationInfo.getFirstRecordIndex());
	commentVO.setSubLastIndex(paginationInfo.getLastRecordIndex());
	commentVO.setSubRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	Map<String, Object> map = bbsCommentService.selectCommentList(commentVO);
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));

	paginationInfo.setTotalRecordCount(totCnt);

	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));
	model.addAttribute("paginationInfo", paginationInfo);

	commentVO.setCommentCn("");	// 등록 후 댓글 내용 처리

	return "egovframework/mbl/com/cop/cmt/EgovCommentList";
    }

    /**
     * 익명용 댓글관리 목록 조회를 제공한다.
     *
     * @param boardVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmt/anonymous/selectCommentList.mdo")
    public String selectAnonymousCommentList(@ModelAttribute("searchVO") CommentVO commentVO, ModelMap model) throws Exception {

	//------------------------------------------
	// JSP의 <head> 부분 처리 (javascript 생성)
	//------------------------------------------
	model.addAttribute("type", commentVO.getType());	// head or body

	if (commentVO.getType().equals("head")) {
	    return "egovframework/mbl/com/cop/cmt/EgovCommentList";
	}
	////----------------------------------------

	model.addAttribute("anonymous", "true");

	commentVO.setSubPageUnit(propertyService.getInt("pageUnit"));
	commentVO.setSubPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();
	paginationInfo.setCurrentPageNo(commentVO.getSubPageIndex());
	paginationInfo.setRecordCountPerPage(commentVO.getSubPageUnit());
	paginationInfo.setPageSize(commentVO.getSubPageSize());

	commentVO.setSubFirstIndex(paginationInfo.getFirstRecordIndex());
	commentVO.setSubLastIndex(paginationInfo.getLastRecordIndex());
	commentVO.setSubRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	Map<String, Object> map = bbsCommentService.selectCommentList(commentVO);
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));

	paginationInfo.setTotalRecordCount(totCnt);

	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));
	model.addAttribute("paginationInfo", paginationInfo);

	commentVO.setWrterNm("");
	commentVO.setCommentCn("");	// 등록 후 댓글 내용 처리

	return "egovframework/mbl/com/cop/cmt/EgovCommentList";
    }

    /**
     * 댓글을 등록한다.
     *
     * @param commentVO
     * @param comment
     * @param bindingResult
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmt/insertComment.mdo")
    public String insertComment(@ModelAttribute("searchVO") CommentVO commentVO, @ModelAttribute("comment") Comment comment,
	    BindingResult bindingResult, ModelMap model) throws Exception {

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	beanValidator.validate(comment, bindingResult);
	if (bindingResult.hasErrors()) {
	    model.addAttribute("msg", "댓글 작성자 및  내용은 필수 입력값입니다.");

	    return "forward:/cop/bbs/selectBoardArticle.mdo";
	}

	if (isAuthenticated) {
	    comment.setFrstRegisterId(user.getUniqId());
	    comment.setWrterId(user.getUniqId());

	    comment.setCommentPassword("");	// dummy

	    bbsCommentService.insertComment(comment);

	    commentVO.setCommentCn("");
	    commentVO.setCommentNo("");
	}

	return "redirect:/cop/bbs/selectBoardArticle.mdo?bbsId="+commentVO.getBbsId()+"&nttId="+commentVO.getNttId();
    }

    /**
     * 익명 댓글을 등록한다.
     *
     * @param commentVO
     * @param comment
     * @param bindingResult
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmt/anonymous/insertComment.mdo")
    public String insertAnonymousComment(@ModelAttribute("searchVO") CommentVO commentVO, @ModelAttribute("comment") Comment comment,
	    BindingResult bindingResult, ModelMap model) throws Exception {

	beanValidator.validate(comment, bindingResult);
	if (bindingResult.hasErrors()) {
	    model.addAttribute("msg", "댓글 작성자, 내용 및 패스워드는 필수 입력값입니다.");

	    return "forward:/cop/bbs/anonymous/selectBoardArticle.mdo";
	}

	comment.setFrstRegisterId("ANONYMOUS");
	comment.setWrterId("");
	comment.setCommentPassword(EgovFileScrty.encryptPassword(comment.getCommentPassword(), comment.getBbsId()));

	bbsCommentService.insertComment(comment);

	commentVO.setCommentNo("");
	commentVO.setCommentCn("");
	commentVO.setWrterNm("");

	return "redirect:/cop/bbs/anonymous/selectBoardArticle.mdo?bbsId="+commentVO.getBbsId()+"&nttId="+commentVO.getNttId();
    }

    /**
     * 댓글을 삭제한다.
     *
     * @param commentVO
     * @param comment
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmt/deleteComment.mdo")
    public String deleteComment(@ModelAttribute("searchVO") CommentVO commentVO, @ModelAttribute("comment") Comment comment, ModelMap model) throws Exception {
	@SuppressWarnings("unused")
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	if (isAuthenticated) {
	    bbsCommentService.deleteComment(commentVO);
	}

	commentVO.setCommentCn("");
	commentVO.setCommentNo("");

	return "forward:/cop/bbs/selectBoardArticle.mdo";
    }

    /**
     * 익명 댓글을 삭제한다.
     *
     * @param commentVO
     * @param comment
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmt/anonymous/deleteComment.mdo")
    public String deleteAnonymousComment(@ModelAttribute("searchVO") CommentVO commentVO, @ModelAttribute("comment") Comment comment, ModelMap model) throws Exception {

	//-------------------------------
	// 패스워드 비교
	//-------------------------------
	String dbpassword = bbsCommentService.getCommentPassword(commentVO);
	String enpassword = EgovFileScrty.encryptPassword(commentVO.getConfirmPassword(), comment.getBbsId());

	if (!dbpassword.equals(enpassword)) {

	    model.addAttribute("subMsg", egovMessageSource.getMessage("cop.password.not.same.msg"));

	    return "forward:/cop/bbs/anonymous/selectBoardArticle.mdo";
	}
	////-----------------------------

	bbsCommentService.deleteComment(commentVO);

	commentVO.setCommentNo("");
	commentVO.setCommentCn("");
	commentVO.setWrterNm("");

	return "forward:/cop/bbs/anonymous/selectBoardArticle.mdo";
    }

    /**
     * 사용안함:::::사용안함:::::사용안함:::::사용안함:::::사용안함:::::사용안함:::::사용안함:::::사용안함:::::
     *
     *
     * 댓글 수정 페이지로 이동한다.
     *
     * @param commentVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmt/selectSingleComment.mdo")
    public String selectSingleComment(@ModelAttribute("searchVO") CommentVO commentVO, ModelMap model) throws Exception {

	//------------------------------------------
	// JSP의 <head> 부분 처리 (javascript 생성)
	//------------------------------------------
	model.addAttribute("type", commentVO.getType());	// head or body

	if (commentVO.getType().equals("head")) {
	    return "cop/cmt/EgovCommentList";
	}
	////----------------------------------------

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

	commentVO.setWrterNm(user.getName());

	commentVO.setSubPageUnit(propertyService.getInt("pageUnit"));
	commentVO.setSubPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();
	paginationInfo.setCurrentPageNo(commentVO.getSubPageIndex());
	paginationInfo.setRecordCountPerPage(commentVO.getSubPageUnit());
	paginationInfo.setPageSize(commentVO.getSubPageSize());

	commentVO.setSubFirstIndex(paginationInfo.getFirstRecordIndex());
	commentVO.setSubLastIndex(paginationInfo.getLastRecordIndex());
	commentVO.setSubRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	Map<String, Object> map = bbsCommentService.selectCommentList(commentVO);
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));

	paginationInfo.setTotalRecordCount(totCnt);

	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));
	model.addAttribute("paginationInfo", paginationInfo);

	Comment data = bbsCommentService.selectComment(commentVO);

	commentVO.setCommentNo(data.getCommentNo());
	commentVO.setNttId(data.getNttId());
	commentVO.setBbsId(data.getBbsId());
	commentVO.setWrterId(data.getWrterId());
	commentVO.setWrterNm(data.getWrterNm());
	commentVO.setCommentPassword(data.getCommentPassword());
	commentVO.setCommentCn(data.getCommentCn());
	commentVO.setUseAt(data.getUseAt());
	commentVO.setFrstRegisterPnttm(data.getFrstRegisterPnttm());
	commentVO.setFrstRegisterNm(data.getFrstRegisterNm());

	return "egovframework/mbl/com/cop/cmt/EgovCommentList";
    }

    /**
     * 사용안함:::::사용안함:::::사용안함:::::사용안함:::::사용안함:::::사용안함:::::사용안함:::::사용안함:::::
     *
     *
     * 익명 댓글 수정 페이지로 이동한다.
     *
     * @param commentVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmt/anonymous/selectSingleComment.mdo")
    public String selectAnonymousSingleComment(@ModelAttribute("searchVO") CommentVO commentVO, ModelMap model) throws Exception {

	//------------------------------------------
	// JSP의 <head> 부분 처리 (javascript 생성)
	//------------------------------------------
	model.addAttribute("type", commentVO.getType());	// head or body

	if (commentVO.getType().equals("head")) {
	    return "cop/cmt/EgovCommentList";
	}
	////----------------------------------------

	model.addAttribute("anonymous", "true");

	commentVO.setSubPageUnit(propertyService.getInt("pageUnit"));
	commentVO.setSubPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();
	paginationInfo.setCurrentPageNo(commentVO.getSubPageIndex());
	paginationInfo.setRecordCountPerPage(commentVO.getSubPageUnit());
	paginationInfo.setPageSize(commentVO.getSubPageSize());

	commentVO.setSubFirstIndex(paginationInfo.getFirstRecordIndex());
	commentVO.setSubLastIndex(paginationInfo.getLastRecordIndex());
	commentVO.setSubRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	Map<String, Object> map = bbsCommentService.selectCommentList(commentVO);
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));

	paginationInfo.setTotalRecordCount(totCnt);

	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));
	model.addAttribute("paginationInfo", paginationInfo);

	//-------------------------------
	// 패스워드 비교
	//-------------------------------
	String dbpassword = bbsCommentService.getCommentPassword(commentVO);
	String enpassword = EgovFileScrty.encryptPassword(commentVO.getConfirmPassword(), commentVO.getBbsId());

	if (!dbpassword.equals(enpassword)) {

	    model.addAttribute("subMsg", egovMessageSource.getMessage("cop.password.not.same.msg"));

	    commentVO.setCommentNo("");
	    commentVO.setCommentCn("");
	    commentVO.setWrterNm("");

	} else {

	    Comment data = bbsCommentService.selectComment(commentVO);

	    commentVO.setCommentNo(data.getCommentNo());
	    commentVO.setNttId(data.getNttId());
	    commentVO.setBbsId(data.getBbsId());
	    commentVO.setWrterId(data.getWrterId());
	    commentVO.setWrterNm(data.getWrterNm());
	    commentVO.setCommentPassword(data.getCommentPassword());
	    commentVO.setCommentCn(data.getCommentCn());
	    commentVO.setUseAt(data.getUseAt());
	    commentVO.setFrstRegisterPnttm(data.getFrstRegisterPnttm());
	    commentVO.setFrstRegisterNm(data.getFrstRegisterNm());
	}
	////-----------------------------

	return "egovframework/cop/cmt/EgovCommentList";
    }

    /**
     * 댓글을 수정한다.
     *
     * @param commentVO
     * @param comment
     * @param bindingResult
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmt/updateComment.mdo")
    public String updateCommentList(@ModelAttribute("searchVO") CommentVO commentVO, @ModelAttribute("comment") Comment comment,
	    BindingResult bindingResult, ModelMap model) throws Exception {

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	beanValidator.validate(comment, bindingResult);
	if (bindingResult.hasErrors()) {
	    model.addAttribute("msg", "댓글 작성자 및  내용은 필수 입력값입니다.");

	    return "forward:/cop/bbs/selectBoardArticle.mdo";
	}

	if (isAuthenticated) {
	    comment.setLastUpdusrId(user.getUniqId());

	    comment.setCommentPassword("");	// dummy

	    bbsCommentService.updateComment(comment);

	    commentVO.setCommentCn("");
	    commentVO.setCommentNo("");
	}

	return "forward:/cop/bbs/selectBoardArticle.mdo";
    }

    /**
     * 익명 댓글을 수정한다.
     *
     * @param commentVO
     * @param comment
     * @param bindingResult
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmt/anonymous/updateComment.mdo")
    public String updateAnonymousCommentList(@ModelAttribute("searchVO") CommentVO commentVO, @ModelAttribute("comment") Comment comment,
	    BindingResult bindingResult, ModelMap model) throws Exception {

	beanValidator.validate(comment, bindingResult);
	if (bindingResult.hasErrors()) {
	    model.addAttribute("msg", "댓글 작성자 및  내용은 필수 입력값입니다.");

	    return "forward:/cop/bbs/anonymous/selectBoardArticle.mdo";
	}

	//-------------------------------
    // 패스워드 비교
    //-------------------------------
    String dbpassword = bbsCommentService.getCommentPassword(commentVO);
    String enpassword = EgovFileScrty.encryptPassword(commentVO.getCommentPassword(), commentVO.getBbsId());

    if (!dbpassword.equals(enpassword)) {

	model.addAttribute("msg", egovMessageSource.getMessage("cop.password.not.same.msg"));

	return "forward:/cop/bbs/anonymous/selectBoardArticle.mdo";
    }

	comment.setLastUpdusrId("ANONYMOUS");
	comment.setCommentPassword(EgovFileScrty.encryptPassword(comment.getCommentPassword(), comment.getBbsId()));

	bbsCommentService.updateComment(comment);

	commentVO.setCommentNo("");
	commentVO.setCommentCn("");
	commentVO.setWrterNm("");

	return "forward:/cop/bbs/anonymous/selectBoardArticle.mdo";
    }
}
