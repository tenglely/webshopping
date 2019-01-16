package com.shopping.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 订单类
 * @author liten
 *
 */
public class Buy implements Serializable{
		private int id;//id
		private String bno;//订单编号
		private int cno;//用户编号
		private int sno;//商品编号
		private int num;//购买数量
		private int price;//总价
		private String address;//收货地址
		private Date date;//日期
		private String buystate;//购买状态
		private String shipment;//出货状态
		private String couriernumber;//快递编号
		
		public Buy() {
			super();
		}

		public Buy(int id, String bno, int cno, int sno, int num, int price, String address, Date date, String buystate,
				String shipment, String couriernumber) {
			super();
			this.id = id;
			this.bno = bno;
			this.cno = cno;
			this.sno = sno;
			this.num = num;
			this.price = price;
			this.address = address;
			this.date = date;
			this.buystate = buystate;
			this.shipment = shipment;
			this.couriernumber = couriernumber;
		}

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getBno() {
			return bno;
		}

		public void setBno(String bno) {
			this.bno = bno;
		}

		public int getCno() {
			return cno;
		}

		public void setCno(int cno) {
			this.cno = cno;
		}

		public int getSno() {
			return sno;
		}

		public void setSno(int sno) {
			this.sno = sno;
		}

		public int getNum() {
			return num;
		}

		public void setNum(int num) {
			this.num = num;
		}

		public int getPrice() {
			return price;
		}

		public void setPrice(int price) {
			this.price = price;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public Date getDate() {
			return date;
		}

		public void setDate(Date date) {
			this.date = date;
		}

		public String getBuystate() {
			return buystate;
		}

		public void setBuystate(String buystate) {
			this.buystate = buystate;
		}

		public String getShipment() {
			return shipment;
		}

		public void setShipment(String shipment) {
			this.shipment = shipment;
		}

		public String getCouriernumber() {
			return couriernumber;
		}

		public void setCouriernumber(String couriernumber) {
			this.couriernumber = couriernumber;
		}

		@Override
		public String toString() {
			return "Buy [id=" + id + ", bno=" + bno + ", cno=" + cno + ", sno=" + sno + ", num=" + num + ", price="
					+ price + ", address=" + address + ", date=" + date + ", buystate=" + buystate + ", shipment="
					+ shipment + ", couriernumber=" + couriernumber + "]";
		}

	
}
