package com.shopping.action;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.shopping.model.Buy;
import com.shopping.model.Shop;
import com.shopping.service.ShopService;

import net.bytebuddy.asm.Advice.This;

public class ShopAction extends ActionSupport{
		private ShopService shopService;
		private List<Shop> list;
		private String sfname;
		private String shopname;
		private String shopclass;
		private String sclass;
		private int price;
		private int count;
		private String[] size;
		private String six;//36
		private String seven;//37
		private String eight;//38
		private String night;//39
		private String zero;//40
		private String one;//41
		private String two;//42
		private String remark;
		private String key;
		private String value;
		private String oldsn;
		private int sno;
		private Shop shop;
		/**
		 * 添加一条商品信息
		 * @return
		 * @throws Exception
		 */
		public String addShop() throws Exception{
			int count=0;
			for(int i=0;i<size.length;i++){
				int s=Integer.parseInt(size[i]);
				if(size[i].equals("36"))
					count=Integer.parseInt(six);
				if(size[i].equals("37"))
					count=Integer.parseInt(seven);
				if(size[i].equals("38"))
					count=Integer.parseInt(eight);
				if(size[i].equals("39"))
					count=Integer.parseInt(night);
				if(size[i].equals("40"))
					count=Integer.parseInt(zero);
				if(size[i].equals("41"))
					count=Integer.parseInt(one);
				if(size[i].equals("42"))
					count=Integer.parseInt(two);
				Shop shop=new Shop();
				shop.setSfname(sfname);
				shop.setShopname(shopname);
				shop.setShopclass(shopclass);
				shop.setSclass(sclass);
				shop.setPrice(price);
				shop.setSize(s);
				shop.setCount(count);
				shop.setRemark(remark);
				System.out.println(shop);
				shopService.save(shop);
				count=0;
			}
			return "addshop";
		}
		
		public String seeOne() throws Exception{
			HttpServletRequest request=ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			session.setAttribute("shopname",shopname); 
			String sn=shopname;
			System.out.println("测试"+sn);
			this.setList(shopService.getAllBySname(sn));
			Collections.reverse(this.getList());
			session.setAttribute("shoplist",this.getList());
			return "success";
		}
		
		/**
		 * 查看所有商品信息
		 * @return
		 * @throws Exception
		 */
		public String seeallshop() throws Exception{
			list=shopService.getAll();
			Collections.reverse(list);
			this.setList(list);
			ActionContext act=ActionContext.getContext();
			act.getSession().put("list", list);
			return SUCCESS;
		}
		
		
		/**
		 * 查询商品
		 * @return
		 * @throws Exception
		 */
		public String searchshop() throws Exception{
			if(key.equals("品牌名")){
				list=shopService.getAllBySfName(value);
				Collections.reverse(list);
			}
			if(key.equals("用户类型")){
				list=shopService.getAllBySclass(value);
				Collections.reverse(list);
			}
			if(key.equals("尺码")){
				list=shopService.getAllBySize(Integer.parseInt(value));
				Collections.reverse(list);
			}
			if(key.equals("尺码")){
				list=shopService.getAllBySize(Integer.parseInt(value));
				Collections.reverse(list);
			}
			if(key.equals("商品名")){
				list=shopService.getAllBySname(value);
				Collections.reverse(list);
			}
			if(key.equals("所有商品")){
				list=shopService.getAll();
				Collections.reverse(list);
			}
			if(key.equals("商品种类")){
				list=shopService.getAllByShopclass(value);
				Collections.reverse(list);
			}
			if(key.equals("商品编号")){
				list=shopService.getAllBySno(Integer.parseInt(value));
				Collections.reverse(list);
			}
			ActionContext act=ActionContext.getContext();
			act.getSession().put("list", list);
			return SUCCESS;
		}
		
		/**
		 * 删除一件商品 ，如果该商品所有尺码都删了，删除图片和图文
		 * @return
		 * @throws Exception
		 */
		public String deleteshop() throws Exception{
			HttpServletRequest request=ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			//System.out.println(session.getAttribute("so"));
			//String so=(String) session.getAttribute("so");
		    sno=(Integer)session.getAttribute("so");
		    shopname=(String)session.getAttribute("sn");
			boolean result=shopService.deleteById(sno);
			list=shopService.getAllBySname(shopname);
			Collections.reverse(list);
			if(list!=null&&!list.isEmpty()){
				return SUCCESS;
			}else{
				session.setAttribute("shopname",shopname); 
				return "next";
			}
		}
		
		/**
		 * 查找一条商品信息
		 * @return
		 * @throws Exception
		 */
		public String getoneshop() throws Exception{
			shop=shopService.get(sno);
			return SUCCESS;
		}
		
		/**
		 * 查找一条商品信息到支付
		 * @return
		 * @throws Exception
		 */
		public String seepayshop() throws Exception{
			HttpServletRequest request=ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			Buy b=(Buy) session.getAttribute("paybuy");
			shop=shopService.get(b.getSno());
			return SUCCESS;
		}
		
		/**
		 * 修改一种商品信息，除尺码和库存
		 * @return
		 * @throws Exception
		 */
		public String updateshop() throws Exception{
			list=shopService.getAllBySname(shopname);
			boolean result=false;
			if(list.size()==1){
				result=shopService.update(shop);
			}else {
				for(Shop sh:list){
					Shop ss=sh;
					ss.setSfname(shop.getSfname());
					ss.setShopname(shop.getShopname());
					ss.setShopclass(shop.getShopclass());
					ss.setSclass(shop.getSclass());
					ss.setPrice(shop.getPrice());
					result=shopService.update(ss);
				}
			}
			ActionContext act=ActionContext.getContext();
			act.getSession().put("oldsn", shopname);
			act.getSession().put("newsn", shop.getShopname());
			if(result)
				return SUCCESS;
			else
				return ERROR;
		}
		
