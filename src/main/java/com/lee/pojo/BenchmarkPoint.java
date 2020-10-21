package com.lee.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @ClassName BenchmarkPoint
 * @Description TODO
 * @Author Lee
 * @Date 2020/1/6 17:41
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BenchmarkPoint {
    private int id;
    private String startingPointNumber;
    private String caseCause;
    private String caseCauseId;
    private String province;
    private String provinceId;
    private String number;
    private String minValues;
    private String maxValues;
    private String endMinValues;
    private String endMaxValues;
    private String conditions;
    private String lxEnName;
    private String lxChiName;
    private String lxRely;
    private String descS;
    private String createTime;
    private String updateTime;
    private String auditStatus;
    private String createPerson;
    private String updatePerson;
    private String note;
    private String tip;
    private String provinceItem;
    private String nationItem;
    private String conditionsName;
    private String lxRelyName;


}
