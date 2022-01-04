package com.DTO;

import java.sql.Date;

public class ReviewDTO {
   
   private String book_title;
   private String mb_nick;
   private String review_content;
   private Date review_date;
   private Double star_point;
   private String review_tag1;
   private String review_tag2;
   private String review_tag3;
   
   
   
   public ReviewDTO(String review_content, Double star_point, Date review_date, String mb_nick) {
      this.review_content = review_content;
      this.star_point = star_point;
      this.review_date = review_date;
      this.mb_nick = mb_nick;
      
   }
   
   public String getBook_title() {
      return book_title;
   }
   public void setBook_title(String book_title) {
      this.book_title = book_title;
   }
   public String getMb_nick() {
      return mb_nick;
   }
   public void setMb_nick(String mb_nick) {
      this.mb_nick = mb_nick;
   }
   public String getReview_content() {
      return review_content;
   }
   public void setReview_content(String review_content) {
      this.review_content = review_content;
   }
   public Date getReview_date() {
      return review_date;
   }
   public void setReview_date(Date review_date) {
      this.review_date = review_date;
   }
   public Double getStar_point() {
      return star_point;
   }
   public void setStar_point(Double star_point) {
      this.star_point = star_point;
   }
   public String getReview_tag1() {
      return review_tag1;
   }
   public void setReview_tag1(String review_tag1) {
      this.review_tag1 = review_tag1;
   }
   public String getReview_tag2() {
      return review_tag2;
   }
   public void setReview_tag2(String review_tag2) {
      this.review_tag2 = review_tag2;
   }
   public String getReview_tag3() {
      return review_tag3;
   }
   public void setReview_tag3(String review_tag3) {
      this.review_tag3 = review_tag3;
   }

}