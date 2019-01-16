package com.shopping.action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.shopping.model.Buy;
import com.shopping.model.Shop;
import com.shopping.service.BuyService;
import com.shopping.service.impl.BuyServiceImpl;


public class BuyAction extends ActionSupport{
		private BuyService buyService;
		private List<Buy> list;
		private String key;
		private String value;
		private String bno;
		private int cno;
		private int sno;
		private int num;
		private int price;
		private int size;
		private String address;
		private String buystate;
		private String pay;
		private String out_trade_no;
		private String shopname;
		private Buy buy;
		/**
		 * 查看所有订单
		 * @return
		 * @throws Exception
		 */
		public String seeAll() throws Exception{
			this.setList(buyService.getAll());
			Collections.reverse(list);
			ActionContext act=ActionContext.getContext();
			act.getSession().put("list", list);
			return "seeall";
		}
		
		/**
		 * 查询订单
		 * @return
		 * @throws Exception
		 */
		public String searchbuy() throws Exception{
			if(key.equals("所有订单")){
				list=buyService.getAll();
				Collections.reverse(list);
			}
			if(key.equals("订单编号")){
				list=buyService.getAllByBno(value);
				Collections.reverse(list);
			}
			if(key.equals("用户编号")){
				list=buyService.getAllByCno(Integer.parseInt(value));
				Collections.reverse(list);
			}
			if(key.equals("商品编号")){
				list=buyService.getAllBySno(Integer.parseInt(value));
				Collections.reverse(list);
			}
			if(key.equals("购买状态")){
				list=buyService.getAllByBuystate(value);
				Collections.reverse(list);
			}
			if(key.equals("出货状态")){
				list=buyService.getAllByShipment(value);
				Collections.reverse(list);
			}
			ActionContext act=ActionContext.getContext();
			act.getSession().put("list", list);
			return SUCCESS;
		}
		
		/**
		 * main.jsp获取数据，用于展示和输出数据报表 
		 * @return
		 * @throws Exception
		 */
		public String outputbuy() throws Exception{
			list=buyService.getAll();
			ActionContext act=ActionContext.getContext();
			act.getSession().put("outbuy", list);
			return SUCCESS;
		}
		
		/**
		 * 删除一条订单信息
		 * @return
		 * @throws Exception
		 */
		public String deletebuy() throws Exception{
			boolean result=buyService.deleteById(bno);
			if(result)
				return SUCCESS;
			else
				return ERROR;
		}
		
		/**
		 * 查看一条订单信息
		 * @return
		 * @throws Exception
		 */
		public String getonebuy() throws Exception{
			buy=buyService.get(bno);
			if(pay.equals("yes")){
				ActionContext act=ActionContext.getContext();
				act.getSession().put("paybuy", buy);
				return "readypay";
			}
			return SUCCESS;
		}
		
		/**
		 * 点击支付，生成一条订单，然后到支付去
		 * @return
		 * @throws Exception
		 */
		public String paybuy() throws Exception{
			addbuy();
			buy=buyService.get(bno);
			ActionContext act=ActionContext.getContext();
			act.getSession().put("paybuy", buy);
			return "readypay";
		}
		
		/**
		 * 修改一条订单信息
		 * @return
		 * @throws Exception
		 */
		public String updatebuy() throws Exception{
			boolean result=buyService.update(buy);
			if(result)
				return SUCCESS;
			else
				return ERROR;
		}
		
		/**
		 * 支付完成，修改订单支付状态，然后跳去减少库存
		 * @return
		 * @throws Exception
		 */
		public String updatepaybuy() throws Exception{
			HttpServletRequest request=ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			buy=(Buy)session.getAttribute("paybuy");
			buy.setBuystate("已支付");
			buy.setBno(out_trade_no);
			buy.setDate(new Date());
			buyService.update(buy);
			return SUCCESS;
		}
	
		/**
		 * 查看购物车、历史记录
		 * @return
		 * @throws Exception
		 */
		public String seeshoppingcar() throws Exception{
			System.out.println(value);
			list=buyService.getAllByCno(cno);
			List<Buy> blist=new ArrayList<>();
			ActionContext act=ActionContext.getContext();
			if(value.equals("history")){
				for(Buy buy:list){
					if(buy.getBuystate().equals("已支付"))
						blist.add(buy);
				}	
				Collections.reverse(blist);
				act.getSession().put("value", value);
				act.getSession().put("blist",blist);
				return SUCCESS;
			}
			for(Buy buy:list){
				if(buy.getBuystate().equals("未支付"))
					blist.add(buy);
			}	
			Collections.reverse(blist);
			act.getSession().put("value", value);
			act.getSession().put("blist",blist);
			return SUCCESS;
		}
		
