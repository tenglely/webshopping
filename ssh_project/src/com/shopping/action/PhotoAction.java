package com.shopping.action;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.shopping.model.Photo;
import com.shopping.model.Shop;
import com.shopping.service.PhotoService;

public class PhotoAction extends ActionSupport{
		private PhotoService photoService;
		//定义为数组类型的属性
		private File[] upload;
		private String[] uploadFileName;
		private String shopname;//商品名
		private String pname;//图片名
		private List<Photo> list;
		private String imagepath="D:\\新建文件夹\\ssh_project\\WebContent\\image";
		/**
		 * 上传一件商品的一张或多张图片	
		 */
		public String execute() throws Exception {
				if(shopname.equals("首页")){
					list=photoService.getAllByName(shopname);
					for(Photo photo:list){
						photoService.deleteById(photo.getPno());
						File file=new File(imagepath+photo.getPname());
						boolean a=file.delete();
					}
				}
				String path=ServletActionContext.getServletContext().getRealPath("/upload");
				if(upload!=null){
					File saveDir=new File(path);
					if(!saveDir.exists()){
						saveDir.mkdirs();
					}
					for(int i=0;i<uploadFileName.length;i++){
						try {
							Date date=new Date();
							Photo photo=new Photo();
							long d=date.getTime();
							String name=String.valueOf(d);
							//文件类型
							String hString=uploadFileName[i].substring(uploadFileName[i].indexOf("."));
							photo.setShopname(shopname);
							photo.setPname(name+hString);
							photoService.save(photo);	
							System.out.println(path+" "+photo);
							File saveFile=new File(imagepath,name+hString);
							FileUtils.copyFile(upload[i],saveFile);
						} catch (Exception e) {
							e.printStackTrace();
						}
					}

				}
					if(shopname.equals("首页"))
						return "setindex";
					else
						return SUCCESS;
				}
		/**
		 * 查询一条图片信息
		 * @return
		 * @throws Exception
		 */
		public String seeOnePhoto() throws Exception{

			HttpServletRequest request=ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			String sn=(String)session.getAttribute("shopname");
			list=photoService.getAllByName(sn);
			System.out.println(list);
			session.setAttribute("photolist", list);
			return "success";
		}
		
		/**
		 * 删除一条图片，并跳去删除图文
		 * @return
		 * @throws Exception
		 */
		public String deletephoto() throws Exception{
			HttpServletRequest request=ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			String sn=(String)session.getAttribute("shopname");
			list=photoService.getAllByName(sn);
			for(Photo photo:list){
				File file=new File(imagepath+photo.getPname());
				boolean a=file.delete();
				System.out.println(a+" "+request.getContextPath()+"/image/"+photo.getPname());
				photoService.deleteById(photo.getPno());
			}
			return "next";
		}
		
		/**
		 * 获取商城首页的图片信息和登陆信息
		 * @return
		 * @throws Exception
		 */
		public String seeshopping() throws Exception{
			list=photoService.getAll();
			HttpServletRequest request=ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			List<Photo> plist=new ArrayList<>();
			List<Shop> slist=(List<Shop>)session.getAttribute("slist");
			for(Shop shop:slist){
				if(photoService.getAllByName(shop.getShopname()).size()!=0){
				Photo photo =photoService.getAllByName(shop.getShopname()).get(0);
				plist.add(photo);
				}
			}
			System.out.println(plist);
			session.setAttribute("list", list);
			session.setAttribute("plist", plist);
			return SUCCESS;
		}
		
		/**
		 * 替换图片，先将该商品所有图片信息删除，然后重新添加
		 * @return
		 * @throws Exception
		 */
		public String updatephoto() throws Exception{
			list=photoService.getAllByName(shopname);
			for(Photo photo:list){
				photoService.deleteById(photo.getPno());
				File file=new File(imagepath+photo.getPname());
				boolean a=file.delete();
			}
			String path=ServletActionContext.getServletContext().getRealPath("/upload");
			if(upload!=null){
				File saveDir=new File(path);
				if(!saveDir.exists()){
					saveDir.mkdirs();
				}
				for(int i=0;i<uploadFileName.length;i++){
					try {
						Date date=new Date();
						Photo photo=new Photo();
						long d=date.getTime();
						String name=String.valueOf(d);
						//文件类型
						String hString=uploadFileName[i].substring(uploadFileName[i].indexOf("."));
						photo.setShopname(shopname);
						photo.setPname(name+hString);
						photoService.save(photo);	
						System.out.println(path+" "+photo);
						File saveFile=new File(imagepath,name+hString);
						FileUtils.copyFile(upload[i],saveFile);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}

			}
					return SUCCESS;
		}
		
		/**
		 * 首页点击列表栏的品牌后先获取商品数据，再是图片信息
		 * @return
		 * @throws Exception
		 */
		public String findlistbysfname_photo() throws Exception{
			HttpServletRequest request=ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			List<Shop> slist=(List<Shop>)session.getAttribute("sflist");
			List<Photo> plist=new ArrayList<>();
			for(Shop shop:slist){
				list=photoService.getAllByName(shop.getShopname());
				if(list.size()!=0){
				    Photo photo=list.get(0);
				    plist.add(photo);
				}
			}
			session.setAttribute("plist", plist);
			return SUCCESS;
		}
		
		/**
		 * 获取购物车商品图片
		 * @return
		 * @throws Exception
		 */
		public String getbuyphoto() throws Exception{
			HttpServletRequest request=ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			List<Shop> shopl=(List<Shop>)session.getAttribute("shopl");
			List<Photo> carphoto=new ArrayList<>();
			for(Shop shop:shopl){
				System.out.println("kan "+photoService.getAllByName(shop.getShopname()).size());
				if(photoService.getAllByName(shop.getShopname()).size()>0){
					Photo pb=photoService.getAllByName(shop.getShopname()).get(0);
					carphoto.add(pb);
				}
			}
			session.setAttribute("carphoto",carphoto);
			String value=(String)session.getAttribute("value");
			System.out.println(value);
			if(value.equals("history"))
				return "history";
			else
			    return "buycar";	
		}
		
		/**
		 * 修改一种商品的photo的shopname
		 * @return
		 * @throws Exception
		 */
		public String updatephotoshopname() throws Exception{
			HttpServletRequest request=ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			String oldsn=(String) session.getAttribute("oldsn");
			String newsn=(String) session.getAttribute("newsn");
			list=photoService.getAllByName(oldsn);
			for(Photo photo:list){
				photo.setShopname(newsn);
				photoService.update(photo);
			}
			return SUCCESS;	
		}
		
		/**
		 * getter和setter方法
		 */
		
		public PhotoService getPhotoService() {
			return photoService;
		}

		public void setPhotoService(PhotoService photoService) {
			this.photoService = photoService;
		}
		
		public File[] getUpload() {
			return upload;
		}
		public void setUpload(File[] upload) {
			this.upload = upload;
		}
		public String[] getUploadFileName() {
			return uploadFileName;
		}
		public void setUploadFileName(String[] uploadFileName) {
			this.uploadFileName = uploadFileName;
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

		public List<Photo> getList() {
			return list;
		}

		public void setList(List<Photo> list) {
			this.list = list;
		}
		
}
