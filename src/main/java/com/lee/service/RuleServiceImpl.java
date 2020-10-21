package com.lee.service;

import com.lee.dao.RuleMapper;
import com.lee.pojo.Rules;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

/**
 * @ClassName RuleServiceImpl
 * @Description TODO
 * @Author Lee
 * @Date 2019/12/17 9:53
 */
public class RuleServiceImpl implements RuleService {

    @Autowired
    private RuleMapper ruleMapper;

    public void setRuleMapper(RuleMapper ruleMapper) {
        this.ruleMapper = ruleMapper;
    }

    public List<Rules> ruleList(Map<String,Object> map) {
        return ruleMapper.ruleList(map);
    }

    public int ruleListCounts(Map<String,Object> map) {
        return ruleMapper.ruleListCounts(map);
    }

    public int saveRule(Map<String, Object> map) {
        return ruleMapper.saveRule(map);
    }

    public int deleteRuleById(Map<String, Object> map) {
        return ruleMapper.deleteRuleById(map);
    }

    public List<Rules> findOneRuleById(Map<String,Object> map) {
        return ruleMapper.findOneRuleById(map);
    }

    public int updateRuleById(Map<String, Object> map) {
        return ruleMapper.updateRuleById(map);
    }

}
