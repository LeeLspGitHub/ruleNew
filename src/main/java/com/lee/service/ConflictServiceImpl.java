package com.lee.service;

import com.lee.dao.ConflictMapper;
import com.lee.dao.DeclarationPenaltyMapper;
import com.lee.pojo.Conflict;
import com.lee.pojo.DeclarationPenalty;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

/**
 * @ClassName ConflictServiceImpl
 * @Description TODO
 * @Author Lee
 * @Date 2019/12/25 10:16
 */
public class ConflictServiceImpl implements  ConflictService {

    @Autowired
    private ConflictMapper conflictMapper;

    public void setConflictMapper(ConflictMapper conflictMapper) {
        this.conflictMapper = conflictMapper;
    }

    @Override
    public List<Conflict> ConflictList(Map<String, Object> map) {
        return conflictMapper.ConflictList(map);
    }

    @Override
    public int ConflictListCounts(Map<String, Object> map) {
        return conflictMapper.ConflictListCounts(map);
    }

    @Override
    public int saveConflict(Map<String, Object> map) {
        return conflictMapper.saveConflict(map);
    }

    @Override
    public int deleteConflictById(Map<String, Object> map) {
        return conflictMapper.deleteConflictById(map);
    }

    @Override
    public List<Conflict> findOneConflictById(Map<String, Object> map) {
        return conflictMapper.findOneConflictById(map);
    }

    @Override
    public int updateConflict(Map<String, Object> map) {
        return conflictMapper.updateConflict(map);
    }
}
