package com.shopping.model;

import java.io.Serializable;

/**
 * 商品类
 * @author liten
 *
 */
public class Shop implements Serializable{
		private int sno;//编号
		private String sfname;//品牌名
		private String shopname;//商品名
		private String shopclass;//商品种类：跑步鞋/休闲鞋。。。
		private String sclass;//用户类型 男或女
		private int size;//尺码
		private int price;//单价
		private int count;//库存
		private String remark;//备注
		

		public Shop() {
			super();
		}
		
		public Shop(int sno, String sfname, String shopname, String shopclass, String sclass, int size, int price,
				int count, String remark) {
			super();
			this.sno = sno;
			this.sfname = sfname;
			this.shopname = shopname;
			this.shopclass = shopclass;
			this.sclass = sclass;
			this.size = size;
			this.price = price;
			this.count = count;
			this.remark = remark;
		}
		public int getSno() {
			return sno;
		}
		public void setSno(int sno) {
			this.sno = sno;
		}
		public String getSfname() {
			return sfname;
		}
		public void setSfname(String sfname) {
			this.sfname = sfname;
		}
		public String getShopname() {
			return shopname;
		}
		public void setShopname(String shopname) {
			this.shopname = shopname;
		}
		public String getShopclass() {
			return shopclass;
		}
		public void setShopclass(String shopclass) {
			this.shopclass = shopclass;
		}
		public String getSclass() {
			return sclass;
		}
		public void setSclass(String sclass) {
			this.sclass = sclass;
		}
		public int getSize() {
			return size;
		}
		public void setSize(int size) {
			this.size = size;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		public int getCount() {
			return count;
		}
		public void setCount(int count) {
			this.count = count;
		}
		public String getRemark() {
			return remark;
		}
		public void setRemark(String remark) {
			this.remark = remark;
		}
		
		@Override
		public String toString() {
			return "Shop [sno=" + sno + ", sfname=" + sfname + ", shopname=" + shopname + ", shopclass=" + shopclass
					+ ", sclass=" + sclass + ", size=" + size + ", price=" + price + ", count=" + count + ", remark="
					+ remark + "]";
		}
			
}
