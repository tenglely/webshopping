package com.shopping.service.impl;

import java.util.List;

import com.shopping.dao.PhotoDao;
import com.shopping.model.Photo;
import com.shopping.service.PhotoService;

public class PhotoServiceImpl implements PhotoService{
	private PhotoDao photoDao;

	public PhotoDao getPhotoDao() {
		return photoDao;
	}

	public void setPhotoDao(PhotoDao photoDao) {
		this.photoDao = photoDao;
	}

	@Override
	public boolean save(Photo photo) {
		return photoDao.save(photo);
	}

	@Override
	public boolean deleteById(int pno) {
		return photoDao.deleteById(pno);
	}

	@Override
	public boolean update(Photo photo) {
		return photoDao.update(photo);
	}

	@Override
	public Photo get(int pno) {
		return photoDao.get(pno);
	}

	@Override
	public List<Photo> getAll() {
		return photoDao.getAll();
	}

	@Override
	public List<Photo> getAllByName(String shopname) {
		return photoDao.getAllByName(shopname);
	}

}
