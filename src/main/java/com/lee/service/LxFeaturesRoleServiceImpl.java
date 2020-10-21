package com.lee.service;

import com.lee.dao.LxFeaturesRoleMapper;

import com.lee.pojo.LxFeaturesRole;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

/**
 * @ClassName LxFeaturesRoleServiceImpl
 * @Description TODO
 * @Author Lee
 * @Date 2019/12/25 10:16
 */
public class LxFeaturesRoleServiceImpl implements LxFeaturesRoleService {

    @Autowired
    private LxFeaturesRoleMapper lxFeaturesRoleMapper;

    public void setLxFeaturesRoleMapper(LxFeaturesRoleMapper lxFeaturesRoleMapper) {
        this.lxFeaturesRoleMapper = lxFeaturesRoleMapper;
    }

    @Override
    public List<LxFeaturesRole> lxFeaturesRoleList(Map<String, Object> map) {
        return lxFeaturesRoleMapper.lxFeaturesRoleList(map);
    }

    @Override
    public int lxFeaturesRoleListCounts(Map<String, Object> map) {
        return lxFeaturesRoleMapper.lxFeaturesRoleListCounts(map);
    }

    @Override
    public int saveLxFeaturesRole(Map<String, Object> map) {
        return lxFeaturesRoleMapper.saveLxFeaturesRole(map);
    }

    @Override
    public int deleteLxFeaturesRoleById(Map<String, Object> map) {
        return lxFeaturesRoleMapper.deleteLxFeaturesRoleById(map);
    }

    @Override
    public List<LxFeaturesRole> findOneLxFeatureRoleById(Map<String, Object> map) {
        return lxFeaturesRoleMapper.findOneLxFeatureRoleById(map);
    }

    @Override
    public int updateLxFeatureRole(Map<String, Object> map) {
        return lxFeaturesRoleMapper.updateLxFeatureRole(map);
    }
}
