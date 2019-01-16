package com.shopping.model;

import java.io.Serializable;

/**
 * 图文信息类
 * @author liten
 *
 */
public class Message implements Serializable{
		private int id;//id
		private String shopname;//商品名
		private String message;//图文信息
		
		public Message() {
			super();
		}

		public Message(int id, String shopname, String message) {
			super();
			this.id = id;
			this.shopname = shopname;
			this.message = message;
		}

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getShopname() {
			return shopname;
		}

		public void setShopname(String shopname) {
			this.shopname = shopname;
		}

		public String getMessage() {
			return message;
		}

		public void setMessage(String message) {
			this.message = message;
		}

		@Override
		public String toString() {
			return "Message [id=" + id + ", shopname=" + shopname + ", message=" + message + "]";
		}
		
		
}