		/**
		 * 顾客删除一条订单，然后返回购物车页面
		 * @return
		 * @throws Exception
		 */
		public String deletecarbuy() throws Exception{
			Buy bb=buyService.get(bno);
			buyService.deleteById(bno);
			list=buyService.getAllByCno(bb.getCno());
			List<Buy> blist=new ArrayList<>();
			for(Buy buy:list){
				if(buy.getBuystate().equals("未支付"))
					blist.add(buy);
			}	
			ActionContext act=ActionContext.getContext();
			act.getSession().put("blist",blist);
			return SUCCESS;
		}
		
		/**
		 * 管理员点击删除商品后，删除该商品订单，然后跳去删除商品信息
		 * @return
		 * @throws Exception
		 */
		public String deletebuysno() throws Exception{
			HttpServletRequest request=ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			list=buyService.getAllBySno(sno);
			for(Buy b:list){
				buyService.deleteById(b.getBno());
			}
			session.setAttribute("so", sno);
			session.setAttribute("sn", shopname);
			return SUCCESS;
		}
		
		/**
		 * 顾客修改购物车订单收货地址,然后返回
		 * @return
		 * @throws Exception
		 */
		public String updatecarbuy() throws Exception{
			buy=buyService.get(bno);
			buy.setAddress(address);
			buyService.update(buy);
			list=buyService.getAllByCno(buy.getCno());
			List<Buy> blist=new ArrayList<>();
			for(Buy buy:list){
				if(buy.getBuystate().equals("未支付"))
					blist.add(buy);
			}	
			ActionContext act=ActionContext.getContext();
			act.getSession().put("blist",blist);
			return SUCCESS;
		}
		/**
		 * 添加购物车,先生成订单再获取该顾客所有订单信息
		 * @return
		 * @throws Exception
		 */
		public String addshoppingcar() throws Exception{
			addbuy();
			list=buyService.getAllByCno(cno);
			List<Buy> blist=new ArrayList<>();
			for(Buy buy:list){
				if(buy.getBuystate().equals("未支付"))
					blist.add(buy);
			}	
			Collections.reverse(blist);
			ActionContext act=ActionContext.getContext();
			act.getSession().put("blist",blist);
			act.getSession().put("value", "buycar");
			return SUCCESS;
		}
		/**
		 * 点击购物车后生成一条订单
		 */
		public void addbuy(){
			HttpServletRequest request=ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			List<Shop> shoplist=(List<Shop>)session.getAttribute("shoplist");
			for(Shop s:shoplist){
				if(s.getSize()==size)
					sno=s.getSno();
			}	
			Buy buy1=new Buy();
			Date date=new Date();
			long d=date.getTime();
			String name=String.valueOf(d);
			this.setBno(name);
			buy1.setBno(bno);
			buy1.setCno(cno);
			buy1.setSno(sno);
			buy1.setNum(num);
			buy1.setPrice(price*num);
			buy1.setAddress(address);
			buy1.setBuystate("未支付");
			buy1.setShipment("未出货");
			buy1.setCouriernumber("暂无");
			buy1.setDate(new Date());
			System.out.println(buy1);
			buyService.save(buy1);
		}
		/**
		 * getter和setter方法
		 */
		public BuyService getBuyService() {
			return buyService;
		}
		public void setBuyService(BuyService buyService) {
			this.buyService = buyService;
		}
		public List<Buy> getList() {
			return list;
		}
		public void setList(List<Buy> list) {
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

		public String getBno() {
			return bno;
		}

		public void setBno(String bno) {
			this.bno = bno;
		}

		public Buy getBuy() {
			return buy;
		}

		public void setBuy(Buy buy) {
			this.buy = buy;
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

		public String getBuystate() {
			return buystate;
		}

		public void setBuystate(String buystate) {
			this.buystate = buystate;
		}

		public int getSize() {
			return size;
		}

		public void setSize(int size) {
			this.size = size;
		}

		public String getPay() {
			return pay;
		}

		public void setPay(String pay) {
			this.pay = pay;
		}

		public String getOut_trade_no() {
			return out_trade_no;
		}

		public void setOut_trade_no(String out_trade_no) {
			this.out_trade_no = out_trade_no;
		}

		public String getShopname() {
			return shopname;
		}

		public void setShopname(String shopname) {
			this.shopname = shopname;
		}
		
		
}
