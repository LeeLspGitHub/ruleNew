package com.lee.service;

import com.lee.dao.FactFeaturesMapper;
import com.lee.pojo.FactFeatureReference;
import com.lee.pojo.FactFeatures;
import com.lee.pojo.LxCommonFeatures;
import com.lee.pojo.MappingFeatures;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

/**
 * @ClassName FactFeaturesServiceImpl
 * @Description TODO
 * @Author Lee
 * @Date 2019/12/25 10:16
 */
public class FactFeaturesServiceImpl implements FactFeaturesService {

    @Autowired
    private FactFeaturesMapper factFeaturesMapper;

    public void setFactFeaturesMapper(FactFeaturesMapper factFeaturesMapper) {
        this.factFeaturesMapper = factFeaturesMapper;
    }

    public List<FactFeatures> factFeaturesList(Map<String, Object> map) {
        return factFeaturesMapper.factFeaturesList(map);
    }

    public int factFeaturesListCounts(Map<String, Object> map) {
        return factFeaturesMapper.factFeaturesListCounts(map);
    }

    public int saveFactFeatures(Map<String, Object> map) {
        return factFeaturesMapper.saveFactFeatures(map);
    }

    public int saveFactFeaturesReference(Map<String, Object> map) {
        return factFeaturesMapper.saveFactFeaturesReference(map);
    }

    public int saveLxFeatures(Map<String, Object> map) {
        return factFeaturesMapper.saveLxFeatures(map);
    }

    public int saveLxFeatureReference(Map<String, Object> map) {
        return factFeaturesMapper.saveLxFeatureReference(map);
    }

    public int saveDeclaringPointRule(Map<String, Object> map) {
        return factFeaturesMapper.saveDeclaringPointRule(map);
    }

    public int deleteFactFeaturesById(Map<String, Object> map) {
        return factFeaturesMapper.deleteFactFeaturesById(map);
    }

    public int deleteFactFeatureReferenceById(Map<String, Object> map) {
        return factFeaturesMapper.deleteFactFeatureReferenceById(map);
    }

    public int deleteLxFeaturesById(Map<String, Object> map) {
        return factFeaturesMapper.deleteLxFeaturesById(map);
    }

    public int deleteLxFeatureReferenceById(Map<String, Object> map) {
        return factFeaturesMapper.deleteLxFeatureReferenceById(map);
    }

    public List<FactFeatures> findOneFactFeatureById(Map<String, Object> map) {
        return factFeaturesMapper.findOneFactFeatureById(map);
    }

    @Override
    public List<FactFeatures> findOnelxFeatureById(Map<String, Object> map) {
        return factFeaturesMapper.findOnelxFeatureById(map);
    }

    public int updateFactFeatureById(Map<String, Object> map) {
        return factFeaturesMapper.updateFactFeatureById(map);
    }

    public int updateFactFeatureReferenceById(Map<String, Object> map) {
        return factFeaturesMapper.updateFactFeatureReferenceById(map);
    }

    public int updateLxFeatureById(Map<String, Object> map) {
        return factFeaturesMapper.updateLxFeatureById(map);
    }

    public int updateLxFeatureReferenceById(Map<String, Object> map) {
        return factFeaturesMapper.updateLxFeatureReferenceById(map);
    }

    public List<FactFeatureReference> factFeatureReferenceList(Map<String, Object> map) {
        return factFeaturesMapper.factFeatureReferenceList(map);
    }

    public int factFeatureReferenceListCounts(Map<String, Object> map) {
        return factFeaturesMapper.factFeatureReferenceListCounts(map);
    }

    @Override
    public List<MappingFeatures> mappingFeatureList(Map<String, Object> map) {
        return factFeaturesMapper.mappingFeatureList(map);
    }

    @Override
    public int mappingFeatureListCounts(Map<String, Object> map) {
        return factFeaturesMapper.mappingFeatureListCounts(map);
    }

    public List<FactFeatures> getAddDefaultFactFeature() {
        return factFeaturesMapper.getAddDefaultFactFeature();
    }

    public List<FactFeatures> getAddMaxLxOrderFactFeature(Map<String, Object> map) {
        return factFeaturesMapper.getAddMaxLxOrderFactFeature(map);
    }

    public List<FactFeatures> isEnNameExist(Map<String, Object> map) {
        return factFeaturesMapper.isEnNameExist(map);
    }

    @Override
    public List<FactFeatures> isChiNameExist(Map<String, Object> map) {
        return factFeaturesMapper.isChiNameExist(map);
    }

    @Override
    public List<FactFeatures> isEnNameExist4(Map<String, Object> map) {
        return factFeaturesMapper.isEnNameExist4(map);
    }

    @Override
    public List<FactFeatures> isChiNameExist4(Map<String, Object> map) {
        return factFeaturesMapper.isChiNameExist4(map);
    }

    @Override
    public List<FactFeatures> isFactLxExit(Map<String, Object> map) {
        return factFeaturesMapper.isFactLxExit(map);
    }
}
