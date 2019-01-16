package com.shopping.service.impl;

import java.util.List;

import com.shopping.dao.MessageDao;
import com.shopping.model.Message;
import com.shopping.service.MessageService;

public class MessageServiceImpl implements MessageService{
	private MessageDao messageDao;
	
	public MessageDao getMessageDao() {
		return messageDao;
	}

	public void setMessageDao(MessageDao messageDao) {
		this.messageDao = messageDao;
	}

	@Override
	public boolean save(Message message) {
		return messageDao.save(message);
	}

	@Override
	public boolean deleteById(String shopname) {
		return messageDao.deleteById(shopname);
	}

	@Override
	public boolean update(Message message) {
		return messageDao.update(message);
	}

	@Override
	public Message get(String shopname) {
		return messageDao.get(shopname);
	}

	@Override
	public List<Message> getallByshopname(String shopname) {
		return messageDao.getallByshopname(shopname);
	}

}
