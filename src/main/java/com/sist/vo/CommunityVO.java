package com.sist.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class CommunityVO {
	private int c_no, hit;
	private String title, content, id;
	private Date regdate,dbday, edited_date;
}
