package com.lee.controller;

import com.lee.pojo.StartingPoint;
import com.lee.pojo.User;
import com.lee.service.StartPointService;
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
 * @Description 起点刑控制
 * @Author Lee
 * @Date 2020/01/03 10:16
 */
@Controller
@RequestMapping("/startpoint")
@Transactional(rollbackFor = { Exception.class })
public class StartPointController {


    @Autowired
    @Qualifier("StartPointServiceImpl")
    private StartPointService startPointService;

    @RequestMapping("/startPointPage")
    public String startPointPage(Model model) {
        return "startPointList";
    }

    /**
     * 规则列表（查询所有规则）
     * @param model
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/startPointList")
    @ResponseBody
    public Map<String, Object> startPointList(Model model, HttpServletResponse res, HttpServletRequest req) {

        String id = req.getParameter("id");
        String descS = req.getParameter("descS");
        String caseCause = req.getParameter("caseCause");
        String province = req.getParameter("province");
        int page =  Integer.parseInt(req.getParameter("page"));
        int pageSize = Integer.parseInt(req.getParameter("rows"));
        int pageNO = (page-1)*pageSize;
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> startPointCondition = new HashMap<String, Object>();
        startPointCondition.put("id",id);
        startPointCondition.put("descS",descS);
        if(caseCause!=null && "100200".equals(caseCause) ){
            startPointCondition.put("caseCause","");
        }else{
            startPointCondition.put("caseCause",caseCause);
        }
        if(province!=null && "100100".equals(province) ){
            startPointCondition.put("province","");
        }else{
            startPointCondition.put("province",province);
        }
        startPointCondition.put("pageNO",String.valueOf(pageNO));
        startPointCondition.put("pageSize",String.valueOf(pageSize));
        List<StartingPoint> list = startPointService.startPointList(startPointCondition);
        String rowsCount = String.valueOf(startPointService.startPointListCounts(startPointCondition));
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
    @RequestMapping("/saveStartPointRule")
    @ResponseBody
    public  Map<String, Object> saveStartPointRule(HttpServletResponse res, HttpServletRequest req) {
        User user = (User)req.getSession().getAttribute("admin");
        String createPerson = user.getUsername();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String createTime = df.format(System.currentTimeMillis());
        String caseCause = req.getParameter("caseCauseAdd");
        String province = req.getParameter("provinceAdd");
        String caseCauseName = req.getParameter("caseCauseNameAdd");
        String provinceName = req.getParameter("provinceNameAdd");
        String number = req.getParameter("numberAdd");
        String conditions = req.getParameter("conditionsAdd");
        String conditionsName = req.getParameter("conditionsNameAdd");
        String minValue = req.getParameter("minValuesAdd");
        String maxValue = req.getParameter("maxValuesAdd");
        String provinceItem = req.getParameter("provinceItemAdd");
        String nationItem = req.getParameter("nationItemAdd");
        String descS = req.getParameter("descSAdd");
        String note = req.getParameter("noteAdd");
        String tip = req.getParameter("tipAdd");
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
        param.put("number",number);
        param.put("conditions",conditions);
        param.put("conditionsName",conditionsName);
        param.put("minValue",minValue);
        param.put("maxValue",maxValue);
        param.put("standardValue",standardValue);
        param.put("provinceItem",provinceItem);
        param.put("nationItem",nationItem);
        param.put("descS",descS);
        param.put("createTime",createTime);
        param.put("createPerson",createPerson);
        param.put("note",note);
        param.put("tip",tip);

        int count = startPointService.saveStartPointRule(param);
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
    @RequestMapping("/deteleStartPointRule")
    @ResponseBody
    public  Map<String, Object> deteleStartPointRule(HttpServletResponse res, HttpServletRequest req) {

        String id = req.getParameter("startPointID");
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("id",id);

        try{
            int count = startPointService.deteleStartPointRule(param);
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
    @RequestMapping("/findOneStartPointRuleById")
    @ResponseBody
    public Map<String, Object> findOneStartPointRuleById(Model model, HttpServletResponse res, HttpServletRequest req) {

        String startPointID = req.getParameter("startPointID");

        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> startPointCondition = new HashMap<String, Object>();
        startPointCondition.put("id",startPointID);

        try{
            List<StartingPoint> list = startPointService.findOneStartPointRuleById(startPointCondition);
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
    @RequestMapping("/updateStartPointRule")
    @ResponseBody
    public  Map<String, Object> updateStartPointRule(HttpServletResponse res, HttpServletRequest req) {
        User user = (User)req.getSession().getAttribute("admin");
        String updatePerson = user.getUsername();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String updateTime = df.format(System.currentTimeMillis());
        String caseCause = req.getParameter("caseCauseEdit");
        String province = req.getParameter("provinceEdit");
        String caseCauseName = req.getParameter("caseCauseNameEdit");
        String provinceName = req.getParameter("provinceNameEdit");
        String provinceItem = req.getParameter("provinceItemEdit");
        String nationItem = req.getParameter("nationItemEdit");
        String id = req.getParameter("idEdit");
        String number = req.getParameter("numberEdit");
        String conditions = req.getParameter("conditionsEdit");
        String conditionsName = req.getParameter("conditionsNameEdit");
        String descS = req.getParameter("descSEdit");
        String note = req.getParameter("noteEdit");
        String tip = req.getParameter("tipEdit");
        String minValue = req.getParameter("minValuesEdit");
        String maxValue = req.getParameter("maxValuesEdit");
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
        param.put("number",number);
        param.put("provinceItem",provinceItem);
        param.put("nationItem",nationItem);
        param.put("conditions",conditions);
        param.put("conditionsName",conditionsName);
        param.put("updateTime",updateTime);
        param.put("minValue",minValue);
        param.put("maxValue",maxValue);
        param.put("standardValue",standardValue);
        param.put("descS",descS);
        param.put("updatePerson",updatePerson);
        param.put("note",note);
        param.put("tip",tip);

        try{
            int count = startPointService.updateStartPointRule(param);
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
    @RequestMapping("/getAddDefaultStartPointRule")
    @ResponseBody
    public Map<String, Object> getAddDefaultStartPointRule(Model model, HttpServletResponse res, HttpServletRequest req) {

        Map<String, Object> result = new HashMap<String, Object>();
        try{
            List<StartingPoint> list = startPointService.getAddDefaultStartPointRule();
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
    @RequestMapping("/getAddMaxLxOrderStartPointRule")
    @ResponseBody
    public Map<String, Object> getAddMaxLxOrderStartPointRule(Model model, HttpServletResponse res, HttpServletRequest req) {


        String caseCause = req.getParameter("caseCause");
        String province = req.getParameter("province");
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> maxOrderCondition = new HashMap<String, Object>();
        maxOrderCondition.put("caseCause",caseCause);
        maxOrderCondition.put("province",province);
        try{
            List<StartingPoint> list = startPointService.getAddMaxLxOrderStartPointRule(maxOrderCondition);
            StartingPoint startingPoint = list.get(0);

            result.put("list",list);

        }catch (Exception e){
            e.printStackTrace();
        }
        return result;

    }

    public Map<String, Object> getAddMaxLxOrderStartPointRule5(Model model, HttpServletResponse res, HttpServletRequest req) {


        String caseCause = req.getParameter("caseCause");
        String province = req.getParameter("province");
        Map<String, Object> result = new HashMap<String, Object>();

        return result;

    }


}
