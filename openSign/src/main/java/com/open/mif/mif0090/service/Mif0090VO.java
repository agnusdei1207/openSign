package com.open.mif.mif0090.service;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.util.StringUtil;

/**
 * Content VO 클래스
 * @author 공통서비스 개발팀 yd.go
 * @since 2016.09.08
 * @version 1.0
 * @see
 *  
 
 */
@Alias("mif0090VO")
public class Mif0090VO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String clSlctYearMnth;
	private String clPrevYearMnth;
	private String clNextYearMnth;
	private String clFirstDayOfWeek;
	private String clLastDay;
	
	public String getClSlctYearMnth() {
		return clSlctYearMnth;
	}
	public void setClSlctYearMnth(String clSlctYearMnth) {
		this.clSlctYearMnth = clSlctYearMnth;
	}
	public String getClPrevYearMnth() {
		return clPrevYearMnth;
	}
	public void setClPrevYearMnth(String clPrevYearMnth) {
		this.clPrevYearMnth = clPrevYearMnth;
	}
	public String getClNextYearMnth() {
		return clNextYearMnth;
	}
	public void setClNextYearMnth(String clNextYearMnth) {
		this.clNextYearMnth = clNextYearMnth;
	}
	public String getClFirstDayOfWeek() {
		return clFirstDayOfWeek;
	}
	public void setClFirstDayOfWeek(String clFirstDayOfWeek) {
		this.clFirstDayOfWeek = clFirstDayOfWeek;
	}
	public String getClLastDay() {
		return clLastDay;
	}
	public void setClLastDay(String clLastDay) {
		this.clLastDay = clLastDay;
	}
}