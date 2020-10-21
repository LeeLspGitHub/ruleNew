package com.lee.controller;

import com.lee.pojo.*;
import com.lee.service.LxCommonFeaturesService;
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
 * @Description 通用情节控制
 * @Author Lee
 * @Date 2020/01/03 10:16
 */
@Controller
@RequestMapping("/commonfeatures")
@Transactional(rollbackFor = { Exception.class })
public class LxCommonFeaturesController {


    @Autowired
    @Qualifier("LxCommonFeaturesServiceImpl")
    private LxCommonFeaturesService lxCommonFeaturesService;

    @RequestMapping("/lxCommonFeatures")
    public String lxCommonFeatures(Model model) {
        return "lxCommonFeaturesList";
    }

    @RequestMapping("/lxCommonFeatureReference")
    public String lxCommonFeatureReference(Model model) {
        return "lxCommonFeatureReferenceList";
    }

    /**
     * 规则列表（查询所有规则）
     * @param model
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/lxCommonFeaturesList")
    @ResponseBody
    public Map<String, Object> lxCommonFeaturesList(Model model, HttpServletResponse res, HttpServletRequest req) {

        String id = req.getParameter("id");
        String enName = req.getParameter("enName");
        String standardFeature = req.getParameter("standardFeature");
        String province = req.getParameter("province");
        int page =  Integer.parseInt(req.getParameter("page"));
        int pageSize = Integer.parseInt(req.getParameter("rows"));
        int pageNO = (page-1)*pageSize;
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> lxCommonCondition = new HashMap<String, Object>();
        lxCommonCondition.put("id",id);
        lxCommonCondition.put("enName",enName);
        lxCommonCondition.put("standardFeature",standardFeature);
        if(province!=null && "100100".equals(province) ){
            lxCommonCondition.put("province","");
        }else{
            lxCommonCondition.put("province",province);
        }
        lxCommonCondition.put("pageNO",String.valueOf(pageNO));
        lxCommonCondition.put("pageSize",String.valueOf(pageSize));
        List<LxCommonFeatures> list = lxCommonFeaturesService.lxCommonFeaturesList(lxCommonCondition);
        String rowsCount = String.valueOf(lxCommonFeaturesService.lxCommonFeaturesListCounts(lxCommonCondition));
        result.put("total",rowsCount);
        result.put("rows",list);
        return result;

    }
    /**
     * 事实特征Reference
     * @param model
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/lxCommonFeaturesReferenceList")
    @ResponseBody
    public Map<String, Object> lxCommonFeaturesReferenceList(Model model, HttpServletResponse res, HttpServletRequest req) {

        String id = req.getParameter("id");
        String enName = req.getParameter("enName");
        String province = req.getParameter("province");
        int page =  Integer.parseInt(req.getParameter("page"));
        int pageSize = Integer.parseInt(req.getParameter("rows"));
        int pageNO = (page-1)*pageSize;
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> lxCommonReferenceCondition = new HashMap<String, Object>();
        lxCommonReferenceCondition.put("id",id);
        lxCommonReferenceCondition.put("enName",enName);
        lxCommonReferenceCondition.put("province",province);
        lxCommonReferenceCondition.put("pageNO",String.valueOf(pageNO));
        lxCommonReferenceCondition.put("pageSize",String.valueOf(pageSize));
        List<LxCommonFeatureReference> list = lxCommonFeaturesService.lxCommonFeatureReferenceList(lxCommonReferenceCondition);
        String rowsCount = String.valueOf(lxCommonFeaturesService.lxCommonFeatureReferenceListCounts(lxCommonReferenceCondition));
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
    @RequestMapping("/saveLxCommonFeatures")
    @ResponseBody
    public  Map<String, Object> saveLxCommonFeatures(HttpServletResponse res, HttpServletRequest req) {
        User user = (User)req.getSession().getAttribute("admin");
        String createPerson = user.getUsername();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String createTime = df.format(System.currentTimeMillis());
        String province = req.getParameter("provinceAdd");
        String provinceName = req.getParameter("provinceNameAdd");
        String enName = req.getParameter("enNameAdd");
        String standardFeature = req.getParameter("standardFeatureAdd");
        String mappingFeature = req.getParameter("mappingFeatureAdd");
        String valueType = req.getParameter("valueTypeAdd");
        String lxType = req.getParameter("lxTypeAdd");
        String lxPlotType = req.getParameter("lxPlotTypeAdd");
        String type = req.getParameter("typeAdd");
        String lxOrder = req.getParameter("lxOrderAdd");
        String parentId = req.getParameter("parentIdAdd");
        String isMultiple = req.getParameter("isMultipleAdd");
        String groupId = req.getParameter("groupIdAdd");
        String groupIdName = req.getParameter("groupIdNameAdd");
        String descS = req.getParameter("descSAdd");
        String note = req.getParameter("noteAdd");
        String tip = req.getParameter("tipAdd");
        String provinceItem = req.getParameter("provinceItemAdd");
        String nationItem = req.getParameter("nationItemAdd");
        String legalConstraint = req.getParameter("legalConstraintAdd");
        String lxOrderAdd = req.getParameter("lxOrderAdd");
        String minValue = req.getParameter("minValuesAdd");
        String maxValue = req.getParameter("maxValuesAdd");
        String standardValue= "";
        if(minValue!=null && maxValue!=null && minValue!="" && maxValue!=""){
            standardValue = String.format("%.2f",(Double.parseDouble(minValue)+Double.parseDouble(maxValue))/2);
        }

        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();

        param.put("province",provinceName);
        param.put("provinceId",province);
        param.put("enName",enName);
        param.put("standardFeature",standardFeature);
        param.put("mappingFeature",mappingFeature);
        param.put("valueType",valueType);
        param.put("lxType",lxType);
        param.put("lxPlotType",lxPlotType);
        param.put("type",type);
        param.put("parentId",parentId);
        param.put("isMultiple",isMultiple);
        param.put("groupId",groupId);
        param.put("groupIdName",groupIdName);
        param.put("lxOrderAdd",lxOrderAdd);
        param.put("minValue",minValue);
        param.put("maxValue",maxValue);
        param.put("standardValue",standardValue);
        param.put("lxOrder",lxOrder);
        param.put("descS",descS);
        param.put("createTime",createTime);
        param.put("createPerson",createPerson);
        param.put("note",note);
        param.put("tip",tip);
        param.put("provinceItem",provinceItem);
        param.put("nationItem",nationItem);
        param.put("legalConstraint",legalConstraint);

        int count = lxCommonFeaturesService.saveLxCommonFeatures(param);
        int countReference = lxCommonFeaturesService.saveLxCommonFeaturesReference(param);
        if(count>0 && countReference>0){
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
    @RequestMapping("/deteleLxCommonFeature")
    @ResponseBody
    public  Map<String, Object> deteleLxCommonFeature(HttpServletResponse res, HttpServletRequest req) {

        String id = req.getParameter("lxCommonFeatureID");
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("id",id);

        try{
            int count = lxCommonFeaturesService.deleteLxCommonFeaturesById(param);
            int referencecount = lxCommonFeaturesService.deleteLxCommonFeatureReferenceById(param);
            if(count>0 && referencecount>0){
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
    @RequestMapping("/findOneLxCommonFeatureById")
    @ResponseBody
    public Map<String, Object> findOneLxCommonFeatureById(Model model, HttpServletResponse res, HttpServletRequest req) {

        String lxCommonId = req.getParameter("lxCommonFeatureID");

        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> lxCommonCondition = new HashMap<String, Object>();
        lxCommonCondition.put("id",lxCommonId);

        try{
            List<LxCommonFeatures> list = lxCommonFeaturesService.findOneLxCommonFeatureById(lxCommonCondition);
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
    @RequestMapping("/updateLxCommonFeatureById")
    @ResponseBody
    public  Map<String, Object> updateLxCommonFeatureById(HttpServletResponse res, HttpServletRequest req) {
        User user = (User)req.getSession().getAttribute("admin");
        String updatePerson = user.getUsername();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String updateTime = df.format(System.currentTimeMillis());
        String province = req.getParameter("provinceEdit");
        String provinceName = req.getParameter("provinceNameEdit");
        String id = req.getParameter("idEdit");
        String lxOrder = req.getParameter("lxOrderEdit");
        String enName = req.getParameter("enNameEdit");
        String standardFeature = req.getParameter("standardFeatureEdit");
        String mappingFeature = req.getParameter("mappingFeatureEdit");
        String valueType = req.getParameter("valueTypeEdit");
        String lxType = req.getParameter("lxTypeEdit");
        String lxPlotType = req.getParameter("lxPlotTypeEdit");
        String type = req.getParameter("typeEdit");
        String parentId = req.getParameter("parentIdEdit");
        String isMultiple = req.getParameter("isMultipleEdit");
        String groupId = req.getParameter("groupIdEdit");
        String groupIdName = req.getParameter("groupIdNameEdit");
        String descS = req.getParameter("descSEdit");
        String note = req.getParameter("noteEdit");
        String tip = req.getParameter("tipEdit");
        String minValue = req.getParameter("minValuesEdit");
        String maxValue = req.getParameter("maxValuesEdit");
        String provinceItem = req.getParameter("provinceItemEdit");
        String nationItem = req.getParameter("nationItemEdit");
        String legalConstraint = req.getParameter("legalConstraintEdit");
        String standardValue= "";
        if(minValue!=null && maxValue!=null && minValue!="" && maxValue!=""){
            standardValue = String.format("%.2f",(Double.parseDouble(minValue)+Double.parseDouble(maxValue))/2);
        }

        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();

        param.put("province",provinceName);
        param.put("provinceId",province);
        param.put("id",id);
        param.put("enName",enName);
        param.put("standardFeature",standardFeature);
        param.put("mappingFeature",mappingFeature);
        param.put("valueType",valueType);
        param.put("lxType",lxType);
        param.put("lxPlotType",lxPlotType);
        param.put("type",type);
        param.put("parentId",parentId);
        param.put("groupIdName",groupIdName);
        param.put("isMultiple",isMultiple);
        param.put("groupId",groupId);
        param.put("lxOrder",lxOrder);
        param.put("minValue",minValue);
        param.put("maxValue",maxValue);
        param.put("standardValue",standardValue);
        param.put("updateTime",updateTime);
        param.put("updatePerson",updatePerson);
        param.put("descS",descS);
        param.put("note",note);
        param.put("tip",tip);
        param.put("provinceItem",provinceItem);
        param.put("nationItem",nationItem);
        param.put("legalConstraint",legalConstraint);

        try{
            int count = lxCommonFeaturesService.updateLxCommonFeatureById(param);
            int referencecount = lxCommonFeaturesService.updateLxCommonFeatureReferenceById(param);
            if(count>0 && referencecount>0){
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
    @RequestMapping("/getAddDefaultLxCommonFeature")
    @ResponseBody
    public Map<String, Object> getAddDefaultLxCommonFeature(Model model, HttpServletResponse res, HttpServletRequest req) {


        Map<String, Object> result = new HashMap<String, Object>();
        try{
            List<LxCommonFeatures> list = lxCommonFeaturesService.getAddDefaultLxCommonFeature();
            result.put("list",list);
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;

    }
    /**
     * 判断英文名是否存在
     * @param model
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/isEnNameExist")
    @ResponseBody
    public Map<String, Object> isEnNameExist(Model model, HttpServletResponse res, HttpServletRequest req) {

        String enName = req.getParameter("enName");
        String province = req.getParameter("province");

        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> lxCommonCondition = new HashMap<String, Object>();
        lxCommonCondition.put("enName",enName);
        lxCommonCondition.put("province",province);
        try{
            List<LxCommonFeatures> list = lxCommonFeaturesService.isEnNameExist(lxCommonCondition);
            result.put("list",list);
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;

    }
    /**
     * 判断中文名是否存在
     * @param model
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/isChiNameExist")
    @ResponseBody
    public Map<String, Object> isChiNameExist(Model model, HttpServletResponse res, HttpServletRequest req) {

        String standardFeature = req.getParameter("standardFeature");
        String province = req.getParameter("province");
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> lxCommonCondition = new HashMap<String, Object>();
        lxCommonCondition.put("standardFeature",standardFeature);
        lxCommonCondition.put("province",province);
        try{
            List<LxCommonFeatures> list = lxCommonFeaturesService.isChiNameExist(lxCommonCondition);
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
    @RequestMapping("/getAddMaxLxOrderCommonFeature")
    @ResponseBody
    public Map<String, Object> getAddMaxLxOrderCommonFeature(Model model, HttpServletResponse res, HttpServletRequest req) {

        String caseCause = req.getParameter("caseCause");
        String province = req.getParameter("province");
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> maxOrderCondition = new HashMap<String, Object>();
        maxOrderCondition.put("province",province);
        maxOrderCondition.put("caseCause",caseCause);
        try{
            List<LxCommonFeatures> list = lxCommonFeaturesService.getAddMaxLxOrderCommonFeature(maxOrderCondition);
            LxCommonFeatures lxCommon = list.get(0);
            if(lxCommon != null){
                String fforder = lxCommon.getLxOrder();
                if(fforder!=null && !"".equals(fforder)){
                    lxCommon.setLxOrder(String.valueOf(Integer.parseInt(fforder)+1));
                }
            }
            result.put("list",list);

        }catch (Exception e){
            e.printStackTrace();
        }
        return result;

    }

    /**
     * 规则列表（查询所有规则）
     * @param model
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/lxPlotTypeList")
    @ResponseBody
    public Map<String, Object> mappingFeatureList(Model model, HttpServletResponse res, HttpServletRequest req) {

        int page =  Integer.parseInt(req.getParameter("page"));
        int pageSize = Integer.parseInt(req.getParameter("rows"));
        int pageNO = (page-1)*pageSize;

        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> factCondition = new HashMap<String, Object>();
        factCondition.put("pageNO",String.valueOf(pageNO));
        factCondition.put("pageSize",String.valueOf(pageSize));

        List<LxPlotType> list = lxCommonFeaturesService.lxPlotTypeList(factCondition);
        String rowsCount = String.valueOf(lxCommonFeaturesService.lxPlotTypeListCounts(factCondition));
        result.put("total",rowsCount);
        result.put("rows",list);
        return result;

    }

}
