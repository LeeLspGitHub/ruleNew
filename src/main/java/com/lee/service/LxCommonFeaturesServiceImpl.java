package com.lee.service;

import com.lee.dao.LxCommonFeaturesMapper;
import com.lee.pojo.FactFeatures;
import com.lee.pojo.LxCommonFeatureReference;
import com.lee.pojo.LxCommonFeatures;
import com.lee.pojo.LxPlotType;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

/**
 * @ClassName FactFeaturesServiceImpl
 * @Description TODO
 * @Author Lee
 * @Date 2019/12/25 10:16
 */
public class LxCommonFeaturesServiceImpl implements LxCommonFeaturesService {

    @Autowired
    private LxCommonFeaturesMapper lxCommonFeaturesMapper;

    public void setLxCommonFeaturesMapper(LxCommonFeaturesMapper lxCommonFeaturesMapper) {
        this.lxCommonFeaturesMapper = lxCommonFeaturesMapper;
    }


    public List<LxCommonFeatures> lxCommonFeaturesList(Map<String, Object> map) {
        return lxCommonFeaturesMapper.lxCommonFeaturesList(map);
    }

    public int lxCommonFeaturesListCounts(Map<String, Object> map) {
        return lxCommonFeaturesMapper.lxCommonFeaturesListCounts(map);
    }

    public int saveLxCommonFeatures(Map<String, Object> map) {
        return lxCommonFeaturesMapper.saveLxCommonFeatures(map);
    }

    public int saveLxCommonFeaturesReference(Map<String, Object> map) {
        return lxCommonFeaturesMapper.saveLxCommonFeaturesReference(map);
    }

    public int deleteLxCommonFeaturesById(Map<String, Object> map) {
        return lxCommonFeaturesMapper.deleteLxCommonFeaturesById(map);
    }

    public int deleteLxCommonFeatureReferenceById(Map<String, Object> map) {
        return lxCommonFeaturesMapper.deleteLxCommonFeatureReferenceById(map);
    }

    public List<LxCommonFeatures> findOneLxCommonFeatureById(Map<String, Object> map) {
        return lxCommonFeaturesMapper.findOneLxCommonFeatureById(map);
    }

    public int updateLxCommonFeatureById(Map<String, Object> map) {
        return lxCommonFeaturesMapper.updateLxCommonFeatureById(map);
    }

    public int updateLxCommonFeatureReferenceById(Map<String, Object> map) {
        return lxCommonFeaturesMapper.updateLxCommonFeatureReferenceById(map);
    }

    public List<LxCommonFeatureReference> lxCommonFeatureReferenceList(Map<String, Object> map) {
        return lxCommonFeaturesMapper.lxCommonFeatureReferenceList(map);
    }

    public int lxCommonFeatureReferenceListCounts(Map<String, Object> map) {
        return lxCommonFeaturesMapper.lxCommonFeatureReferenceListCounts(map);
    }

    public List<LxCommonFeatures> getAddDefaultLxCommonFeature() {
        return lxCommonFeaturesMapper.getAddDefaultLxCommonFeature();
    }

    public List<LxCommonFeatures> getAddMaxLxOrderCommonFeature(Map<String, Object> map) {
        return lxCommonFeaturesMapper.getAddMaxLxOrderCommonFeature(map);
    }

    public List<LxCommonFeatures> isEnNameExist(Map<String, Object> map) {
        return lxCommonFeaturesMapper.isEnNameExist(map);
    }

    @Override
    public List<LxCommonFeatures> isChiNameExist(Map<String, Object> map) {
        return lxCommonFeaturesMapper.isChiNameExist(map);
    }

    @Override
    public List<LxPlotType> lxPlotTypeList(Map<String, Object> map) {
        return lxCommonFeaturesMapper.lxPlotTypeList(map);
    }

    @Override
    public int lxPlotTypeListCounts(Map<String, Object> map) {
        return lxCommonFeaturesMapper.lxPlotTypeListCounts(map);
    }
}
