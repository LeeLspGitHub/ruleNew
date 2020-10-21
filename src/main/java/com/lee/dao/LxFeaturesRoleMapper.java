package com.lee.dao;

import com.lee.pojo.LxCommonFeatureReference;
import com.lee.pojo.LxCommonFeatures;
import com.lee.pojo.LxFeaturesRole;
import com.lee.pojo.LxPlotType;

import java.util.List;
import java.util.Map;

public interface LxFeaturesRoleMapper {

    //查询所有的条件限制
    List<LxFeaturesRole> lxFeaturesRoleList(Map<String, Object> map);
    int lxFeaturesRoleListCounts(Map<String, Object> map);
    //新增条件限制
    int saveLxFeaturesRole(Map<String, Object> map);

    //删除条件限制
    int deleteLxFeaturesRoleById(Map<String, Object> map);

    //查询一个条件限制通过id
    List<LxFeaturesRole> findOneLxFeatureRoleById(Map<String, Object> map);
    //更新条件限制
    int updateLxFeatureRole(Map<String, Object> map);

}
