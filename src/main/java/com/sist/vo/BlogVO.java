package com.sist.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class BlogVO {
	private int b_no, hit;
	private String id, title, content, dbday, cate;
	private Date regdate;
}
