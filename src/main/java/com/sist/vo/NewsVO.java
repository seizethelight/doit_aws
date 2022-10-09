package com.sist.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class NewsVO {
	private int n_no, hit, goodcount, badcount;
	private String content, title, id, dbday, etdate, cate, img;
	private Date regdate, editeddate;
}
