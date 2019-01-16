package com.shopping.dao;

import java.util.List;

import com.shopping.model.Shop;

public interface ShopDao {

	/**
	 * 实现插入一条商品信息数据
	 * @param shop
	 * @return boolean
	 */
	public boolean save(Shop shop);
	
	/**
	 * 根据商品 sno删除商品信息
	 * @param sno
	 * @return boolean
	 */
	public boolean deleteById(int sno);
	
	/**
	 * 修改商品信息
	 * @param 
	 * @return boolean
	 */
	public boolean update(Shop shop);
	
	/**
	 * 根据商品id(sno)获取一条商品信息，封装成类Shop的一个对象
	 * @param sno
	 * @return
	 */
	public Shop get(int sno);
	
	/**
	 * 获取所有商品数据
	 * @return
	 */
	public List<Shop> getAll();
	
	/**
	 * 根据品牌名，获取所有商品数据
	 * @return
	 */
	public List<Shop> getAllBySfName(String sfname);
	/**
	 * 根据用户类型 男或女，获取所有商品数据
	 * @return list
	 */
	public List<Shop> getAllBySclass(String sclass);
	/**
	 * 根据尺码，获取所有商品数据
	 * @return list
	 */
	public List<Shop> getAllBySize(int size);
	
	/**
	 * 根据商品名，获取所有商品数据
	 * @return list
	 */
	public List<Shop> getAllBySname(String sname);
	
	/**
	 * 根据shopclass（商品种类），获取所有商品数据
	 * @return list
	 */
	public List<Shop> getAllByShopclass(String shopclass);
	
	/**
	 * 根据商品编号sno，获取所有商品数据
	 * @return list
	 */
	public List<Shop> getAllBySno(int sno);
}
