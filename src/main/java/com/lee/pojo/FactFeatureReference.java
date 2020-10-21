package com.lee.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @ClassName FactFeatureReference
 * @Description TODO
 * @Author Lee
 * @Date 2019/12/24 23:30
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class FactFeatureReference {
    private int id;
    private String caseCause;
    private String province;
    private String enName;
    private String minValues;
    private String maxValues;
    private String standardValues;
    private String before;
    private String after;
    private String startingPointNumber;

}
