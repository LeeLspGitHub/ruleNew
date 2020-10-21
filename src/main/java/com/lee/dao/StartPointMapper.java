package com.lee.dao;

import com.lee.pojo.StartingPoint;

import java.util.List;
import java.util.Map;

public interface StartPointMapper {

    //查询所有的起点特征
    List<StartingPoint> startPointList(Map<String, Object> map);
    int startPointListCounts(Map<String, Object> map);
    //新增起点特征
    int saveStartPointRule(Map<String, Object> map);
    //删除起点特征
    int deteleStartPointRule(Map<String, Object> map);
    //查询一个起点特征通过id
    List<StartingPoint> findOneStartPointRuleById(Map<String, Object> map);
    //更新起点特征
    int updateStartPointRule(Map<String, Object> map);
    //查询一个起点特征根据最大id   添加默认
    List<StartingPoint> getAddDefaultStartPointRule();
    //查询序号的最大值
    List<StartingPoint> getAddMaxLxOrderStartPointRule(Map<String, Object> map);

}
