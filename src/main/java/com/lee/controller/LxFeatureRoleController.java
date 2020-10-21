package com.lee.controller;

import com.lee.pojo.LxFeaturesRole;
import com.lee.pojo.User;
import com.lee.service.LxFeaturesRoleService;
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
 * @ClassName LxFeatureRoleController
 * @Author Lee
 * @Date 2020/01/03 10:16
 */
@Controller
@RequestMapping("/lxfeaturesrole")
@Transactional(rollbackFor = { Exception.class })
public class LxFeatureRoleController {


    @Autowired
    @Qualifier("LxFeaturesRoleServiceImpl")
    private LxFeaturesRoleService LxFeaturesRoleService;

    @RequestMapping("/lxFeaturesRolePage")
    public String lxFeatureRolePage(Model model) {
        return "lxFeaturesRole";
    }

     /**
     * 规则列表（查询所有规则）
     * @param model
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/lxFeaturesRoleList")
    @ResponseBody
    public Map<String, Object> lxFeaturesRoleList(Model model, HttpServletResponse res, HttpServletRequest req) {

        String id = req.getParameter("id");
        String caseCause = req.getParameter("caseCause");
        String province = req.getParameter("province");
        int page =  Integer.parseInt(req.getParameter("page"));
        int pageSize = Integer.parseInt(req.getParameter("rows"));
        int pageNO = (page-1)*pageSize;
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> LxFeaturesRoleCondition = new HashMap<String, Object>();
        LxFeaturesRoleCondition.put("id",id);
        if(caseCause!=null && "100200".equals(caseCause) ){
            LxFeaturesRoleCondition.put("caseCause","");
        }else{
            LxFeaturesRoleCondition.put("caseCause",caseCause);
        }
        if(province!=null && "100100".equals(province) ){
            LxFeaturesRoleCondition.put("province","");
        }else{
            LxFeaturesRoleCondition.put("province",province);
        }
        LxFeaturesRoleCondition.put("pageNO",String.valueOf(pageNO));
        LxFeaturesRoleCondition.put("pageSize",String.valueOf(pageSize));
        List<LxFeaturesRole> list = LxFeaturesRoleService.lxFeaturesRoleList(LxFeaturesRoleCondition);
        String rowsCount = String.valueOf(LxFeaturesRoleService.lxFeaturesRoleListCounts(LxFeaturesRoleCondition));
        result.put("total",rowsCount);
        result.put("rows",list);
        return result;

    }
    /**
     * 保存条件限制
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/saveLxFeaturesRole")
    @ResponseBody
    public  Map<String, Object> saveLxFeaturesRole(HttpServletResponse res, HttpServletRequest req) {
        User user = (User)req.getSession().getAttribute("admin");
        String createPerson = user.getUsername();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String createTime = df.format(System.currentTimeMillis());
        String caseCause = req.getParameter("caseCauseAdd");
        String province = req.getParameter("provinceAdd");
        String caseCauseName = req.getParameter("caseCauseNameAdd");
        String provinceName = req.getParameter("provinceNameAdd");
        String upperLimit = req.getParameter("upperLimitAdd");
        String lowerLimit = req.getParameter("lowerLimitAdd");
        String lxType = req.getParameter("lxTypeAdd");
        String conditions = req.getParameter("conditionsAdd");
        String conditionsName = req.getParameter("conditionsNameAdd");
        String descS = req.getParameter("descSAdd");
        String note = req.getParameter("noteAdd");

        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();

        param.put("caseCause",caseCauseName);
        param.put("province",provinceName);
        param.put("caseCauseId",caseCause);
        param.put("provinceId",province);
        param.put("upperLimit",upperLimit);
        param.put("lowerLimit",lowerLimit);
        param.put("lxType",lxType);
        param.put("conditions",conditions);
        param.put("conditionsName",conditionsName);
        param.put("descS",descS);
        param.put("note",note);
        param.put("createTime",createTime);
        param.put("createPerson",createPerson);

        int count = LxFeaturesRoleService.saveLxFeaturesRole(param);
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
    @RequestMapping("/deleteLxFeatureRoleById")
    @ResponseBody
    public  Map<String, Object> deleteLxFeatureRoleById(HttpServletResponse res, HttpServletRequest req) {

        String id = req.getParameter("lxFeatureRoleID");
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("id",id);

        try{
            int count = LxFeaturesRoleService.deleteLxFeaturesRoleById(param);
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
    @RequestMapping("/findOneLxFeatureRoleById")
    @ResponseBody
    public Map<String, Object> findOneLxFeatureRoleById(Model model, HttpServletResponse res, HttpServletRequest req) {

        String lxFeatureRoleID = req.getParameter("lxFeatureRoleID");
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> lxFeatureRoleCondition = new HashMap<String, Object>();
        lxFeatureRoleCondition.put("id",lxFeatureRoleID);

        try{
            List<LxFeaturesRole> list = LxFeaturesRoleService.findOneLxFeatureRoleById(lxFeatureRoleCondition);
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
    @RequestMapping("/updateLxFeatureRole")
    @ResponseBody
    public  Map<String, Object> updateLxFeatureRole(HttpServletResponse res, HttpServletRequest req) {
        User user = (User)req.getSession().getAttribute("admin");
        String updatePerson = user.getUsername();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String updateTime = df.format(System.currentTimeMillis());
        String caseCause = req.getParameter("caseCauseEdit");
        String province = req.getParameter("provinceEdit");
        String caseCauseName = req.getParameter("caseCauseNameEdit");
        String provinceName = req.getParameter("provinceNameEdit");
        String lowerLimit = req.getParameter("lowerLimitEdit");
        String upperLimit = req.getParameter("upperLimitEdit");
        String id = req.getParameter("idEdit");
        String lxType = req.getParameter("lxTypeEdit");
        String conditions = req.getParameter("conditionsEdit");
        String conditionsName = req.getParameter("conditionsNameEdit");
        String descS = req.getParameter("descSEdit");
        String note = req.getParameter("noteEdit");
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();

        param.put("caseCause",caseCauseName);
        param.put("province",provinceName);
        param.put("caseCauseId",caseCause);
        param.put("provinceId",province);
        param.put("id",id);
        param.put("lxType",lxType);
        param.put("lowerLimit",lowerLimit);
        param.put("upperLimit",upperLimit);
        param.put("conditions",conditions);
        param.put("conditionsName",conditionsName);
        param.put("descS",descS);
        param.put("updateTime",updateTime);
        param.put("updatePerson",updatePerson);
        param.put("note",note);
        try{
            int count = LxFeaturesRoleService.updateLxFeatureRole(param);
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

}
