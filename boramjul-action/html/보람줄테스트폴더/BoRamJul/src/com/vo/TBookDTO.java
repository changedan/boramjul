package com.vo;

import java.util.Date;

// å ���� ���̺� 
public class TBookDTO {

    // å ���� 
    private Double bookSeq;

    // å ���� 
    private String bookTitle;

    // å �Ⱓ�� 
    private Date bookDate;

    // å ���� 
    private String bookAuthor;

    // å ��� 
    private String bookBrief;

    // å ī�װ� 
    private String bookCat;

    // å ���ǻ� 
    private String bookPublisher;

    // å �ʼ� 
    private Double bookPages;

    // å ���� 
    private String bookContent;

    // å ǥ���̹��� 
    private String bookCover;

    // å �ؽ��±� 
    private String bookHashtag;

    // ����� ���̵� 
    private String mbId;

    // å ���� 
    private String bookKind;

    // å ���� 
    private Double bookRank;

    // å ������ ���� 
    private Double bookSizeW;

    // å ������ ���� 
    private Double bookSizeH;

    public Double getBookSeq() {
        return bookSeq;
    }

    public void setBookSeq(Double bookSeq) {
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

    public Double getBookPages() {
        return bookPages;
    }

    public void setBookPages(Double bookPages) {
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

    public Double getBookRank() {
        return bookRank;
    }

    public void setBookRank(Double bookRank) {
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