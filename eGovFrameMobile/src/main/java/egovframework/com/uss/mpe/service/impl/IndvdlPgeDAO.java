package egovframework.com.uss.mpe.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.uss.mpe.service.IndvdlPge;
import egovframework.com.uss.mpe.service.IndvdlPgeCntntsVO;
import egovframework.com.uss.mpe.service.IndvdlPgeVO;


/**
 * 개요
 * - 마이페이지에 대한 DAO를 정의한다.
 *
 * 상세내용
 * - 마이페이지 콘텐츠의 등록, 수정, 삭제, 조회, 반영확인 기능을 제공한다.
 * - 마이페이지 콘텐츠의 조회기능은 목록조회, 상세조회로 구분된다.
 * - 등록된 콘텐츠를 마이페이지에 추가, 삭제, 조회 기능을 제공한다.
 * @author 이창원
 * @version 1.0
 * @created 05-8-2009 오후 2:20:28
 */
@Repository("IndvdlPgeDAO")
public class IndvdlPgeDAO extends EgovComAbstractDAO {

	public IndvdlPgeDAO(){

	}
	private static final Logger LOGGER = LoggerFactory.getLogger(IndvdlPgeDAO.class);
	/**
	 * 기 등록된 마이페이지 정보를 조회한다.
	 * @param indvdlPgeVO - 마이페이지 VO
	 * @return indvdlPgeVO - 마이페이지 VO
	 *
	 * @param indvdlPgeVO

	public IndvdlPgeVO selectIndvdlpgeResult(IndvdlPgeVO indvdlPgeVO){
		return (IndvdlPgeVO)selectOne("IndvdlPgeDAO.selectIndvdlpgeResult", indvdlPgeVO);
	}*/

	/**
	 * 기 등록된 마이페이지 컨텐츠정보를 삭제한다.
	 * @param indvdlPge - 마이페이지 model
	 * @return boolean - 반영성공 여부
	 *
	 * @param indvdlPge
	 */
	public boolean deleteIndvdlpgeCntnts(IndvdlPge indvdlPge) throws Exception {
		try{
			String [] strCntntsId = indvdlPge.getCntntsId().split(";");
	    	for(int i=0; i<strCntntsId.length;i++) {
	    		indvdlPge.setCntntsId(strCntntsId[i]);
	    		update("IndvdlPgeDAO.deleteIndvdlpgeCntnts", indvdlPge);
	    	}
		//2017.02.27 김준호 시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]
		} catch(IllegalArgumentException e) {
			LOGGER.error("[IllegalArgumentException] Try/Catch...usingParameters Runing : "+ e.getMessage());
			return false;	
		//2017.02.27 김준호 시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]	    	
		}catch(Exception e){
			LOGGER.error("["+e.getClass()+"] Try/Catch...Runing : " + e.getMessage());
			return false;
		}
		return true;
	}

	/**
	 * 기 등록된 마이페이지 컨텐츠정보를 DB에서 완전 삭제한다.
	 * @param indvdlPge - 마이페이지 model
	 * @return boolean - 반영성공 여부
	 *
	 * @param indvdlPge
	 */
	public boolean deleteIndvdlpgeCntntsDB(IndvdlPge indvdlPge) throws Exception {
		try{
			delete("IndvdlPgeDAO.delIndvdlpgeCntntsDB", indvdlPge);
		//2017.02.27 김준호 시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]
		}catch(IllegalArgumentException e) {
			LOGGER.error("[IllegalArgumentException] Try/Catch...usingParameters Runing : "+ e.getMessage());
			return false;
		//2017.02.27 김준호 시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]	    			
		}catch(Exception e){
			LOGGER.error("["+e.getClass()+"] Try/Catch...Runing : " + e.getMessage());
			return false;
		}
		return true;
	}

	/**
	 * 마이페이지 컨텐츠정보를 신규로 등록한다.
	 * @param indvdlPge - 마이페이지 model
	 * @return boolean - 반영성공 여부
	 *
	 * @param indvdlPge
	 */
	public boolean insertIndvdlpgeCntnts(IndvdlPge indvdlPge){
		try{
		insert("IndvdlPgeDAO.insertIndvdlpgeCntnts", indvdlPge);
		//2017.02.27 김준호 시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]
		} catch(IllegalArgumentException e) {
			LOGGER.error("[IllegalArgumentException] Try/Catch...usingParameters Runing : "+ e.getMessage());
			return false;
		//2017.02.27 김준호 시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]	    			
		}catch(Exception e){
			LOGGER.error("["+e.getClass()+"] Try/Catch...Runing : " + e.getMessage());
			return false;
		}
		return true;
	}

