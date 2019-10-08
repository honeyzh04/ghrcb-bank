package com.ghrcb.modules.sys.dao;

import org.apache.ibatis.annotations.Mapper;
import java.util.HashMap;
import java.util.List;

@Mapper
public interface BankMapDao {


	public void addMap(HashMap map);

	public List<HashMap> findMap(HashMap map);
    public List<String>   findDepart(HashMap map);
    public List<HashMap> findMark(HashMap map);
    public List<String>  findGroupBy(HashMap map);

}
