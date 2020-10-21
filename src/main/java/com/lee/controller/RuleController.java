package com.lee.controller;

import com.lee.pojo.Rules;
import com.lee.service.RuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName RuleController
 * @Description TODO
 * @Author Lee
 * @Date 2019/12/17 9:41
 */
@Controller
@RequestMapping("/rule")
public class RuleController {

    @Autowired
    @Qualifier("RuleServiceImpl")
    private RuleService ruleService;

    @RequestMapping("/rulePage")
    public String rulePage(Model model) {
        return "ruleList";
    }

    /**
     * 规则列表（查询所有规则）
     * @param model
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/ruleList")
    @ResponseBody
    public  Map<String, Object> ruleList(Model model,HttpServletResponse res, HttpServletRequest req) {

        String ruleID = req.getParameter("ruleID");
        int page =  Integer.parseInt(req.getParameter("page"));
        int pageSize = Integer.parseInt(req.getParameter("rows"));
        int pageNO = (page-1)*pageSize;
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> searchCondition = new HashMap<String, Object>();
        searchCondition.put("ruleID",ruleID);
        searchCondition.put("pageNO",String.valueOf(pageNO));
        searchCondition.put("pageSize",String.valueOf(pageSize));
        List<Rules> list = ruleService.ruleList(searchCondition);
        String rowsCount = String.valueOf(ruleService.ruleListCounts(searchCondition));
        result.put("total",rowsCount);
        result.put("rows",list);
        return result;

    }

    /**
     * 新增规则
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/saveRule")
    @ResponseBody
    public  Map<String, Object> saveRule(HttpServletResponse res, HttpServletRequest req) {

        String ruleName = req.getParameter("ruleName");
        String ruleCounts = req.getParameter("ruleCounts");
        String detail = req.getParameter("detail");

        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();

        param.put("ruleName",ruleName);
        param.put("ruleCounts",ruleCounts);
        param.put("detail",detail);
        int count = ruleService.saveRule(param);
        if(count>0){
            result.put("msg","success");
        }else{
            result.put("msg","fail");
        }
        return result;

    }

    /**
     * 删除规则根据id
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/deleteRule")
    @ResponseBody
    public  Map<String, Object> deleteRule(HttpServletResponse res, HttpServletRequest req) {

        String ruleID = req.getParameter("ruleID");
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("ruleID",ruleID);

        int count = ruleService.deleteRuleById(param);
        if(count>0){
            result.put("msg","success");
        }else{
            result.put("msg","fail");
        }
        return result;

    }

    /**
     * 查询一个规则根据id
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/findOneRuleById")
    @ResponseBody
    public  Map<String, Object> findOneRuleById(HttpServletResponse res, HttpServletRequest req) {

        String ruleID = req.getParameter("ruleID");
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("ruleID",ruleID);

        List<Rules> list = ruleService.findOneRuleById(param);

        result.put("list",list);
        result.put("msg","success");

        return result;

    }

    /**
     * 更新规则
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/updateRule")
    @ResponseBody
    public  Map<String, Object> updateRule(HttpServletResponse res, HttpServletRequest req) {
        String ruleID = req.getParameter("ruleID");
        String ruleName = req.getParameter("ruleName");
        String ruleCounts = req.getParameter("ruleCounts");
        String detail = req.getParameter("detail");

        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("ruleID",ruleID);
        param.put("ruleName",ruleName);
        param.put("ruleCounts",ruleCounts);
        param.put("detail",detail);
        int count = ruleService.updateRuleById(param);
        if(count>0){
            result.put("msg","success");
        }else{
            result.put("msg","fail");
        }
        return result;

    }

}
