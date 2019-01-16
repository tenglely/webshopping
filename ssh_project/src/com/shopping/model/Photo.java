package com.shopping.model;

import java.io.Serializable;

/**
 * 图片类
 * @author liten
 *
 */
public class Photo implements Serializable{
		private int pno;//图片编号
		private String shopname;//商品名
		private String pname;//图片名
		
		public Photo() {
			super();
		}
		public Photo(int pno, String shopname, String pname) {
			super();
			this.pno = pno;
			this.shopname = shopname;
			this.pname = pname;
		}
		
		public int getPno() {
			return pno;
		}
		public void setPno(int pno) {
			this.pno = pno;
		}
		public String getShopname() {
			return shopname;
		}
		public void setShopname(String shopname) {
			this.shopname = shopname;
		}
		public String getPname() {
			return pname;
		}
		public void setPname(String pname) {
			this.pname = pname;
		}
		
		@Override
		public String toString() {
			return "Photo [pno=" + pno + ", shopname=" + shopname + ", pname=" + pname + "]";
		}
		
		
}
