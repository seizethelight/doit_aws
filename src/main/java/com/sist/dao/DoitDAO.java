package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.DoitMapper;

@Repository
public class DoitDAO {
	@Autowired
	private DoitMapper mapper; 
}
