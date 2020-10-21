package com.lee.service;

import com.lee.pojo.BenchmarkPoint;
import com.lee.pojo.StartingPoint;

import java.util.List;
import java.util.Map;

public interface BenchmarkPointService {


    //查询所有的基准特征
    List<BenchmarkPoint> benchmarkPointList(Map<String, Object> map);
    int benchmarkPointListCounts(Map<String, Object> map);
    //新增基准特征
    int saveBenchmarkPointRule(Map<String, Object> map);
    //删除基准特征
    int deleteBenchmarkPointRuleById(Map<String, Object> map);
    //查询一个基准特征通过id
    List<BenchmarkPoint> findOneBenchmarkPointRuleById(Map<String, Object> map);
    //更新基准特征
    int updateBenchmarkPointRule(Map<String, Object> map);
    //查询一个基准特征根据最大id   添加默认
    List<BenchmarkPoint> getAddDefaultBenchmarkPointRule();
    //查询序号的最大值
    List<BenchmarkPoint> getAddMaxLxOrderBenchmarkPointRule(Map<String, Object> map);
}
