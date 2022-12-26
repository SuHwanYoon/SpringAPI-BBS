package org.zerock.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int pageNum,amount;
	
	private String keyword,type;
	
	public Criteria() {
		this(1,10);// 1pageNum  &  10 amount
	}
	


	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
	
}


