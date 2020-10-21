package com.lee.controller;

import com.lee.pojo.BenchmarkPoint;
import com.lee.pojo.User;
import com.lee.service.BenchmarkPointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName LxCommonFeaturesController
 * @Description 基准刑控制
 * @Author Lee
 * @Date 2020/01/03 10:16
 */
@Controller
@RequestMapping("/benchmarkpoint")
@Transactional(rollbackFor = { Exception.class })
public class BenchmarkPointController {


    @Autowired
    @Qualifier("BenchmarkPointServiceImpl")
    private BenchmarkPointService benchmarkPointService;

    @RequestMapping("/benchMarkPointPage")
    public String benchMarkPointPage(Model model) {
        return "benchMarkPoint";
    }

    /**
     * 规则列表（查询所有规则）
     * @param model
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/benchmarkPointList")
    @ResponseBody
    public Map<String, Object> benchmarkPointList(Model model, HttpServletResponse res, HttpServletRequest req) {

        String id = req.getParameter("id");
        String caseCause = req.getParameter("caseCause");
        String province = req.getParameter("province");
        String lxEnName = req.getParameter("lxEnName");
        String lxChiName = req.getParameter("lxChiName");
        int page =  Integer.parseInt(req.getParameter("page"));
        int pageSize = Integer.parseInt(req.getParameter("rows"));
        int pageNO = (page-1)*pageSize;
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> benchmarkPointCondition = new HashMap<String, Object>();
        benchmarkPointCondition.put("id",id);
        if(caseCause!=null && "100200".equals(caseCause) ){
            benchmarkPointCondition.put("caseCause","");
        }else{
            benchmarkPointCondition.put("caseCause",caseCause);
        }
        if(province!=null && "100100".equals(province) ){
            benchmarkPointCondition.put("province","");
        }else{
            benchmarkPointCondition.put("province",province);
        }
        benchmarkPointCondition.put("lxEnName",lxEnName);
        benchmarkPointCondition.put("lxChiName",lxChiName);
        benchmarkPointCondition.put("pageNO",String.valueOf(pageNO));
        benchmarkPointCondition.put("pageSize",String.valueOf(pageSize));
        List<BenchmarkPoint> list = benchmarkPointService.benchmarkPointList(benchmarkPointCondition);
        String rowsCount = String.valueOf(benchmarkPointService.benchmarkPointListCounts(benchmarkPointCondition));
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
    @RequestMapping("/saveBenchmarkPointRule")
    @ResponseBody
    public  Map<String, Object> saveBenchmarkPointRule(HttpServletResponse res, HttpServletRequest req) {
        User user = (User)req.getSession().getAttribute("admin");
        String createPerson = user.getUsername();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String createTime = df.format(System.currentTimeMillis());
        String caseCause = req.getParameter("caseCauseAdd");
        String province = req.getParameter("provinceAdd");
        String caseCauseName = req.getParameter("caseCauseNameAdd");
        String provinceName = req.getParameter("provinceNameAdd");
        String startingPoint = req.getParameter("startingPointNumberAdd");
        String number = req.getParameter("numberAdd");
        String minValue = req.getParameter("minValuesAdd");
        String maxValue = req.getParameter("maxValuesAdd");
        String endMinValues = req.getParameter("endMinValuesAdd");
        String endMaxValues = req.getParameter("endMaxValuesAdd");
        String conditions = req.getParameter("conditionsAdd");
        String conditionsName = req.getParameter("conditionsNameAdd");
        String lxEnName = req.getParameter("lxEnNameAdd");
        String lxChiName = req.getParameter("lxChiNameAdd");
        String lxRely = req.getParameter("lxRelyAdd");
        String lxRelyName = req.getParameter("lxRelyNameAdd");
        String descS = req.getParameter("descSAdd");
        String note = req.getParameter("noteAdd");
        String tip = req.getParameter("tipAdd");
        String provinceItem = req.getParameter("provinceItemAdd");
        String nationItem = req.getParameter("nationItemAdd");
        String standardValue= "";
        if(minValue!=null && maxValue!=null && minValue!="" && maxValue!=""){
            standardValue = String.format("%.2f",(Double.parseDouble(minValue)+Double.parseDouble(maxValue))/2);
        }
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();

        param.put("caseCause",caseCauseName);
        param.put("province",provinceName);
        param.put("caseCauseId",caseCause);
        param.put("provinceId",province);
        param.put("startingPoint",startingPoint);
        param.put("number",number);
        param.put("minValues",minValue);
        param.put("maxValues",maxValue);
        param.put("standardValue",standardValue);
        param.put("endMinValues",endMinValues);
        param.put("endMaxValues",endMaxValues);
        param.put("conditions",conditions);
        param.put("conditionsName",conditionsName);
        param.put("lxEnName",lxEnName);
        param.put("lxChiName",lxChiName);
        param.put("lxRely",lxRely);
        param.put("lxRelyName",lxRelyName);
        param.put("descS",descS);
        param.put("createTime",createTime);
        param.put("createPerson",createPerson);
        param.put("note",note);
        param.put("tip",tip);
        param.put("provinceItem",provinceItem);
        param.put("nationItem",nationItem);
        int count = benchmarkPointService.saveBenchmarkPointRule(param);
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
    @RequestMapping("/deteleBenchMarkPointRule")
    @ResponseBody
    public  Map<String, Object> deteleStartPointRule(HttpServletResponse res, HttpServletRequest req) {

        String id = req.getParameter("benchMarkPointID");
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("id",id);

        try{
            int count = benchmarkPointService.deleteBenchmarkPointRuleById(param);
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
    @RequestMapping("/findOneBenchMarkPointRuleById")
    @ResponseBody
    public Map<String, Object> findOneBenchMarkPointRuleById(Model model, HttpServletResponse res, HttpServletRequest req) {

        String benchMarkPointID = req.getParameter("benchMarkPointID");

        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> startPointCondition = new HashMap<String, Object>();
        startPointCondition.put("id",benchMarkPointID);

        try{
            List<BenchmarkPoint> list = benchmarkPointService.findOneBenchmarkPointRuleById(startPointCondition);
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
    @RequestMapping("/updateBenchmarkPointRule")
    @ResponseBody
    public  Map<String, Object> updateBenchmarkPointRule(HttpServletResponse res, HttpServletRequest req) {
        User user = (User)req.getSession().getAttribute("admin");
        String updatePerson = user.getUsername();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String updateTime = df.format(System.currentTimeMillis());
        String caseCause = req.getParameter("caseCauseEdit");
        String province = req.getParameter("provinceEdit");
        String caseCauseName = req.getParameter("caseCauseNameEdit");
        String provinceName = req.getParameter("provinceNameEdit");
        String id = req.getParameter("idEdit");
        String startingPointNumber = req.getParameter("startingPointNumberEdit");
        String number = req.getParameter("numberEdit");
        String minValue = req.getParameter("minValuesEdit");
        String maxValue = req.getParameter("maxValuesEdit");
        String endMinValues = req.getParameter("endMinValuesEdit");
        String endMaxValues = req.getParameter("endMaxValuesEdit");
        String conditions = req.getParameter("conditionsEdit");
        String conditionsName = req.getParameter("conditionsNameEdit");
        String lxEnName = req.getParameter("lxEnNameEdit");
        String lxChiName = req.getParameter("lxChiNameEdit");
        String lxRely = req.getParameter("lxRelyEdit");
        String lxRelyName = req.getParameter("lxRelyNameEdit");
        String descS = req.getParameter("descSEdit");
        String note = req.getParameter("noteEdit");
        String tip = req.getParameter("tipEdit");
        String provinceItem = req.getParameter("provinceItemEdit");
        String nationItem = req.getParameter("nationItemEdit");
        String standardValue= "";
        if(minValue!=null && maxValue!=null && minValue!="" && maxValue!=""){
            standardValue = String.format("%.2f",(Double.parseDouble(minValue)+Double.parseDouble(maxValue))/2);
        }
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();

        param.put("caseCause",caseCauseName);
        param.put("province",provinceName);
        param.put("caseCauseId",caseCause);
        param.put("provinceId",province);
        param.put("id",id);
        param.put("startingPointNumber",startingPointNumber);
        param.put("number",number);
        param.put("minValues",minValue);
        param.put("maxValues",maxValue);
        param.put("standardValue",standardValue);
        param.put("endMinValues",endMinValues);
        param.put("endMaxValues",endMaxValues);
        param.put("conditions",conditions);
        param.put("conditionsName",conditionsName);
        param.put("lxEnName",lxEnName);
        param.put("lxChiName",lxChiName);
        param.put("lxRely",lxRely);
        param.put("lxRelyName",lxRelyName);
        param.put("descS",descS);
        param.put("updateTime",updateTime);
        param.put("updatePerson",updatePerson);
        param.put("note",note);
        param.put("tip",tip);
        param.put("provinceItem",provinceItem);
        param.put("nationItem",nationItem);

        try{
            int count = benchmarkPointService.updateBenchmarkPointRule(param);
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
    @RequestMapping("/getAddDefaultBenchmarkPointRule")
    @ResponseBody
    public Map<String, Object> getAddDefaultBenchmarkPointRule(Model model, HttpServletResponse res, HttpServletRequest req) {

        Map<String, Object> result = new HashMap<String, Object>();
        try{
            List<BenchmarkPoint> list = benchmarkPointService.getAddDefaultBenchmarkPointRule();
            result.put("list",list);
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
    @RequestMapping("/getAddMaxLxOrderBenchmarkPointRule")
    @ResponseBody
    public Map<String, Object> getAddMaxLxOrderBenchmarkPointRule(Model model, HttpServletResponse res, HttpServletRequest req) {


        String caseCause = req.getParameter("caseCause");
        String province = req.getParameter("province");
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> maxOrderCondition = new HashMap<String, Object>();
        maxOrderCondition.put("caseCause",caseCause);
        maxOrderCondition.put("province",province);
        try{
            List<BenchmarkPoint> list = benchmarkPointService.getAddMaxLxOrderBenchmarkPointRule(maxOrderCondition);
            BenchmarkPoint benchmarkPoint = list.get(0);
            if(benchmarkPoint != null){
                String fforder = benchmarkPoint.getNumber();
                if(fforder!=null && !"".equals(fforder)){
                    benchmarkPoint.setNumber(String.valueOf(Integer.parseInt(fforder)+1));
                }
            }
            result.put("list",list);

        }catch (Exception e){
            e.printStackTrace();
        }
        return result;

    }

}