	/**
	 * 등록된 마이페이지 컨텐츠의 상세정보를 조회한다.
	 * @param indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 * @return indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 *
	 * @param indvdlPgeCntntsVO
	 */
	public IndvdlPge selectIndvdlpgeCntnts(IndvdlPge indvdlPge){
		return (IndvdlPge)selectOne("IndvdlPgeDAO.selectIndvdlpgeCntnts", indvdlPge);
	}

	/**
	 * 마이페이지 컨텐츠를 관리하기 위해 등록된 마이페이지 컨텐츠 목록을 조회한다.
	 * @param indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 * @return List - 마이페이지 컨텐츠 목록
	 *
	 * @param indvdlPgeCntntsVO
	 */
	@SuppressWarnings("unchecked")
	public List<IndvdlPgeCntntsVO> selectIndvdlpgeCntntsList(IndvdlPgeCntntsVO indvdlPgeCntntsVO){
		return (List<IndvdlPgeCntntsVO>) list("IndvdlPgeDAO.selectIndvdlpgeCntntsList", indvdlPgeCntntsVO);
	}

	/**
	 * 마이페이지에 컨텐츠를 추가하기 위해 등록된 마이페이지 컨텐츠 목록을 조회한다.
	 * @param indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 * @return List - 마이페이지 컨텐츠 목록
	 *
	 * @param indvdlPgeCntntsVO
	 */
	@SuppressWarnings("unchecked")
	public List<IndvdlPgeCntntsVO> addIndvdlpgeCntntsList(IndvdlPgeCntntsVO indvdlPgeCntntsVO){
		return (List<IndvdlPgeCntntsVO>) list("IndvdlPgeDAO.addIndvdlpgeCntntsList", indvdlPgeCntntsVO);
	}

	/**
	 * 마이페이지에 컨텐츠를 바로 추가한다.
	 * @param indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 * @return boolean - 성공여부
	 *
	 * @param indvdlPgeCntntsVO
	 */
	public boolean addIndvdlpgeCntnts(IndvdlPgeCntntsVO indvdlPgeCntntsVO){
		try{
			insert("IndvdlPgeDAO.addIndvdlpgeCntnts", indvdlPgeCntntsVO);
			//2017.02.27 김준호 시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]
			} catch(IllegalArgumentException e) {
				LOGGER.error("[IllegalArgumentException] Try/Catch...usingParameters Runing : "+ e.getMessage());
				return false;
			//2017.02.27 김준호 시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]	    	
			}catch(Exception e){
				LOGGER.error("["+e.getClass()+"] Try/Catch...Runing : " + e.getMessage());
				return false;
			}
			return true;
	}

	/**
	 * 마이페이지에서 컨텐츠를 바로 삭제한다.
	 * @param indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 * @return boolean - 성공여부
	 *
	 * @param indvdlPgeCntntsVO
	 */
	public boolean delIndvdlpgeCntnts(IndvdlPgeCntntsVO indvdlPgeCntntsVO){
		try{
			delete("IndvdlPgeDAO.delIndvdlpgeCntnts", indvdlPgeCntntsVO);
			//2017.02.27 김준호 시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]	    			
			} catch(IllegalArgumentException e) {
				LOGGER.error("[IllegalArgumentException] Try/Catch...usingParameters Runing : "+ e.getMessage());
				return false;
			//2017.02.27 김준호 시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]	    			
			}catch(Exception e){
				LOGGER.error("["+e.getClass()+"] Try/Catch...Runing : " + e.getMessage());
				return false;
			}
			return true;
	}

	/**
	 * 마이페이지 컨텐츠가 등록된 개수를 조회한다.
	 * @param indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 * @return int - 마이페이지 컨텐츠 개수
	 */
	public int selectIndvdlpgeCntntsListTotCnt(IndvdlPgeCntntsVO indvdlPgeCntntsVO){
		return (Integer)selectOne("IndvdlPgeDAO.selectIndvdlpgeListTotCnt", indvdlPgeCntntsVO);
	}

	/**
	 * 마이페이지 컨텐츠가 등록된 개수를 조회한다.
	 * @param indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 * @return int - 마이페이지 컨텐츠 개수
	 */
	public int selectIndvdlpgeAddCntntsListTotCnt(IndvdlPgeCntntsVO indvdlPgeCntntsVO){
		return (Integer)selectOne("IndvdlPgeDAO.selectIndvdlpgeAddListTotCnt", indvdlPgeCntntsVO);
	}

