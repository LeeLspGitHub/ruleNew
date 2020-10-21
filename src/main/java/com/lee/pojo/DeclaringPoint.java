package com.lee.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @ClassName DeclaringPoint
 * @Description TODO
 * @Author Lee
 * @Date 2020/1/6 17:42
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DeclaringPoint {
    private int id;
    private String caseCause;
    private String province;
    private String conditions;
}
