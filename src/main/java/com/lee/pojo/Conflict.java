package com.lee.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @ClassName Conflict
 * @Description 冲突
 * @Author Lee
 * @Date 2020/3/12 17:41
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Conflict {

    private int id;
    private String caseCause;
    private String caseCauseId;
    private String province;
    private String provinceId;
    private String enName;
    private String conflictId;
    private String descS;
    private String createTime;
    private String updateTime;
    private String createPerson;
    private String updatePerson;

}
