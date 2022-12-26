package org.zerock.domain;

import lombok.Getter;
import lombok.ToString;

@ToString
@Getter

public class PageDTO {
	private int startPage,endPage;
	
	private boolean prev,next;
	
	private int total;
	private Criteria cri;//pageNum amount
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum()/ 10.0)) * 10;//0.1(1),0.2(1),...... 1.0(1),1.1(2)....
		
		this.startPage = endPage - 9;//10-9 = 1 , 20-9 = 11 .......
		
		this.prev =  this.startPage > 1;//true-> 11~20 page.....     ,   false-> 1~10page 
		
		int realEnd = (int)(Math.ceil( (total * 1.0) / cri.getAmount()) );
		
		this.endPage = realEnd <= endPage? realEnd : endPage;
		
		this.next = this.endPage < realEnd;
	}
}
