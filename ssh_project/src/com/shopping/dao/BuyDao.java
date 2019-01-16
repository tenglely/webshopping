package com.shopping.dao;

import java.util.List;

import com.shopping.model.Buy;

public interface BuyDao {
	/**
	 * 实现插入一条新订单信息数据
	 * @param buy
	 * @return boolean
	 */
	public boolean save(Buy buy);
	
	/**
	 * 根据订单 bno删除订单信息
	 * @param bno
	 * @return boolean
	 */
	public boolean deleteById(String bno);
	
	/**
	 * 修改订单信息
	 * @param 
	 * @return boolean
	 */
	public boolean update(Buy buy);
	
	/**
	 * 根据订单id(bno)获取一条订单信息，封装成类Buy的一个对象
	 * @param bno
	 * @return
	 */
	public Buy get(String bno);
	
	/**
	 * 获取所有订单数据
	 * @return
	 */
	public List<Buy> getAll();
	/**
	 * 根据cno,获取所有订单数据
	 * @return
	 */
	public List<Buy> getAllByCno(int cno);
	/**
	 * 根据sno,获取所有订单数据
	 * @return
	 */
	public List<Buy> getAllBySno(int sno);
	
	/**
	 * 根据buystate(购买状态),获取所有订单数据
	 * @return
	 */
	public List<Buy> getAllByBuystate(String buystate);
	
	/**
	 * 根据shipment(出货状态),获取所有订单数据
	 * @return
	 */
	public List<Buy> getAllByShipment(String shipment);
	
	/**
	 * 根据bno(订单编号),获取所有订单数据
	 * @return
	 */
	public List<Buy> getAllByBno(String bno);
}
