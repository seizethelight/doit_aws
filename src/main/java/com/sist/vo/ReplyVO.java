package com.sist.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class ReplyVO {
	private int f_no, f_r_no, group_id, group_step, group_tab;
	private String content, id, dbday;
	private Date regdate;
}
