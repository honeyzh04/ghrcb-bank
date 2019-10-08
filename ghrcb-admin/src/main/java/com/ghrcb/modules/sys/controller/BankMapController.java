package com.ghrcb.modules.sys.controller;

import com.ghrcb.modules.sys.service.BankMapService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


@RestController
@RequestMapping("/sys/map")
public class BankMapController extends AbstractController {

    @Resource
    private BankMapService mapService;


    @RequestMapping("/addMapUI")
    public String addMapUI() {
        return "add";
    }

    @RequestMapping(value = "/addMap", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String addMap(String lng, String lat, String color, String address, String department, String num, String group) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("department", department);
        map.put("lng", lng);
        map.put("lat", lat);
        map.put("address", "1");
        map.put("color", color);
        map.put("createDate", new Date());
        map.put("state", "1");
        map.put("num", num);
        map.put("group", group);
        mapService.addMap(map);
        return "success";
    }


    @RequestMapping("/findMapUI")
    public String findMapUI() {
        return "list";
    }

    @RequestMapping("/findMap")
    @ResponseBody
    public List<HashMap> findMap(String address, String department) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("department", department);
        map.put("address", address);

        List<HashMap> listMap = mapService.findMap(map);
        return listMap;
    }

    @RequestMapping("/findMark")
    @ResponseBody
    public List<HashMap> findMark(String department) {

        HashMap<String, Object> mark = new HashMap<>();
        mark.put("department", department);
        List<HashMap> listMark = mapService.findMark(mark);

        return listMark;
    }

    @RequestMapping("/findDepart")
    @ResponseBody
    public List<String> findDepart(String department) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("department", department);
        List<String> listMap = mapService.findDepart(map);
        return listMap;
    }

    @RequestMapping("/findMaps")
    @ResponseBody
    public List<List<HashMap>> findMaps(String address, String department) {

        List list = new ArrayList();
        HashMap<String, Object> map = new HashMap<>();
        map.put("department", department);
        List<String> listMap = mapService.findGroupBy(map);
        for (String groupBy : listMap) {
            map.put("groupBy", groupBy);
            List<HashMap> listMap1 = mapService.findMap(map);
            list.add(listMap1);
        }

        return list;
    }

}
