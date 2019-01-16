package com.shopping.dao;

import java.util.List;

import com.shopping.model.Client;
import com.shopping.model.Photo;

public interface PhotoDao {
	/**
	 * 实现上传一条新图片信息数据
	 * @param client
	 * @return boolean
	 */
	public boolean save(Photo photo);
	
	/**
	 * 根据用户 pno删除用户信息
	 * @param cnos
	 * @return boolean
	 */
	public boolean deleteById(int pno);
	
	/**
	 * 修改用户信息
	 * @param 
	 * @return boolean
	 */
	public boolean update(Photo photo);
	
	/**
	 * 根据pno获取一条图片信息，封装成类Photo的一个对象
	 * @param cno
	 * @return
	 */
	public Photo get(int pno);
	
	/**
	 * 获取所有图片数据
	 * @return
	 */
	public List<Photo> getAll();
	
	/**
	 * 根据shopname,获取所有图片数据
	 * @return
	 */
	public List<Photo> getAllByName(String shopname);
}
