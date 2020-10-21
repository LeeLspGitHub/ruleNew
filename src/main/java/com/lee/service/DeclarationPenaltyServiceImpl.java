package com.lee.service;

import com.lee.dao.DeclarationPenaltyMapper;
import com.lee.dao.DeclaringPointMapper;
import com.lee.pojo.DeclarationPenalty;
import com.lee.pojo.DeclaringPoint;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

/**
 * @ClassName FactFeaturesServiceImpl
 * @Description TODO
 * @Author Lee
 * @Date 2019/12/25 10:16
 */
public class DeclarationPenaltyServiceImpl implements DeclarationPenaltyService {

    @Autowired
    private DeclarationPenaltyMapper declarationPenaltyMapper;

    public void setDeclarationPenaltyMapper(DeclarationPenaltyMapper declarationPenaltyMapper) {
        this.declarationPenaltyMapper = declarationPenaltyMapper;
    }

    @Override
    public List<DeclarationPenalty> declarationPenaltyList(Map<String, Object> map) {
        return declarationPenaltyMapper.declarationPenaltyList(map);
    }

    @Override
    public int declarationPenaltyListCounts(Map<String, Object> map) {
        return declarationPenaltyMapper.declarationPenaltyListCounts(map);
    }

    @Override
    public int saveDeclarationPenalty(Map<String, Object> map) {
        return declarationPenaltyMapper.saveDeclarationPenalty(map);
    }

    @Override
    public int deleteDeclarationPenaltyById(Map<String, Object> map) {
        return declarationPenaltyMapper.deleteDeclarationPenaltyById(map);
    }

    @Override
    public List<DeclarationPenalty> findOneDeclarationPenaltyById(Map<String, Object> map) {
        return declarationPenaltyMapper.findOneDeclarationPenaltyById(map);
    }

    @Override
    public int updateDeclarationPenalty(Map<String, Object> map) {
        return declarationPenaltyMapper.updateDeclarationPenalty(map);
    }
}
