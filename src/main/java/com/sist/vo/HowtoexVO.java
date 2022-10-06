package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*
 *  EX_NO          NOT NULL NUMBER        
	EX_TITLE       NOT NULL VARCHAR2(100) 
	EX_OUTLINE     NOT NULL VARCHAR2(500) 
	EX_LEVEL       NOT NULL VARCHAR2(100) 
	EX_BODYPART    NOT NULL VARCHAR2(100) 
	EX_MUSCLEPART1 NOT NULL VARCHAR2(100) 
	PIC1           NOT NULL VARCHAR2(500) 
	SUB1           NOT NULL VARCHAR2(500) 
	PIC2                    VARCHAR2(500) 
	SUB2                    VARCHAR2(500) 
	PIC3                    VARCHAR2(500) 
	SUB3                    VARCHAR2(500) 
	PIC4                    VARCHAR2(500) 
	SUB4                    VARCHAR2(500) 
	EX_HIT                  NUMBER        
	EX_GOOD                 NUMBER        
	EX_MUSCLEPART2 NOT NULL VARCHAR2(100) 
 * */
@Getter
@Setter
public class HowtoexVO {
	private int ex_no, ex_hit, ex_good;
	private String  ex_title, ex_outline, ex_level, ex_bodypart, ex_musclepart1, pic1, pic2, pic3, pic4, sub1, sub2, sub3, sub4, ex_musclepart2;

}
