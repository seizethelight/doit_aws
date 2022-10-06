package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*
 * t4_image
 * 
 * Name   Null?    Type           
------ -------- -------------- 
IMG_NO NOT NULL NUMBER         
IMG1            VARCHAR2(1000) 
IMG2            VARCHAR2(1000) 
IMG3            VARCHAR2(1000) 
IMG4            VARCHAR2(1000) 
IMG5            VARCHAR2(1000) 
IMG6            VARCHAR2(1000) 
IMG7            VARCHAR2(1000) 
IMG8            VARCHAR2(1000) 
IMG9            VARCHAR2(1000) 
IMG10           VARCHAR2(1000) 
CATE            VARCHAR2(20)   

 */
@Getter
@Setter
public class StoreImgVO {
	private int img_no;
	private String img1,img2,img3,img4,img5,img6,img7,img8,img9,img10,cate;
}
