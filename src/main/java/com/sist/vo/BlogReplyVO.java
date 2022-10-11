package com.sist.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BlogReplyVO {
	private int b_r_no, b_no;
	private String content, pwd, id, dbday, dbtime;
	private Date regdate;
}
