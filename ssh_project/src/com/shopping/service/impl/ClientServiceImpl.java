package com.shopping.service.impl;

import java.util.List;

import com.shopping.dao.ClientDao;
import com.shopping.model.Client;
import com.shopping.service.ClientService;

public class ClientServiceImpl implements ClientService{
	private ClientDao clientDao;
	
	public ClientDao getClientDao() {
		return clientDao;
	}

	public void setClientDao(ClientDao clientDao) {
		this.clientDao = clientDao;
	}

	@Override
	public boolean save(Client client) {
		return clientDao.save(client);
	}

	@Override
	public boolean deleteById(int cno) {
		return clientDao.deleteById(cno);
	}

	@Override
	public boolean update(Client client) {
		return clientDao.update(client);
	}

	@Override
	public Client get(int cno) {
		return clientDao.get(cno);
	}

	@Override
	public List<Client> getAll() {
		return clientDao.getAll();
	}

	@Override
	public List<Client> getAllBySex(String csex) {
		return clientDao.getAllBySex(csex);
	}

	@Override
	public List<Client> getAllByName(String cname) {
		return clientDao.getAllByName(cname);
	}

	@Override
	public Client login(String cname, String password) {
		return clientDao.login(cname, password);
	}

	@Override
	public List<Client> getAllByCno(int cno) {
		return clientDao.getAllByCno(cno);
	}

}
