package com.lee.service;

import com.lee.pojo.Conflict;
import com.lee.pojo.DeclarationPenalty;

import java.util.List;
import java.util.Map;

public interface ConflictService {
    //查询所有的冲突
    List<Conflict> ConflictList(Map<String, Object> map);
    int ConflictListCounts(Map<String, Object> map);
    //新增冲突
    int saveConflict(Map<String, Object> map);
    //删除冲突
    int deleteConflictById(Map<String, Object> map);
    //查询一个冲突通过id
    List<Conflict> findOneConflictById(Map<String, Object> map);
    //更新冲突
    int updateConflict(Map<String, Object> map);

}
