package com.vo;

import java.util.Date;

// å ���� ���̺� 
public class TBookDTO {

    private int bookSeq;
    private String bookTitle;
    private Date bookDate;
    private String bookAuthor;
    private String bookBrief;
    private String bookCat;
    private String bookPublisher;
    private int bookPages;
    private String bookContent;
    private String bookCover;
    private String bookHashtag;
    private String mbId;
    private String bookKind;
    private int bookRank;
    private Double bookSizeW;
    private Double bookSizeH;
    
    
    public TBookDTO(int bookSeq, String bookTitle, String bookBrief, String bookCover) {
		this.bookSeq = bookSeq;
		this.bookTitle = bookTitle;
		this.bookBrief = bookBrief;
		this.bookCover = bookCover;
	}
    

	public TBookDTO(int bookSeq, String bookTitle, Date bookDate, String bookAuthor, String bookBrief,
			String bookCat, String bookPublisher, int bookPages, String bookContent, String bookCover,
			String bookHashtag, String bookKind, int bookRank, Double bookSizeW, Double bookSizeH) {
		this.bookSeq = bookSeq;
		this.bookTitle = bookTitle;
		this.bookDate = bookDate;
		this.bookAuthor = bookAuthor;
		this.bookBrief = bookBrief;
		this.bookCat = bookCat;
		this.bookPublisher = bookPublisher;
		this.bookPages = bookPages;
		this.bookContent = bookContent;
		this.bookCover = bookCover;
		this.bookHashtag = bookHashtag;
		this.bookKind = bookKind;
		this.bookRank = bookRank;
		this.bookSizeW = bookSizeW;
		this.bookSizeH = bookSizeH;
	}



	public TBookDTO() {
		// TODO Auto-generated constructor stub
	}


	public int getBookSeq() {
        return bookSeq;
    }

    public void setBookSeq(int bookSeq) {
        this.bookSeq = bookSeq;
    }

    public String getBookTitle() {
        return bookTitle;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public Date getBookDate() {
        return bookDate;
    }

    public void setBookDate(Date bookDate) {
        this.bookDate = bookDate;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public String getBookBrief() {
        return bookBrief;
    }

    public void setBookBrief(String bookBrief) {
        this.bookBrief = bookBrief;
    }

    public String getBookCat() {
        return bookCat;
    }

    public void setBookCat(String bookCat) {
        this.bookCat = bookCat;
    }

    public String getBookPublisher() {
        return bookPublisher;
    }

    public void setBookPublisher(String bookPublisher) {
        this.bookPublisher = bookPublisher;
    }

    public int getBookPages() {
        return bookPages;
    }

    public void setBookPages(int bookPages) {
        this.bookPages = bookPages;
    }

    public String getBookContent() {
        return bookContent;
    }

    public void setBookContent(String bookContent) {
        this.bookContent = bookContent;
    }

    public String getBookCover() {
        return bookCover;
    }

    public void setBookCover(String bookCover) {
        this.bookCover = bookCover;
    }

    public String getBookHashtag() {
        return bookHashtag;
    }

    public void setBookHashtag(String bookHashtag) {
        this.bookHashtag = bookHashtag;
    }

    public String getMbId() {
        return mbId;
    }

    public void setMbId(String mbId) {
        this.mbId = mbId;
    }

    public String getBookKind() {
        return bookKind;
    }

    public void setBookKind(String bookKind) {
        this.bookKind = bookKind;
    }

    public int getBookRank() {
        return bookRank;
    }

    public void setBookRank(int bookRank) {
        this.bookRank = bookRank;
    }

    public Double getBookSizeW() {
        return bookSizeW;
    }

    public void setBookSizeW(Double bookSizeW) {
        this.bookSizeW = bookSizeW;
    }

    public Double getBookSizeH() {
        return bookSizeH;
    }

    public void setBookSizeH(Double bookSizeH) {
        this.bookSizeH = bookSizeH;
    }

    // TBook �� ����
    public void CopyData(TBookDTO param)
    {
        this.bookSeq = param.getBookSeq();
        this.bookTitle = param.getBookTitle();
        this.bookDate = param.getBookDate();
        this.bookAuthor = param.getBookAuthor();
        this.bookBrief = param.getBookBrief();
        this.bookCat = param.getBookCat();
        this.bookPublisher = param.getBookPublisher();
        this.bookPages = param.getBookPages();
        this.bookContent = param.getBookContent();
        this.bookCover = param.getBookCover();
        this.bookHashtag = param.getBookHashtag();
        this.mbId = param.getMbId();
        this.bookKind = param.getBookKind();
        this.bookRank = param.getBookRank();
        this.bookSizeW = param.getBookSizeW();
        this.bookSizeH = param.getBookSizeH();
    }
}