package com.shopping.service;

import java.util.List;

import com.shopping.model.Client;

public interface ClientService {
	
	/**
	 * 实现插入一条新用户信息数据
	 * @param client
	 * @return boolean
	 */
	public boolean save(Client client);
	
	/**
	 * 根据用户 cno删除用户信息
	 * @param cnos
	 * @return boolean
	 */
	public boolean deleteById(int cno);
	
	/**
	 * 修改用户信息
	 * @param 
	 * @return boolean
	 */
	public boolean update(Client client);
	
	/**
	 * 根据用户id(cno)获取一条用户信息，封装成类Client的一个对象
	 * @param cno
	 * @return
	 */
	public Client get(int cno);
	
	/**
	 * 获取所有用户数据
	 * @return
	 */
	public List<Client> getAll();
	
	/**
	 * 根据csex,获取所有用户数据
	 * @return
	 */
	public List<Client> getAllBySex(String csex);
	
	/**
	 * 根据cname,获取所有用户数据,模糊查询
	 * @return list
	 */
	public List<Client> getAllByName(String cname);
	
	/**
	 * 根据cno,获取所有用户数据,模糊查询
	 * @return list
	 */
	public List<Client> getAllByCno(int cno);
	
	/**
	 * 根据cname,cpassword判断是否登录
	 * @param cname
	 * @param password
	 * @return client
	 */
	public Client login(String cname,String password);

}
