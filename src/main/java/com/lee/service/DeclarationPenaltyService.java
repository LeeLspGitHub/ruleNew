package com.lee.service;

import com.lee.pojo.DeclarationPenalty;

import java.util.List;
import java.util.Map;

public interface DeclarationPenaltyService {
    //查询所有的法定刑
    List<DeclarationPenalty> declarationPenaltyList(Map<String, Object> map);
    int declarationPenaltyListCounts(Map<String, Object> map);
    //新增法定刑
    int saveDeclarationPenalty(Map<String, Object> map);
    //删除法定刑
    int deleteDeclarationPenaltyById(Map<String, Object> map);
    //查询一个法定刑通过id
    List<DeclarationPenalty> findOneDeclarationPenaltyById(Map<String, Object> map);
    //更新法定刑
    int updateDeclarationPenalty(Map<String, Object> map);

}
