package com.shopping.model;

import java.io.Serializable;

/**
 * 用户类
 * @author liten
 *
 */
public class Client implements Serializable {
		private int cno;//编号
		private String cname;//用户名
		private String cpassword;//用户密码
		private String cclass;//用户类型
		private String csex;//性别
		private int cage;//年龄
		private String cphone;//用户电话
		private String caddress;//收货地址
		
		public Client() {
			super();
		}

		public Client(int cno, String cname, String cpassword, String cclass, String csex, int cage, String cphone,
				String caddress) {
			super();
			this.cno = cno;
			this.cname = cname;
			this.cpassword = cpassword;
			this.cclass = cclass;
			this.csex = csex;
			this.cage = cage;
			this.cphone = cphone;
			this.caddress = caddress;
		}

		public int getCno() {
			return cno;
		}

		public void setCno(int cno) {
			this.cno = cno;
		}

		public String getCname() {
			return cname;
		}

		public void setCname(String cname) {
			this.cname = cname;
		}

		public String getCpassword() {
			return cpassword;
		}

		public void setCpassword(String cpassword) {
			this.cpassword = cpassword;
		}

		public String getCclass() {
			return cclass;
		}

		public void setCclass(String cclass) {
			this.cclass = cclass;
		}

		public String getCsex() {
			return csex;
		}

		public void setCsex(String csex) {
			this.csex = csex;
		}

		public int getCage() {
			return cage;
		}

		public void setCage(int cage) {
			this.cage = cage;
		}

		public String getCphone() {
			return cphone;
		}

		public void setCphone(String cphone) {
			this.cphone = cphone;
		}

		public String getCaddress() {
			return caddress;
		}

		public void setCaddress(String caddress) {
			this.caddress = caddress;
		}

		@Override
		public String toString() {
			return "Client [cno=" + cno + ", cname=" + cname + ", cpassword=" + cpassword + ", cclass=" + cclass
					+ ", csex=" + csex + ", cage=" + cage + ", cphone=" + cphone + ", caddress=" + caddress + "]";
		}

		

}
