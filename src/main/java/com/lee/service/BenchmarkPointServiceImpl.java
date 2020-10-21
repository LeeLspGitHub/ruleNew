package com.lee.service;

import com.lee.dao.BenchmarkPointMapper;
import com.lee.dao.StartPointMapper;
import com.lee.pojo.BenchmarkPoint;
import com.lee.pojo.StartingPoint;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

/**
 * @ClassName FactFeaturesServiceImpl
 * @Description TODO
 * @Author Lee
 * @Date 2019/12/25 10:16
 */
public class BenchmarkPointServiceImpl implements BenchmarkPointService {

    @Autowired
    private BenchmarkPointMapper benchmarkPointMapper;

    public void setBenchmarkPointMapper(BenchmarkPointMapper benchmarkPointMapper) {
        this.benchmarkPointMapper = benchmarkPointMapper;
    }

    public List<BenchmarkPoint> benchmarkPointList(Map<String, Object> map) {
        return benchmarkPointMapper.benchmarkPointList(map);
    }

    public int benchmarkPointListCounts(Map<String, Object> map) {
        return benchmarkPointMapper.benchmarkPointListCounts(map);
    }

    public int saveBenchmarkPointRule(Map<String, Object> map) {
        return benchmarkPointMapper.saveBenchmarkPointRule(map);
    }

    public int deleteBenchmarkPointRuleById(Map<String, Object> map) {
        return benchmarkPointMapper.deleteBenchmarkPointRuleById(map);
    }

    public List<BenchmarkPoint> findOneBenchmarkPointRuleById(Map<String, Object> map) {
        return benchmarkPointMapper.findOneBenchmarkPointRuleById(map);
    }

    public int updateBenchmarkPointRule(Map<String, Object> map) {
        return benchmarkPointMapper.updateBenchmarkPointRule(map);
    }

    public List<BenchmarkPoint> getAddDefaultBenchmarkPointRule() {
        return benchmarkPointMapper.getAddDefaultBenchmarkPointRule();
    }

    public List<BenchmarkPoint> getAddMaxLxOrderBenchmarkPointRule(Map<String, Object> map) {
        return benchmarkPointMapper.getAddMaxLxOrderBenchmarkPointRule(map);
    }
}
