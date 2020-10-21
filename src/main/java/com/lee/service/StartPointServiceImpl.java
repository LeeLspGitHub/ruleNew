package com.lee.service;

import com.lee.dao.StartPointMapper;
import com.lee.pojo.BenchmarkPoint;
import com.lee.pojo.StartingPoint;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

/**
 * @ClassName FactFeaturesServiceImpl
 * @Description TODO
 * @Author Lee
 * @Date 2019/12/25 10:16
 */
public class StartPointServiceImpl implements StartPointService {

    @Autowired
    private StartPointMapper startPointMapper;

    public void setStartPointMapper(StartPointMapper startPointMapper) {
        this.startPointMapper = startPointMapper;
    }

    public List<StartingPoint> startPointList(Map<String, Object> map) {
        return startPointMapper.startPointList(map);
    }

    public int startPointListCounts(Map<String, Object> map) {
        return startPointMapper.startPointListCounts(map);
    }

    public int saveStartPointRule(Map<String, Object> map) {
        return startPointMapper.saveStartPointRule(map);
    }

    public List<StartingPoint> getAddMaxLxOrderStartPointRule(Map<String, Object> map) {
        return startPointMapper.getAddMaxLxOrderStartPointRule(map);
    }

    public int deteleStartPointRule(Map<String, Object> map) {
        return startPointMapper.deteleStartPointRule(map);
    }


    public List<StartingPoint> findOneStartPointRuleById(Map<String, Object> map) {
        return startPointMapper.findOneStartPointRuleById(map);
    }

    public int updateStartPointRule(Map<String, Object> map) {
        return startPointMapper.updateStartPointRule(map);
    }

    public List<StartingPoint> getAddDefaultStartPointRule() {
        return startPointMapper.getAddDefaultStartPointRule();
    }



}
