package com.sist.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class ForumVO {
	private int f_no, hit;
	private String title, content, id, dbday, etdate, sid;
	private Date regdate, editeddate;
}
