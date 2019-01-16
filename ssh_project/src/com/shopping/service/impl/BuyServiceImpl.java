package com.shopping.service.impl;

import java.util.List;

import com.shopping.dao.BuyDao;
import com.shopping.model.Buy;
import com.shopping.service.BuyService;

public class BuyServiceImpl implements BuyService{
	private BuyDao buyDao;

	public BuyDao getBuyDao() {
		return buyDao;
	}

	public void setBuyDao(BuyDao buyDao) {
		this.buyDao = buyDao;
	}

	@Override
	public boolean save(Buy buy) {
		return buyDao.save(buy);
	}

	@Override
	public boolean deleteById(String bno) {
		return buyDao.deleteById(bno);
	}

	@Override
	public boolean update(Buy buy) {
		return buyDao.update(buy);
	}

	@Override
	public Buy get(String bno) {
		return buyDao.get(bno);
	}

	@Override
	public List<Buy> getAll() {
		return buyDao.getAll();
	}

	@Override
	public List<Buy> getAllByCno(int cno) {
		return buyDao.getAllByCno(cno);
	}

	@Override
	public List<Buy> getAllBySno(int sno) {
		return buyDao.getAllBySno(sno);
	}

	@Override
	public List<Buy> getAllByBuystate(String buystate) {
		return buyDao.getAllByBuystate(buystate);
	}

	@Override
	public List<Buy> getAllByBno(String bno) {
		return buyDao.getAllByBno(bno);
	}

	@Override
	public List<Buy> getAllByShipment(String shipment) {
		return buyDao.getAllByShipment(shipment);
	}
		
}
