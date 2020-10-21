package com.lee.dao;

import com.lee.pojo.Rules;

import java.util.List;
import java.util.Map;

public interface RuleMapper {
    //查询所有的规则
    List<Rules> ruleList(Map<String,Object> map);
    int ruleListCounts(Map<String,Object> map);
    //新增规则
    int saveRule(Map<String,Object> map);
    //新增规则
    int deleteRuleById(Map<String,Object> map);
    //查询一个规则根据id
    List<Rules> findOneRuleById(Map<String,Object> map);
    //更新规则
    int updateRuleById(Map<String,Object> map);

}
