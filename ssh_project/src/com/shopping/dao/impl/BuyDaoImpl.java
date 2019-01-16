package com.shopping.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.shopping.dao.BuyDao;
import com.shopping.model.Buy;

public class BuyDaoImpl implements BuyDao{
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
 
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public boolean save(Buy buy) {
		Session session=sessionFactory.getCurrentSession();
		boolean result=false;
		try {
			session.save(buy);
			result=true;
		} catch (Exception e) {
			 e.printStackTrace();
		} 
			return result;
	}

	@Override
	public boolean deleteById(String bno) {
		Buy buy=get(bno);
		Session session=sessionFactory.getCurrentSession();
		boolean result=false;
		try {
			session.delete(buy);
			result=true;
		} catch (Exception e) {
			 e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean update(Buy buy) {
		Session session=sessionFactory.getCurrentSession();
		boolean result=false;
		try {
			session.saveOrUpdate(buy);
			result=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Buy get(String bno) {
		Session session=sessionFactory.openSession();
		String hql="from Buy as b where b.bno = :bno";
		Buy buy=(Buy)session.createQuery(hql).setParameter("bno", bno).uniqueResult();
		return buy;
	}

	@Override
	public List<Buy> getAll() {
		Session session=sessionFactory.openSession();
		List<Buy> list=(List<Buy>)session.createQuery("from Buy").list();
		return list;
	}

	@Override
	public List<Buy> getAllByCno(int cno) {
		Session session=sessionFactory.openSession();
		String hql="from Buy as b where b.cno = :cno";
		List<Buy> list=(List<Buy>)session.createQuery(hql).setParameter("cno",cno).list();
		return list;
	}

	@Override
	public List<Buy> getAllBySno(int sno) {
		Session session=sessionFactory.openSession();
		String hql="from Buy as b where b.sno = :sno";
		List<Buy> list=(List<Buy>)session.createQuery(hql).setParameter("sno",sno).list();
		return list;
	}

	@Override
	public List<Buy> getAllByBuystate(String buystate) {
		Session session=sessionFactory.openSession();
		String hql="from Buy as b where b.buystate = :buystate";
		List<Buy> list=(List<Buy>)session.createQuery(hql).setParameter("buystate",buystate).list();
		return list;
	}

	@Override
	public List<Buy> getAllByBno(String bno) {
		Session session=sessionFactory.openSession();
		String hql="from Buy as b where b.bno = :bno";
		List<Buy> list=(List<Buy>)session.createQuery(hql).setParameter("bno",bno).list();
		return list;
	}

	@Override
	public List<Buy> getAllByShipment(String shipment) {
		Session session=sessionFactory.openSession();
		String hql="from Buy as b where b.shipment = :shipment";
		List<Buy> list=(List<Buy>)session.createQuery(hql).setParameter("shipment",shipment).list();
		return list;
	}

}
