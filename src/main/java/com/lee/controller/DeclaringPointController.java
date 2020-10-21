package com.lee.controller;

import com.lee.pojo.DeclaringPoint;
import com.lee.service.DeclaringPointService;
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
 * @ClassName LxCommonFeaturesController
 * @Description TODO
 * @Author Lee
 * @Date 2020/01/03 10:16
 */
@Controller
@RequestMapping("/declaringpoint")
public class DeclaringPointController {


    @Autowired
    @Qualifier("DeclaringPointServiceImpl")
    private DeclaringPointService declaringPointService;

    @RequestMapping("/declaringPointPage")
    public String declaringPointPage(Model model) {
        return "declaringPoint";
    }

    /**
     * 规则列表（查询所有规则）
     * @param model
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/declaringPointList")
    @ResponseBody
    public Map<String, Object> declaringPointList(Model model, HttpServletResponse res, HttpServletRequest req) {

        String id = req.getParameter("id");
        String caseCause = req.getParameter("caseCause");
        String province = req.getParameter("province");
        int page =  Integer.parseInt(req.getParameter("page"));
        int pageSize = Integer.parseInt(req.getParameter("rows"));
        int pageNO = (page-1)*pageSize;
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> declaringPointCondition = new HashMap<String, Object>();
        declaringPointCondition.put("id",id);
        declaringPointCondition.put("caseCause",caseCause);
        declaringPointCondition.put("province",province);
        declaringPointCondition.put("pageNO",String.valueOf(pageNO));
        declaringPointCondition.put("pageSize",String.valueOf(pageSize));
        List<DeclaringPoint> list = declaringPointService.declaringPointList(declaringPointCondition);
        String rowsCount = String.valueOf(declaringPointService.declaringPointListCounts(declaringPointCondition));
        result.put("total",rowsCount);
        result.put("rows",list);
        return result;

    }
    /**
     * 保存事实特征
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/saveDeclaringPointRule")
    @ResponseBody
    public  Map<String, Object> saveDeclaringPointRule(HttpServletResponse res, HttpServletRequest req) {

        String caseCause = req.getParameter("caseCauseAdd");
        String province = req.getParameter("provinceAdd");
        String conditions = req.getParameter("conditionsAdd");

        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();

        param.put("caseCause",caseCause);
        param.put("province",province);
        param.put("conditions",conditions);

        int count = declaringPointService.saveDeclaringPointRule(param);
        if(count>0){
            result.put("msg","success");
        }else{
            result = null;
        }
        return result;
    }

    /**
     * 保存事实特征
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/deteleDeclaringPointRule")
    @ResponseBody
    public  Map<String, Object> deteleDeclaringPointRule(HttpServletResponse res, HttpServletRequest req) {

        String id = req.getParameter("declaringPointID");
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("id",id);

        try{
            int count = declaringPointService.deleteDeclaringPointRuleById(param);
            if(count>0){
                result.put("msg","success");
            }else{
                result = null;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 查询规则通过id
     * @param model
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/findOneDeclaringPointRuleById")
    @ResponseBody
    public Map<String, Object> findOneDeclaringPointRuleById(Model model, HttpServletResponse res, HttpServletRequest req) {

        String declaringPointID = req.getParameter("declaringPointID");

        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> declaringPointCondition = new HashMap<String, Object>();
        declaringPointCondition.put("id",declaringPointID);

        try{
            List<DeclaringPoint> list = declaringPointService.findOneDeclaringPointRuleById(declaringPointCondition);
            result.put("list",list);
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;

    }

    /**
     * 更新事实特征
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/updateDeclaringPointRule")
    @ResponseBody
    public  Map<String, Object> updateDeclaringPointRule(HttpServletResponse res, HttpServletRequest req) {

        String id = req.getParameter("idEdit");
        String caseCause = req.getParameter("caseCauseEdit");
        String province = req.getParameter("provinceEdit");
        String conditions = req.getParameter("conditionsEdit");

        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();

        param.put("id",id);
        param.put("caseCause",caseCause);
        param.put("province",province);
        param.put("conditions",conditions);

        try{
            int count = declaringPointService.updateDeclaringPointRule(param);
            if(count>0){
                result.put("msg","success");
            }else{
                result = null;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 查询一个事实特征根据最大id   添加默认
     * @param model
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/getAddDefaultDeclaringPointRule")
    @ResponseBody
    public Map<String, Object> getAddDefaultDeclaringPointRule(Model model, HttpServletResponse res, HttpServletRequest req) {

        Map<String, Object> result = new HashMap<String, Object>();
        try{
            List<DeclaringPoint> list = declaringPointService.getAddDefaultDeclaringPointRule();
            result.put("list",list);
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }


}