		/**
		 * 管理员修改商品库存
		 * @return
		 * @throws Exception
		 */
		public String updateshopcount() throws Exception{
			shop=shopService.get(sno);
			shop.setCount(count);
			shopService.update(shop);
			return SUCCESS;
		}
		
		/**
		 * 支付完后，减少相应库存
		 * @return
		 * @throws Exception
		 */
		public String updatecount() throws Exception{
			HttpServletRequest request=ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			Buy buy=(Buy)session.getAttribute("paybuy");
			shop=shopService.get(buy.getSno());
			shop.setCount(shop.getCount()-buy.getNum());
			shopService.update(shop);
			return SUCCESS;
		}
		/**
		 * 获取商品信息，用来比较列表栏中的商品是否存在
		 * @return
		 * @throws Exception
		 */
		public String getshopmessage() throws Exception{
			list=shopService.getAll();
			Collections.reverse(list);
			ActionContext act=ActionContext.getContext();
			act.getSession().put("getshopmessage", list);
			return SUCCESS;
		}
		
		/**
		 * 点击进入首页后先获取商品信息
		 * @return
		 * @throws Exception
		 */
		public String findindexshop() throws Exception{
			list=shopService.getAll();
			//Collections.reverse(list);
			String s="findindex";
			List<Shop> sList=new ArrayList<>();
			for(Shop shop:list){
				if(s.indexOf(shop.getShopname())<0){
					sList.add(shop);
					s+=shop.getShopname();
				}
			}
			ActionContext act=ActionContext.getContext();
			act.getSession().put("slist", sList);
			return SUCCESS;
		}
		/**
		 * 首页点击列表栏的品牌后获取商品数据
		 * @return
		 * @throws Exception
		 */
		public String findlistbysfname() throws Exception{
			list=shopService.getAllBySfName(sfname);
			Collections.reverse(list);
			List<Shop> sfList=new ArrayList<>();
			String s="findsfname";
			for(Shop shop:list){
				if(s.indexOf(shop.getShopname())<0){
					sfList.add(shop);
					s+=shop.getShopname();
				}
			}
			ActionContext act=ActionContext.getContext();
			act.getSession().put("sflist", sfList);
			return SUCCESS;
		}
		
		/**
		 * 首页点击列表栏的商品种类后获取商品数据
		 * @return
		 * @throws Exception
		 */
		public String findlistbyshopclass() throws Exception{
			list=shopService.getAllByShopclass(shopclass);
			Collections.reverse(list);
			List<Shop> sfList=new ArrayList<>();
			String s="findshopclass";
			for(Shop shop:list){
				if(s.indexOf(shop.getShopname())<0){
					sfList.add(shop);
					s+=shop.getShopname();
				}
			}
			ActionContext act=ActionContext.getContext();
			act.getSession().put("sflist", sfList);
			return SUCCESS;
		}
		
		/**
		 * 获取购物车的商品信息
		 * @return
		 * @throws Exception
		 */
		public String getbuyshop() throws Exception{
			HttpServletRequest request=ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			List<Buy> blist=(List<Buy>)session.getAttribute("blist");
			List<Shop> shopl=new ArrayList<>();
			for(Buy buy:blist){
				Shop s=shopService.get(buy.getSno());
				shopl.add(s);
			}
			session.setAttribute("shopl", shopl);
			return SUCCESS;
		}
		
		/**
		 * main.jsp获取数据，用于展示和输出数据报表 
		 * @return
		 * @throws Exception
		 */
		public String outputshop() throws Exception{
			list=shopService.getAll();
			ActionContext act=ActionContext.getContext();
			act.getSession().put("outshop", list);
			return SUCCESS;
		}
		/**
		 * getter和setter方法
		 */
		public ShopService getShopService() {
			return shopService;
		}

		public void setShopService(ShopService shopService) {
			this.shopService = shopService;
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

		public String getSclass() {
			return sclass;
		}

		public void setSclass(String sclass) {
			this.sclass = sclass;
		}

		public int getPrice() {
			return price;
		}

		public void setPrice(int price) {
			this.price = price;
		}

		public String[] getSize() {
			return size;
		}

		public void setSize(String[] size) {
			this.size = size;
		}

		public String getSix() {
			return six;
		}

		public void setSix(String six) {
			this.six = six;
		}

		public String getSeven() {
			return seven;
		}

		public void setSeven(String seven) {
			this.seven = seven;
		}

		public String getEight() {
			return eight;
		}

		public void setEight(String eight) {
			this.eight = eight;
		}

		public String getNight() {
			return night;
		}

		public void setNight(String night) {
			this.night = night;
		}

		public String getZero() {
			return zero;
		}

		public void setZero(String zero) {
			this.zero = zero;
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


		public String getRemark() {
			return remark;
		}


		public void setRemark(String remark) {
			this.remark = remark;
		}

		public List<Shop> getList() {
			return list;
		}

		public void setList(List<Shop> list) {
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

		public int getSno() {
			return sno;
		}

		public void setSno(int sno) {
			this.sno = sno;
		}

		public Shop getShop() {
			return shop;
		}

		public void setShop(Shop shop) {
			this.shop = shop;
		}

		public String getShopclass() {
			return shopclass;
		}

		public void setShopclass(String shopclass) {
			this.shopclass = shopclass;
		}

		public int getCount() {
			return count;
		}

		public void setCount(int count) {
			this.count = count;
		}

		public String getOldsn() {
			return oldsn;
		}

		public void setOldsn(String oldsn) {
			this.oldsn = oldsn;
		}
		
}
