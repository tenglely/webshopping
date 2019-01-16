package com.shopping.dao;

import java.util.List;

import com.shopping.model.Message;

public interface MessageDao {
	/**
	 * 实现插入一条新用户信息数据
	 * @param client
	 * @return boolean
	 */
	public boolean save(Message message);
	
	/**
	 * 根据商品名删除图文信息
	 * @param shopname
	 * @return boolean
	 */
	public boolean deleteById(String shopname);
	
	/**
	 * 修改用户信息
	 * @param 
	 * @return boolean
	 */
	public boolean update(Message message);
	
	/**
	 * 根据shopname获取图文信息，封装成类Message的一个对象
	 * @param shopname
	 * @return
	 */
	public Message get(String shopname);
	
	/**
	 * 根据shopname获取所有图文信息
	 * @param shopname
	 * @return
	 */
	public List<Message> getallByshopname(String shopname);
}
