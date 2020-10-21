package com.lee.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @ClassName Rules
 * @Description TODO
 * @Author Lee
 * @Date 2019/12/17 9:46
 */

public class Rules {
    private int ruleID;
    private String ruleName;
    private int ruleCounts;
    private String detail;

    public int getRuleID() {
        return ruleID;
    }

    public void setRuleID(int ruleID) {
        this.ruleID = ruleID;
    }

    public String getRuleName() {
        return ruleName;
    }

    public void setRuleName(String ruleName) {
        this.ruleName = ruleName;
    }

    public int getRuleCounts() {
        return ruleCounts;
    }

    public void setRuleCounts(int ruleCounts) {
        this.ruleCounts = ruleCounts;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    @Override
    public String toString() {
        return "Rules{" +
                "ruleID=" + ruleID +
                ", ruleName='" + ruleName + '\'' +
                ", ruleCounts=" + ruleCounts +
                ", detail='" + detail + '\'' +
                '}';
    }
}
