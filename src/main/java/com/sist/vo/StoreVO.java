package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*
 * t4_s_all
 * 
 * Name        Null?    Type           
----------- -------- -------------- 
S_NO        NOT NULL NUMBER         
NAME        NOT NULL VARCHAR2(1000) 
PRICE                VARCHAR2(20)   
FIRST_PRICE NOT NULL VARCHAR2(20)   
POSTER      NOT NULL VARCHAR2(1000) 
C_NO                 VARCHAR2(10)   

 */
@Getter
@Setter
public class StoreVO {
	private int s_no,store_price,hit;
	private String name ,price,first_price,poster,c_no,img1,img2,img3;
}
