package com.sist.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class QnaVO {
	private int q_no, hit, group_id, isreply, group_step;
	private String content, title, id, dbday;
	private Date regdate, editeddate ;
}
