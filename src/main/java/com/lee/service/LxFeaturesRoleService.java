package com.lee.service;

import com.lee.dao.LxFeaturesRoleMapper;
import com.lee.pojo.BenchmarkPoint;
import com.lee.pojo.LxFeaturesRole;

import java.util.List;
import java.util.Map;

public interface LxFeaturesRoleService {

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
