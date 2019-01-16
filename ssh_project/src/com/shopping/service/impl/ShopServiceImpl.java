package com.shopping.service.impl;

import java.util.List;

import com.shopping.dao.ShopDao;
import com.shopping.model.Shop;
import com.shopping.service.ShopService;

public class ShopServiceImpl implements ShopService{
	private ShopDao shopDao;
	
	public ShopDao getShopDao() {
		return shopDao;
	}

	public void setShopDao(ShopDao shopDao) {
		this.shopDao = shopDao;
	}

	@Override
	public boolean save(Shop shop) {
		return shopDao.save(shop);
	}

	@Override
	public boolean deleteById(int sno) {
		return shopDao.deleteById(sno);
	}

	@Override
	public boolean update(Shop shop) {
		return shopDao.update(shop);
	}

	@Override
	public Shop get(int sno) {
		return shopDao.get(sno);
	}

	@Override
	public List<Shop> getAll() {
		return shopDao.getAll();
	}

	@Override
	public List<Shop> getAllBySfName(String sfname) {
		return shopDao.getAllBySfName(sfname);
	}

	@Override
	public List<Shop> getAllBySclass(String sclass) {
		return shopDao.getAllBySclass(sclass);
	}

	@Override
	public List<Shop> getAllBySize(int size) {
		return shopDao.getAllBySize(size);
	}

	@Override
	public List<Shop> getAllBySname(String sname) {
		return shopDao.getAllBySname(sname);
	}

	@Override
	public List<Shop> getAllByShopclass(String shopclass) {
		return shopDao.getAllByShopclass(shopclass);
	}

	@Override
	public List<Shop> getAllBySno(int sno) {
		return shopDao.getAllBySno(sno);
	}

}
