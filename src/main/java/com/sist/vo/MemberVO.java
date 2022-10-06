package com.sist.vo;

import java.util.*;
import lombok.Getter;
import lombok.Setter;

/*
 *  ID        NOT NULL VARCHAR2(340) 
PW        NOT NULL VARCHAR2(260) 
NAME      NOT NULL VARCHAR2(34)  
SEX                VARCHAR2(10)  
BIRTH              VARCHAR2(34)  
PHONE     NOT NULL VARCHAR2(34)  
EMAIL     NOT NULL VARCHAR2(34)  
ADDR1     NOT NULL VARCHAR2(340) 
ADDR2     NOT NULL VARCHAR2(340) 
ZIPCODE   NOT NULL VARCHAR2(260) 
ADMIN     NOT NULL VARCHAR2(10)  
JOINDATE  NOT NULL DATE          
SESSIONID NOT NULL VARCHAR2(340) 
*/
@Getter
@Setter
public class MemberVO {
	private String id,pw,name,sex,birth,phone,email,addr1,addr2,zipcode,admin,sessionID;
	private Date joindate;
}
