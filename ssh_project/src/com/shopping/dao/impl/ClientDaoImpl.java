package com.shopping.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.shopping.dao.ClientDao;
import com.shopping.model.Client;

public class ClientDaoImpl implements ClientDao{
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public boolean save(Client client) {
		Session session=sessionFactory.getCurrentSession();
		boolean result=false;
		try {
			session.save(client);
			result=true;
		} catch (Exception e) {
			 e.printStackTrace();
		} 
			return result;
	}

	@Override
	public boolean deleteById(int cno) {
		Client client=get(cno);
		Session session=sessionFactory.getCurrentSession();
		boolean result=false;
		try {
			session.delete(client);
			result=true;
		} catch (Exception e) {
			 e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean update(Client client) {
		Session session=sessionFactory.getCurrentSession();
		boolean result=false;
		try {
			session.saveOrUpdate(client);
			result=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Client get(int cno) {
		Session session=sessionFactory.openSession();
		Client client=session.get(Client.class, cno);
		return client;
	}

	@Override
	public List<Client> getAll() {
		Session session=sessionFactory.openSession();
		List<Client> list=(List<Client>)session.createQuery("from Client").list();
		return list;
	}

	@Override
	public List<Client> getAllBySex(String csex) {
		Session session=sessionFactory.openSession();
		String hql="from Client as c where c.csex = :csex";
		List<Client> list=(List<Client>)session.createQuery(hql).setParameter("csex", csex).list();
		return list;
	}

	@Override
	public List<Client> getAllByName(String cname) {
		Session session=sessionFactory.openSession();
		String hql="from Client as c where c.cname like :cname";
		List<Client> list=(List<Client>)session.createQuery(hql).setParameter("cname", "%"+cname+"%").list();
		return list;
	}

	@Override
	public Client login(String cname, String cpassword) {
		Session session=sessionFactory.openSession();
		String hql="from Client as c where c.cname = :cname and c.cpassword = :cpassword";
		Client client=(Client)session.createQuery(hql)
				.setParameter("cname", cname)
				.setParameter("cpassword", cpassword)
				.uniqueResult();
		return client;
	}

	@Override
	public List<Client> getAllByCno(int cno) {
		Session session=sessionFactory.openSession();
		String hql="from Client as c where c.cno = :cno";
		List<Client> list=(List<Client>)session.createQuery(hql).setParameter("cno", cno).list();
		return list;
	}

}
