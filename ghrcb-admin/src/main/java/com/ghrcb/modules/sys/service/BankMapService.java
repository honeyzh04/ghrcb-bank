/**
 * 
 */
package com.ghrcb.modules.sys.service;

import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * Copyright (C), 2018-2022, ChengDu First Real estate agency
   @author zhaoh
 * @date 2018年7月24日
   @version 1.00
 */
@Service
public interface BankMapService {

    public void addMap(HashMap map);
    public List<HashMap> findMap(HashMap map);
    public List<String>   findDepart(HashMap map);
    public List<HashMap> findMark(HashMap map);
    public List<String>  findGroupBy(HashMap map);
}
