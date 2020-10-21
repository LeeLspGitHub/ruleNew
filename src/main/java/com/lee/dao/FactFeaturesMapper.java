package com.lee.dao;

import com.lee.pojo.FactFeatureReference;
import com.lee.pojo.FactFeatures;
import com.lee.pojo.LxCommonFeatures;
import com.lee.pojo.MappingFeatures;

import java.util.List;
import java.util.Map;

public interface FactFeaturesMapper {

    //查询所有的事实特征
    List<FactFeatures> factFeaturesList(Map<String,Object> map);
    int factFeaturesListCounts(Map<String,Object> map);
    //查询所有的事实特征Reference
    List<FactFeatureReference> factFeatureReferenceList(Map<String,Object> map);
    int factFeatureReferenceListCounts(Map<String,Object> map);
    //查询所有的映射特征
    List<MappingFeatures> mappingFeatureList(Map<String,Object> map);
    int mappingFeatureListCounts(Map<String,Object> map);

    //新增事实特征
    int saveFactFeatures(Map<String,Object> map);
    //新增事实特征Reference
    int saveFactFeaturesReference(Map<String,Object> map);
    //新增事实特征Lx
    int saveLxFeatures(Map<String,Object> map);
    //新增事实特征LxReference
    int saveLxFeatureReference(Map<String,Object> map);
    //新增DeclaringPoint
    int saveDeclaringPointRule(Map<String, Object> map);
    //查询一个事实特征根据最大id   添加默认
    List<FactFeatures> getAddDefaultFactFeature();
    //查询序号的最大值
    List<FactFeatures> getAddMaxLxOrderFactFeature(Map<String, Object> map);
    //删除事实特征
    int deleteFactFeaturesById(Map<String,Object> map);
    //删除事实特征Reference
    int deleteFactFeatureReferenceById(Map<String,Object> map);
    //删除事实特征Lx
    int deleteLxFeaturesById(Map<String,Object> map);
    //删除事实特征LxReference
    int deleteLxFeatureReferenceById(Map<String,Object> map);

    //查询一个事实特征通过id
    List<FactFeatures> findOneFactFeatureById(Map<String,Object> map);
    List<FactFeatures> findOnelxFeatureById(Map<String,Object> map);
    //更新事实特征
    int updateFactFeatureById(Map<String,Object> map);
    //更新事实特征Reference
    int updateFactFeatureReferenceById(Map<String,Object> map);
    //更新事实特征Lx
    int updateLxFeatureById(Map<String,Object> map);
    //更新事实特征LxReference
    int updateLxFeatureReferenceById(Map<String,Object> map);

    //判断英文名是否存在
    List<FactFeatures> isEnNameExist(Map<String,Object> map);
    //判断标准特征是否存在
    List<FactFeatures> isChiNameExist(Map<String,Object> map);
    //判断英文名是否存在4
    List<FactFeatures> isEnNameExist4(Map<String,Object> map);
    //判断标准特征是否存在4
    List<FactFeatures> isChiNameExist4(Map<String,Object> map);
    //判断标准个罪特征是否存在
    List<FactFeatures> isFactLxExit(Map<String,Object> map);

}
