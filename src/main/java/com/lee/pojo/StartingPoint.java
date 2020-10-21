package com.lee.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @ClassName StartingPoint
 * @Description TODO
 * @Author Lee
 * @Date 2020/1/6 17:41
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class StartingPoint {
    private int id;
    private String caseCauseId;
    private String caseCause;
    private String provinceId;
    private String province;
    private String number;
    private String minValues;
    private String maxValues;
    private String standardValues;
    private String conditions;
    private String descS;
    private String createTime;
    private String updateTime;
    private String auditStatus;
    private String provinceItem;
    private String nationItem;
    private String createPerson;
    private String updatePerson;
    private String note;
    private String tip;

    private String conditionsName;
}
