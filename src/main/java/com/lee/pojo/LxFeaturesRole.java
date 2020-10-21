package com.lee.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @ClassName LxFeaturesRole
 * @Description TODO
 * @Author Lee
 * @Date 2019/12/24 23:29
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LxFeaturesRole {

    private int id;
    private String caseCause;
    private String caseCauseId;
    private String province;
    private String provinceId;
    private String lxType;
    private String lowerLimit;
    private String upperLimit;
    private String conditions;
    private String conditionsName;
    private String descS;
    private String note;
    private String createTime;
    private String updateTime;
    private String createPerson;
    private String updatePerson;
    private String auditStatus;

}