	/**
	 * 기 등록된 마이페이지 컨텐츠정보를 수정한다.
	 * @param indvdlPge - 마이페이지 model
	 * @return boolean - 반영성공 여부
	 *
	 * @param indvdlPge
	 */
	public boolean updateIndvdlpgeCntnts(IndvdlPge indvdlPge){
		try{
			update("IndvdlPgeDAO.updateIndvdlpgeCntnts", indvdlPge);
			//2017.02.27 김준호 시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]	    			
			} catch(IllegalArgumentException e) {
				LOGGER.error("[IllegalArgumentException] Try/Catch...usingParameters Runing : "+ e.getMessage());
				return false;
			//2017.02.27 김준호 시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]	   			
			}catch(Exception e){
				LOGGER.error("["+e.getClass()+"] Try/Catch...Runing : " + e.getMessage());
				return false;
			}
			return true;
	}
	/**
	 * 마이페이지 설정여부를 조회한다.
	 * @param indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 * @return int - 마이페이지 컨텐츠 개수
	 */
	public int selectIndvdlpgeResultCnt(IndvdlPgeVO indvdlPgeVO){
		return (Integer)selectOne("IndvdlPgeDAO.selectIndvdlpgeConfCnt", indvdlPgeVO);
	}

	/**
	 * 마이페이지 설정정보를 수정한다.
	 * @param indvdlPgeVO - 마이페이지 콘텐츠 Vo
	 * @return boolean - 작업성공 여부
	 */
	public boolean updateIndvdlpgeConf(IndvdlPgeVO indvdlPgeVO){
		try{
			update("IndvdlPgeDAO.updateIndvdlpgeConf", indvdlPgeVO);
			//2017.02.27 김준호 시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]	    			
			} catch(IllegalArgumentException e) {
				LOGGER.error("[IllegalArgumentException] Try/Catch...usingParameters Runing : "+ e.getMessage());
				return false;
			//2017.02.27 김준호 시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]	   
			}catch(Exception e){
				LOGGER.error("["+e.getClass()+"] Try/Catch...Runing : " + e.getMessage());
				return false;
			}
			return true;
	}

	/**
	 * 마이페이지 설정정보를 추가한다.
	 * @param indvdlPgeVO - 마이페이지 콘텐츠 Vo
	 * @return boolean - 작업성공 여부
	 */
	public boolean insertIndvdlpgeConf(IndvdlPgeVO indvdlPgeVO) throws Exception{
		try{
			update("IndvdlPgeDAO.insertIndvdlpgeConf", indvdlPgeVO);
			//2017.02.27 김준호 시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]	    			
			} catch(IllegalArgumentException e) {
				LOGGER.error("[IllegalArgumentException] Try/Catch...usingParameters Runing : "+ e.getMessage());
				return false;
			//2017.02.27 김준호 시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]	   			
			}catch(Exception e){
				LOGGER.error("["+e.getClass()+"] Try/Catch...Runing : " + e.getMessage());
				return false;
			}
			return true;
	}

	/**
	 * 기 등록된 마이페이지 정보를 조회한다.
	 * @param indvdlPgeVO - 마이페이지 VO
	 * @return indvdlPgeVO - 마이페이지 VO
	 */
	public IndvdlPgeVO selectIndvdlpgeResultView(IndvdlPgeVO indvdlPgeVO) throws Exception {
		return (IndvdlPgeVO) selectOne("IndvdlPgeDAO.selectIndvdlpgeResult", indvdlPgeVO);
	}

	/**
	 * 기 등록된 마이페이지 텝 정보의 카운트를 조회한다.
	 * @param indvdlPgeVO - 마이페이지 VO
	 * @return int
	 */
	public int selectIndvdlpgeResultTotCnt(IndvdlPgeVO indvdlPgeVO) throws Exception {
		return (Integer)selectOne("IndvdlPgeDAO.selectIndvdlpgeResultTotCnt", indvdlPgeVO);
	}

	/**
	 * 기 등록된 마이페이지 정보를 조회한다.
	 * @param indvdlPgeVO - 마이페이지 VO
	 * @return indvdlPgeVO - 마이페이지 VO
	 */
	@SuppressWarnings("unchecked")
	public List<IndvdlPgeVO> selectIndvdlpgeResultDetail(IndvdlPgeVO indvdlPgeVO) throws Exception {
		return (List<IndvdlPgeVO>) list("IndvdlPgeDAO.selectIndvdlpgeResultDetail", indvdlPgeVO);
	}

	/**
	 * 기 등록된 마이페이지 정보의 카운트를 조회한다.
	 * @param indvdlPgeVO - 마이페이지 VO
	 * @return int
	 */
	public int selectIndvdlpgeResultDetailTotCnt(IndvdlPgeVO indvdlPgeVO) throws Exception {
		return (Integer)selectOne("IndvdlPgeDAO.selectIndvdlpgeResultDetailTotCnt", indvdlPgeVO);
	}

}