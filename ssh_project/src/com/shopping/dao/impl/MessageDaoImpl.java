package com.shopping.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.shopping.dao.MessageDao;
import com.shopping.model.Message;


public class MessageDaoImpl implements MessageDao{
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
 
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

		
	@Override
	public boolean save(Message message) {
		Session session=sessionFactory.getCurrentSession();
		boolean result=false;
		try {
			session.save(message);
			result=true;
		} catch (Exception e) {
			 e.printStackTrace();
		} 
			return result;
	}

	@Override
	public boolean deleteById(String shopname) {
		Message message=get(shopname);
		Session session=sessionFactory.getCurrentSession();
		boolean result=false;
		try {
			session.delete(message);
			result=true;
		} catch (Exception e) {
			 e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean update(Message message) {
		Session session=sessionFactory.getCurrentSession();
		boolean result=false;
		try {
			session.saveOrUpdate(message);
			result=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Message get(String shopname) {
		Session session=sessionFactory.openSession();
		String hql="from Message as m where m.shopname= :shopname";
		Message message=(Message)session.createQuery(hql).setParameter("shopname", shopname).uniqueResult();
		return message;
	}

	@Override
	public List<Message> getallByshopname(String shopname) {
		Session session=sessionFactory.openSession();
		String hql="from Message as m where m.shopname= :shopname";
		List<Message> list=(List<Message>)session.createQuery(hql).setParameter("shopname", shopname).list();
		return list;
	}
}
