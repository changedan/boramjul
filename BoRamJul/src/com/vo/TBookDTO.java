package com.vo;

import java.util.Date;

// å ���� ���̺� 
public class TBookDTO {

    private int book_Seq;
    private String book_Title;
    private Date book_Date;
    private String book_Author;
    private String book_Brief;
    private String book_Cat;
    private String book_Publisher;
    private int book_Pages;
    private String book_Content;
    private String book_Cover;
    private String book_Hashtag;
    private String mb_Id;
    private String book_Kind;
    private int book_Rank;
    private Double book_SizeW;
    private Double book_SizeH;
    
    
    public TBookDTO(int book_Seq, String book_Title, String book_Brief, String book_Cover) {
		this.book_Seq = book_Seq;
		this.book_Title = book_Title;
		this.book_Brief = book_Brief;
		this.book_Cover = book_Cover;
	}
    
    public TBookDTO(int book_seq, String book_title, String book_author, String book_cover,String book_publisher) {
  		this.book_Seq = book_seq;
  		this.book_Title = book_title;
  		this.book_Author = book_author;
  		this.book_Cover = book_cover;
  		this.book_Publisher = book_publisher;
  	}
    

	public TBookDTO(int book_Seq, String book_Title, Date book_Date, String book_Author, String book_Brief,
			String book_Cat, String book_Publisher, int book_Pages, String book_Content, String book_Cover,
			String book_Hashtag, String book_Kind, int book_Rank, Double book_SizeW, Double book_SizeH) {
		this.book_Seq = book_Seq;
		this.book_Title = book_Title;
		this.book_Date = book_Date;
		this.book_Author = book_Author;
		this.book_Brief = book_Brief;
		this.book_Cat = book_Cat;
		this.book_Publisher = book_Publisher;
		this.book_Pages = book_Pages;
		this.book_Content = book_Content;
		this.book_Cover = book_Cover;
		this.book_Hashtag = book_Hashtag;
		this.book_Kind = book_Kind;
		this.book_Rank = book_Rank;
		this.book_SizeW = book_SizeW;
		this.book_SizeH = book_SizeH;
	}



	public TBookDTO(int book_seq, String book_title, String book_brief, String book_cover, String book_author, String book_publisher) {
		this.book_Seq = book_seq;
		this.book_Title = book_title;
		this.book_Brief = book_brief;
		this.book_Cover = book_cover;
		this.book_Author = book_author;
		this.book_Publisher = book_publisher;
	}


	public int getBookSeq() {
        return book_Seq;
    }

    public void setBookSeq(int book_Seq) {
        this.book_Seq = book_Seq;
    }

    public String getBookTitle() {
        return book_Title;
    }

    public void setBookTitle(String book_Title) {
        this.book_Title = book_Title;
    }

    public Date getBookDate() {
        return book_Date;
    }

    public void setBookDate(Date book_Date) {
        this.book_Date = book_Date;
    }

    public String getBookAuthor() {
        return book_Author;
    }

    public void setBookAuthor(String book_Author) {
        this.book_Author = book_Author;
    }

    public String getBookBrief() {
        return book_Brief;
    }

    public void setBookBrief(String book_Brief) {
        this.book_Brief = book_Brief;
    }

    public String getBookCat() {
        return book_Cat;
    }

    public void setBookCat(String book_Cat) {
        this.book_Cat = book_Cat;
    }

    public String getBookPublisher() {
        return book_Publisher;
    }

    public void setBookPublisher(String book_Publisher) {
        this.book_Publisher = book_Publisher;
    }

    public int getBookPages() {
        return book_Pages;
    }

    public void setBookPages(int book_Pages) {
        this.book_Pages = book_Pages;
    }

    public String getBookContent() {
        return book_Content;
    }

    public void setBookContent(String book_Content) {
        this.book_Content = book_Content;
    }

    public String getBookCover() {
        return book_Cover;
    }

    public void setBookCover(String book_Cover) {
        this.book_Cover = book_Cover;
    }

    public String getBookHashtag() {
        return book_Hashtag;
    }

    public void setBookHashtag(String book_Hashtag) {
        this.book_Hashtag = book_Hashtag;
    }

    public String getMbId() {
        return mb_Id;
    }

    public void setMbId(String mb_Id) {
        this.mb_Id = mb_Id;
    }

    public String getBookKind() {
        return book_Kind;
    }

    public void setBookKind(String book_Kind) {
        this.book_Kind = book_Kind;
    }

    public int getBookRank() {
        return book_Rank;
    }

    public void setBookRank(int book_Rank) {
        this.book_Rank = book_Rank;
    }

    public Double getBookSizeW() {
        return book_SizeW;
    }

    public void setBookSizeW(Double book_SizeW) {
        this.book_SizeW = book_SizeW;
    }

    public Double getBookSizeH() {
        return book_SizeH;
    }

    public void setBookSizeH(Double book_SizeH) {
        this.book_SizeH = book_SizeH;
    }

    // TBook �� ����
    public void CopyData(TBookDTO param)
    {
        this.book_Seq = param.getBookSeq();
        this.book_Title = param.getBookTitle();
        this.book_Date = param.getBookDate();
        this.book_Author = param.getBookAuthor();
        this.book_Brief = param.getBookBrief();
        this.book_Cat = param.getBookCat();
        this.book_Publisher = param.getBookPublisher();
        this.book_Pages = param.getBookPages();
        this.book_Content = param.getBookContent();
        this.book_Cover = param.getBookCover();
        this.book_Hashtag = param.getBookHashtag();
        this.mb_Id = param.getMbId();
        this.book_Kind = param.getBookKind();
        this.book_Rank = param.getBookRank();
        this.book_SizeW = param.getBookSizeW();
        this.book_SizeH = param.getBookSizeH();
    }
}