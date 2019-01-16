package com.shopping.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.shopping.dao.PhotoDao;
import com.shopping.model.Photo;

public class PhotoDaoImpl implements PhotoDao{
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
 
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public boolean save(Photo photo) {
		Session session=sessionFactory.getCurrentSession();
		boolean result=false;
		try {
			session.saveOrUpdate(photo);
			result=true;
		} catch (Exception e) {
			 e.printStackTrace();
		} 
			return result;
	}

	@Override
	public boolean deleteById(int pno) {
		Photo photo=get(pno);
		Session session=sessionFactory.getCurrentSession();
		boolean result=false;
		try {
			session.delete(photo);
			result=true;
		} catch (Exception e) {
			 e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean update(Photo photo) {
		Session session=sessionFactory.getCurrentSession();
		boolean result=false;
		try {
			session.saveOrUpdate(photo);
			result=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Photo get(int pno) {
		Session session=sessionFactory.openSession();
		Photo photo =session.get(Photo.class, pno);
		return photo;
	}

	@Override
	public List<Photo> getAll() {
		Session session=sessionFactory.openSession();
		List<Photo> list=(List<Photo>)session.createQuery("from Photo").list();
		return list;
	}

	@Override
	public List<Photo> getAllByName(String shopname) {
		Session session=sessionFactory.openSession();
		String hql="from Photo as p where p.shopname = :shopname";
		List<Photo> list=(List<Photo>)session.createQuery(hql).setParameter("shopname", shopname).list();
		return list;
	}
}
