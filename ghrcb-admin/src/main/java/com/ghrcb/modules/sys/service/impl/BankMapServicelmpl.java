package com.ghrcb.modules.sys.service.impl;

import com.ghrcb.modules.sys.dao.BankMapDao;
import com.ghrcb.modules.sys.service.BankMapService;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;


@ComponentScan({"ssm.springboot_ftl.mapper"})
@Service("mapService")
public class BankMapServicelmpl implements BankMapService {

	@Resource
	private BankMapDao userMapper;
	@Override
	public void addMap(HashMap map){
		userMapper.addMap(map);
	}
	@Override
	public List<HashMap> findMap(HashMap map){
		return  userMapper.findMap(map);
	}
	@Override
	public List<String>   findDepart(HashMap map){
		return  userMapper.findDepart(map);
	}
	@Override
	public List<HashMap> findMark(HashMap map){
		return  userMapper.findMark(map);
	}
	@Override
	public List<String>  findGroupBy(HashMap map){
		return  userMapper.findGroupBy(map);
	}
}
