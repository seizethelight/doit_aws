package com.sist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
/*
 * Name        Null?    Type          
----------- -------- ------------- 
O_NO        NOT NULL NUMBER        
O_DATE      NOT NULL DATE          
TOTAL_PRICE          NUMBER        
STATE                NUMBER        
ID          NOT NULL VARCHAR2(340) 
NO          NOT NULL NUMBER        
COUNT       NOT NULL NUMBER        

 */
public class OrderVO {
	private int o_no, no, total_price;
	private String id, name, poster, dbday;
	private Date o_date;
}
