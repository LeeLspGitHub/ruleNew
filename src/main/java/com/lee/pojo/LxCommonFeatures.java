package com.lee.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @ClassName FactFeatures
 * @Description TODO
 * @Author Lee
 * @Date 2019/12/24 23:29
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class LxCommonFeatures {
    private int id;
    private String enName;
    private String standardFeature;
    private String mappingFeature;
    private String valueType;
    private String lxType;
    private String type;
    private String province;
    private String provinceId;
    private String parentId;
    private String isMultiple;
    private String groupId;
    private String groupIdName;
    private String descS;
    private String createTime;
    private String updateTime;
    private String auditStatus;

    private String lxOrder;
    private String minValues;
    private String maxValues;
    private String standardValues;
    private String createPerson;
    private String updatePerson;
    private String note;
    private String tip;
    private String lxPlotType;
    private String lxRelyName;
    private String provinceItem;
    private String nationItem;
    private String legalConstraint;
}
