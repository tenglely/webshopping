package com.shopping.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.shopping.dao.ShopDao;
import com.shopping.model.Shop;

public class ShopDaoImpl implements ShopDao{
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
 
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public boolean save(Shop shop) {
		Session session=sessionFactory.getCurrentSession();
		boolean result=false;
		try {
			session.save(shop);
			result=true;
		} catch (Exception e) {
			 e.printStackTrace();
		} 
			return result;
	}

	@Override
	public boolean deleteById(int sno) {
		Shop shop=get(sno);
		Session session=sessionFactory.getCurrentSession();
		boolean result=false;
		try {
			session.delete(shop);
			result=true;
		} catch (Exception e) {
			 e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean update(Shop shop) {
		Session session=sessionFactory.getCurrentSession();
		boolean result=false;
		try {
			session.saveOrUpdate(shop);
			result=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Shop get(int sno) {
		Session session=sessionFactory.openSession();
		Shop shop=session.get(Shop.class, sno);
		return shop;
	}

	@Override
	public List<Shop> getAll() {
		Session session=sessionFactory.openSession();
		List<Shop> list=(List<Shop>)session.createQuery("from Shop").list();
		return list;
	}

	@Override
	public List<Shop> getAllBySfName(String sfname) {
		Session session=sessionFactory.openSession();
		String hql="from Shop as s where s.sfname like :sfname";
		List<Shop> list=(List<Shop>)session.createQuery(hql).setParameter("sfname", "%"+sfname+"%").list();
		return list;
	}

	@Override
	public List<Shop> getAllBySclass(String sclass) {
		Session session=sessionFactory.openSession();
		String hql="from Shop as s where s.sclass = :sclass";
		List<Shop> list=(List<Shop>)session.createQuery(hql).setParameter("sclass", sclass).list();
		return list;
	}

	@Override
	public List<Shop> getAllBySize(int size) {
		Session session=sessionFactory.openSession();
		String hql="from Shop as s where s.size = :size";
		List<Shop> list=(List<Shop>)session.createQuery(hql).setParameter("size", size).list();
		return list;
	}

	@Override
	public List<Shop> getAllBySname(String shopname) {
		Session session=sessionFactory.openSession();
		String hql="from Shop as s where s.shopname like :shopname";
		List<Shop> list=(List<Shop>)session.createQuery(hql).setParameter("shopname", "%"+shopname+"%").list();
		return list;
	}

	@Override
	public List<Shop> getAllByShopclass(String shopclass) {
		Session session=sessionFactory.openSession();
		String hql="from Shop as s where s.shopclass = :shopclass";
		List<Shop> list=(List<Shop>)session.createQuery(hql).setParameter("shopclass",shopclass).list();
		return list;
	}

	@Override
	public List<Shop> getAllBySno(int sno) {
		Session session=sessionFactory.openSession();
		String hql="from Shop as s where s.sno = :sno";
		List<Shop> list=(List<Shop>)session.createQuery(hql).setParameter("sno", sno).list();
		return list;
	}

	
	
}
