package com.lee.util;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

/**
 * @ClassName CalculateExpression
 * @Description TODO
 * @Author Lee
 * @Date 2020/3/11 9:53
 */
public class CalculateExpression {
    public static boolean run(String expression) {
        ScriptEngineManager scriptEngineManager = new ScriptEngineManager();
        ScriptEngine scriptEngine = scriptEngineManager.getEngineByName("nashorn");

        try {
            Boolean result = Boolean.valueOf(String.valueOf(scriptEngine.eval(expression)));
            return result;
        } catch (ScriptException e) {
            e.printStackTrace();
        }
        return false;
    }
}