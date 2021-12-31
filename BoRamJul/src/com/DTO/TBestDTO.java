package com.DTO;

public class TBestDTO {
	
	private String book_title;
	private String book_rank;
	
	public TBestDTO(String book_title, String book_rank) {
		this.book_title = book_title;
		this.book_rank = book_rank;
	}

	public String getBook_title() {
		return book_title;
	}

	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}

	public String getBook_rank() {
		return book_rank;
	}

	public void setBook_rank(String book_rank) {
		this.book_rank = book_rank;
	}
	
	
	
}
