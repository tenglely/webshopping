package com.shopping.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.shopping.model.Client;
import com.shopping.service.ClientService;

public class ClientAction extends ActionSupport{
		private ClientService clientService;
		private List<Client> list;
		private String key;
		private String value;
		private int cno;
		private String cname;
		private String cpassword;
		private String csex;
		private int cage;
		private String cphone;
		private String caddress;
		private Client client;
		/**
		 * 查找所有用户信息
		 * @return
		 * @throws Exception
		 */
		public String seeallclient() throws Exception{
			list=clientService.getAll();
			ActionContext act=ActionContext.getContext();
			act.getSession().put("list", list);
			return SUCCESS;
		}
 		
		/**
		 * 查询用户
		 * @return
		 * @throws Exception
		 */
		public String searchclient() throws Exception{
			if(key.equals("所有用户")){
				list=clientService.getAll();
			}
			if(key.equals("用户名")){
				list=clientService.getAllByName(value);
			}
			if(key.equals("性别")){
				list=clientService.getAllBySex(value);
			}
			if(key.equals("用户编号")){
				list=clientService.getAllByCno(Integer.parseInt(value));
				}
			ActionContext act=ActionContext.getContext();
			act.getSession().put("list", list);
			return SUCCESS;
		}
		
		/**
		 * 删除一条用户信息
		 * @return
		 * @throws Exception
		 */
		public String deleteclient() throws Exception{
			boolean result=clientService.deleteById(cno);
			if(result)
				return SUCCESS;
			else
				return ERROR;
		}
		
		/**
		 * 用户登陆,包括管理员，顾客
		 * @return
		 * @throws Exception
		 */
		public String clientlogin() throws Exception{
			Client client=clientService.login(cname, cpassword);
			if(client!=null&&client.getCclass().equals("管理员")){
				ActionContext act=ActionContext.getContext();
				act.getSession().put("client", client);
				return "manager";
			}
			if(client!=null&&client.getCclass().equals("用户")){
				ActionContext act=ActionContext.getContext();
				act.getSession().put("client", client);
				return "client";
			}
				this.setKey("登陆失败");
				return "loginfalse";
		}
		
		/**
		 * 添加一条用户
		 * @return
		 * @throws Exception
		 */
		public String addclient() throws Exception{
			Client client=new Client();
			client.setCname(cname);
			client.setCpassword(cpassword);
			client.setCclass("用户");
			client.setCage(cage);
			client.setCsex(csex);
			client.setCphone(cphone);
			client.setCaddress(caddress);
			boolean result=clientService.save(client);
			ActionContext act=ActionContext.getContext();
			act.getSession().put("client", client);
			if(result)
				return SUCCESS;
			else
				return ERROR;
		}
		
		/**
		 * 查找一条用户信息，用于修改
		 * @return
		 * @throws Exception
		 */
		public String findoneclient() throws Exception{
			client=clientService.get(cno);
			return SUCCESS;
		}
		
		/**
		 * 修改一条用户信息
		 * @return
		 * @throws Exception
		 */
		public String updateclient() throws Exception{
			clientService.update(client);
			if(client.getCclass().equals("管理员"))
				return "manager";
			else
				return "client";
		}
		
		/**
		 * main.jsp获取数据，用于展示和输出数据报表 
		 * @return
		 * @throws Exception
		 */
		public String outputclient() throws Exception{
			list=clientService.getAll();
			ActionContext act=ActionContext.getContext();
			act.getSession().put("outclient", list);
			return SUCCESS;
		}
		/**
		 *getter和setter方法 
		 */
		
		public ClientService getClientService() {
			return clientService;
		}

		public void setClientService(ClientService clientService) {
			this.clientService = clientService;
		}

		public List<Client> getList() {
			return list;
		}

		public void setList(List<Client> list) {
			this.list = list;
		}

		public String getKey() {
			return key;
		}

		public void setKey(String key) {
			this.key = key;
		}

		public String getValue() {
			return value;
		}

		public void setValue(String value) {
			this.value = value;
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

		public Client getClient() {
			return client;
		}

		public void setClient(Client client) {
			this.client = client;
		}
	
		
		
}
