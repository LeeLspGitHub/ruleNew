package com.lee.service;

import com.lee.pojo.DeclaringPoint;

import java.util.List;
import java.util.Map;

public interface DeclaringPointService {


    //查询所有的起点特征
    List<DeclaringPoint> declaringPointList(Map<String, Object> map);
    int declaringPointListCounts(Map<String, Object> map);
    //新增起点特征
    int saveDeclaringPointRule(Map<String, Object> map);
    //删除起点特征
    int deleteDeclaringPointRuleById(Map<String, Object> map);
    //查询一个起点特征通过id
    List<DeclaringPoint> findOneDeclaringPointRuleById(Map<String, Object> map);
    //更新起点特征
    int updateDeclaringPointRule(Map<String, Object> map);
    //查询一个起点特征根据最大id   添加默认
    List<DeclaringPoint> getAddDefaultDeclaringPointRule();
}
