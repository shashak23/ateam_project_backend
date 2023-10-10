package com.ktdsuniversity.edu.career.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktdsuniversity.edu.career.dao.CareerDAO;
import com.ktdsuniversity.edu.career.vo.CareerVO;
@Service
public class CareerServiceImpl implements CareerService{
	@Autowired
	private CareerDAO careerDAO;
	@Override
	public boolean createNewCareer(CareerVO careerVO) {
		int createCount = careerDAO.createNewCareer(careerVO);
		return createCount>0;
	}
	@Override
	public boolean updateOneCarrer(CareerVO careerVO) {
		int updateCount = careerDAO.updateOneCarrer(careerVO);
		return updateCount>0;
	}

}
