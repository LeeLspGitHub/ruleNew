package com.lee.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @ClassName DeclarationPenalty
 * @Description 法定刑
 * @Author Lee
 * @Date 2020/3/12 17:41
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class DeclarationPenalty {
    private int id;
    private String startNumber;
    private String caseCause;
    private String caseCauseId;
    private String province;
    private String provinceId;
    private String lxCondition;
    private String lMinValue;
    private String lMaxValue;
    private String lStandardValue;
    private String uMinValue;
    private String uMaxValue;
    private String lxFlckTrue;
    private String lxFlckFalse;
    private String createTime;
    private String updateTime;
    private String createPerson;
    private String updatePerson;
    private String descS;
}
