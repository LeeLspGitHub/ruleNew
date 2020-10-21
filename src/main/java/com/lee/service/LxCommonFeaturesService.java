package com.lee.service;

import com.lee.pojo.*;

import java.util.List;
import java.util.Map;

public interface LxCommonFeaturesService {


    //查询所有的事实特征
    List<LxCommonFeatures> lxCommonFeaturesList(Map<String, Object> map);
    int lxCommonFeaturesListCounts(Map<String, Object> map);

    //新增普通特征
    int saveLxCommonFeatures(Map<String, Object> map);
    //新增普通特征Reference
    int saveLxCommonFeaturesReference(Map<String, Object> map);

    //删除普通特征
    int deleteLxCommonFeaturesById(Map<String, Object> map);
    //删除普通特征Reference
    int deleteLxCommonFeatureReferenceById(Map<String, Object> map);

    //查询一个普通特征通过id
    List<LxCommonFeatures> findOneLxCommonFeatureById(Map<String, Object> map);

    //更新事实特征
    int updateLxCommonFeatureById(Map<String, Object> map);
    //更新事实特征Reference
    int updateLxCommonFeatureReferenceById(Map<String, Object> map);

    //查询所有的普通特征Reference
    List<LxCommonFeatureReference> lxCommonFeatureReferenceList(Map<String, Object> map);
    int lxCommonFeatureReferenceListCounts(Map<String, Object> map);

    //查询一个普通特征根据最大id   添加默认
    List<LxCommonFeatures> getAddDefaultLxCommonFeature();
    //查询序号的最大值
    List<LxCommonFeatures> getAddMaxLxOrderCommonFeature(Map<String, Object> map);
    //判断英文名是否存在
    List<LxCommonFeatures> isEnNameExist(Map<String, Object> map);
    //判断中文名是否存在
    List<LxCommonFeatures> isChiNameExist(Map<String, Object> map);
    //查询所有量刑情节类型
    List<LxPlotType> lxPlotTypeList(Map<String,Object> map);
    int lxPlotTypeListCounts(Map<String,Object> map);
}
