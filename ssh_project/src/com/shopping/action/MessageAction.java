package com.shopping.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.shopping.model.Client;
import com.shopping.model.Message;
import com.shopping.model.Shop;
import com.shopping.service.MessageService;

public class MessageAction extends ActionSupport{
		private MessageService messageService;
		private String shopname;
		private String editorValue;
		private List<Message> list;
		
		/**
		 * 添加/修改一条图文信息
		 * @return
		 * @throws Exception
		 */
		public String addMessage() throws Exception{
		  if(messageService.get(shopname)==null){
			Message message=new Message();
			message.setShopname(shopname);
			message.setMessage(editorValue);
			System.out.println(message);
			HttpServletRequest request=ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			boolean result=messageService.save(message);
			if(result)
				return "addmessage";
			else 
				return "error";
			}else{
				Message message=messageService.get(shopname);
				message.setMessage(editorValue);
				messageService.update(message);
				return "success";
			}
		}
		
		/**
		 * 查找一条图文信息
		 * @return
		 * @throws Exception
		 */
		public String seeOneMessage() throws Exception{
			HttpServletRequest request=ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			String sn=(String)session.getAttribute("shopname");
			Message message=messageService.get(sn);
			session.setAttribute("message",message);
			System.out.println(message);
			Client client=(Client)session.getAttribute("client");
			if(client!=null&&client.getCclass().equals("管理员"))
				return "manager";
			else
				return "client";
		}
		/**
		 * 删除一条图文
		 * @return
		 * @throws Exception
		 */
		public String deletemessage() throws Exception{
			HttpServletRequest request=ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			String sn=(String)session.getAttribute("shopname");
			messageService.deleteById(sn);
			return SUCCESS;
		}
		
		/**
		 * 列表栏的属性
		 */
		private String one;
		private String two;
		private String three;
		private String four;
		private String five;
		/**
		 * 编辑首页列表栏
		 * @return
		 * @throws Exception
		 */
		public String updatelist() throws Exception{
				Message m1=messageService.get("热门商品");
				m1.setMessage(one);
				messageService.update(m1);
				Message m2=messageService.get("名牌");
				m2.setMessage(two);
				messageService.update(m2);
				Message m3=messageService.get("鞋类");
				m3.setMessage(three);
				messageService.update(m3);
				Message m4=messageService.get("男鞋");
				m4.setMessage(four);
				messageService.update(m4);
				Message m5=messageService.get("女鞋");
				m5.setMessage(five);
				messageService.update(m5);
				ActionContext act=ActionContext.getContext();
				act.getSession().put("one", m1);
				act.getSession().put("two", m2);
				act.getSession().put("three", m3);
				act.getSession().put("four", m4);
				act.getSession().put("five", m5);
				return SUCCESS;
		}
		/**
		 * 管理员点击编辑列表后，获取之前的数据
		 * @return
		 * @throws Exception
		 */
		public String seelist() throws Exception{
			Message m1=messageService.get("热门商品");
			Message m2=messageService.get("名牌");
			Message m3=messageService.get("鞋类");
			Message m4=messageService.get("男鞋");
			Message m5=messageService.get("女鞋");
		
			ActionContext act=ActionContext.getContext();
			act.getSession().put("one", m1);
			act.getSession().put("two", m2);
			act.getSession().put("three", m3);
			act.getSession().put("four", m4);
			act.getSession().put("five", m5);
			return SUCCESS;
		}
		
		/**
		 * 修改一种商品的message的shopname
		 * @return
		 * @throws Exception
		 */
		public String updatemessageshopname() throws Exception{
			HttpServletRequest request=ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			String oldsn=(String) session.getAttribute("oldsn");
			String newsn=(String) session.getAttribute("newsn");
			list=messageService.getallByshopname(oldsn);
			for(Message message:list){
				message.setShopname(newsn);
				messageService.update(message);
			}
			return SUCCESS;
		}
		
		/**
		 * 在首页显示列表栏信息
		 * @return
		 * @throws Exception
		 */
		public String watchlist() throws Exception{
			Message m1=messageService.get("热门商品");
			Message m2=messageService.get("名牌");
			Message m3=messageService.get("鞋类");
			Message m4=messageService.get("男鞋");
			Message m5=messageService.get("女鞋");
			HttpServletRequest request=ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			List<Shop> sList=(List<Shop>)session.getAttribute("getshopmessage");
			System.out.println(sList);
			List<String> ml1=new ArrayList<>();
			List<String> ml2=new ArrayList<>();
			List<String> ml3=new ArrayList<>();
			List<String> ml4=new ArrayList<>();
			List<String> ml5=new ArrayList<>();
			String s3="kong";
			for(Shop shop:sList){
				if(m1.getMessage().indexOf(shop.getShopname())>=0){
					if(s3.indexOf(shop.getShopname())<0){
						ml1.add(shop.getShopname());
						s3+=shop.getShopname();
				  }	
				}
			}
			String s1="kong";
			for(Shop shop:sList){
				if(m2.getMessage().indexOf(shop.getSfname())>=0){
					if(s1.indexOf(shop.getSfname())<0){
						ml2.add(shop.getSfname());
						s1+=shop.getSfname();
					}
				}
			}
			String s2="kong";
			for(Shop shop:sList){
				if(m3.getMessage().indexOf(shop.getShopclass())>=0){
					if(s2.indexOf(shop.getShopclass())<0){
						ml3.add(shop.getShopclass());
						s2+=shop.getShopclass();
					}
				}
			}
			String s4="kong";
			for(Shop shop:sList){
				if(m4.getMessage().indexOf(shop.getShopname())>=0){
					if(s4.indexOf(shop.getShopname())<0){
						ml4.add(shop.getShopname());
						s4+=shop.getShopname();
				  }	
				}
			}
			String s5="kong";
			for(Shop shop:sList){
				if(m5.getMessage().indexOf(shop.getShopname())>=0){
					if(s5.indexOf(shop.getShopname())<0){
						ml5.add(shop.getShopname());
						s5+=shop.getShopname();
				  }	
				}
			}
			session.setAttribute("ml1", ml1);
			session.setAttribute("ml2", ml2);
			session.setAttribute("ml3", ml3);
			session.setAttribute("ml4", ml4);
			session.setAttribute("ml5", ml5);
			System.out.println(ml1);
			System.out.println(ml2);
			System.out.println(ml3);
			System.out.println(ml4);
			System.out.println(ml5);
			return SUCCESS;
		}
		/**
		 *getter和setter方法
		 */
		public MessageService getMessageService() {
			return messageService;
		}

		public void setMessageService(MessageService messageService) {
			this.messageService = messageService;
		}

		public String getShopname() {
			return shopname;
		}

		public void setShopname(String shopname) {
			this.shopname = shopname;
		}

		public String getEditorValue() {
			return editorValue;
		}

		public void setEditorValue(String editorValue) {
			this.editorValue = editorValue;
		}

		public String getOne() {
			return one;
		}

		public void setOne(String one) {
			this.one = one;
		}

		public String getTwo() {
			return two;
		}

		public void setTwo(String two) {
			this.two = two;
		}

		public String getThree() {
			return three;
		}

		public void setThree(String three) {
			this.three = three;
		}

		public String getFour() {
			return four;
		}

		public void setFour(String four) {
			this.four = four;
		}

		public String getFive() {
			return five;
		}

		public void setFive(String five) {
			this.five = five;
		}

		public List<Message> getList() {
			return list;
		}

		public void setList(List<Message> list) {
			this.list = list;
		}
		
}
