package com.lee.service;

import com.lee.dao.DeclaringPointMapper;
import com.lee.dao.StartPointMapper;
import com.lee.pojo.DeclaringPoint;
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
public class DeclaringPointServiceImpl implements DeclaringPointService {

    @Autowired
    private DeclaringPointMapper declaringPointMapper;

    public void setDeclaringPointMapper(DeclaringPointMapper declaringPointMapper) {
        this.declaringPointMapper = declaringPointMapper;
    }

    public List<DeclaringPoint> declaringPointList(Map<String, Object> map) {
        return declaringPointMapper.declaringPointList(map);
    }

    public int declaringPointListCounts(Map<String, Object> map) {
        return declaringPointMapper.declaringPointListCounts(map);
    }

    public int saveDeclaringPointRule(Map<String, Object> map) {
        return declaringPointMapper.saveDeclaringPointRule(map);
    }

    public int deleteDeclaringPointRuleById(Map<String, Object> map) {
        return declaringPointMapper.deleteDeclaringPointRuleById(map);
    }

    public List<DeclaringPoint> findOneDeclaringPointRuleById(Map<String, Object> map) {
        return declaringPointMapper.findOneDeclaringPointRuleById(map);
    }

    public int updateDeclaringPointRule(Map<String, Object> map) {
        return declaringPointMapper.updateDeclaringPointRule(map);
    }

    public List<DeclaringPoint> getAddDefaultDeclaringPointRule() {
        return declaringPointMapper.getAddDefaultDeclaringPointRule();
    }
}
