package com.lee.controller;

import com.lee.pojo.*;
import com.lee.service.FactFeaturesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName FactFeaturesController
 * @Description 事实特征控制
 * @Author Lee
 * @Date 2019/12/25 8:52
 */
@Controller
@RequestMapping("/features")
@Transactional(rollbackFor = { Exception.class })
public class FactFeaturesController {

    @Autowired
    @Qualifier("FactFeaturesServiceImpl")
    private FactFeaturesService factFeaturesService;

    @RequestMapping("/factFeatures")
    public String factFeatures(Model model) {
        return "factFeaturesList";
    }

    @RequestMapping("/factFeatureReference")
    public String factFeatureReference(Model model) {
        return "factFeatureReferenceList";
    }

    /**
     * 规则列表（查询所有规则）
     * @param model
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/factFeaturesList")
    @ResponseBody
    public Map<String, Object> factFeaturesList(Model model, HttpServletResponse res, HttpServletRequest req) {

        int page =  Integer.parseInt(req.getParameter("page"));
        int pageSize = Integer.parseInt(req.getParameter("rows"));
        int pageNO = (page-1)*pageSize;
        String id = req.getParameter("id");
        String caseCause = req.getParameter("caseCause");
        String enName = req.getParameter("enName");
        String type = req.getParameter("type");
        String standardFeature = req.getParameter("standardFeature");
        String province = req.getParameter("province");
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> factCondition = new HashMap<String, Object>();
        factCondition.put("pageNO",String.valueOf(pageNO));
        factCondition.put("pageSize",String.valueOf(pageSize));
        factCondition.put("id",id);
        factCondition.put("enName",enName);
        factCondition.put("standardFeature",standardFeature);
        factCondition.put("type",type);
        if(caseCause!=null && "100200".equals(caseCause) ){
            factCondition.put("caseCause","");
        }else{
            factCondition.put("caseCause",caseCause);
        }
        if(province!=null && "100100".equals(province) ){
            factCondition.put("province","");
        }else{
            factCondition.put("province",province);
        }


        List<FactFeatures> list = factFeaturesService.factFeaturesList(factCondition);
        String rowsCount = String.valueOf(factFeaturesService.factFeaturesListCounts(factCondition));
        result.put("total",rowsCount);
        result.put("rows",list);
        return result;

    }
    /**
     * 规则列表（查询所有规则）
     * @param model
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/mappingFeatureList")
    @ResponseBody
    public Map<String, Object> mappingFeatureList(Model model, HttpServletResponse res, HttpServletRequest req) {

        int page =  Integer.parseInt(req.getParameter("page"));
        int pageSize = Integer.parseInt(req.getParameter("rows"));
        int pageNO = (page-1)*pageSize;
        String code = req.getParameter("code");
        String name = req.getParameter("name");
        String caseCause = req.getParameter("caseCause");

        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> factCondition = new HashMap<String, Object>();
        factCondition.put("pageNO",String.valueOf(pageNO));
        factCondition.put("pageSize",String.valueOf(pageSize));
        factCondition.put("code",code);
        factCondition.put("name",name);
        factCondition.put("caseCause",caseCause);

        List<MappingFeatures> list = factFeaturesService.mappingFeatureList(factCondition);
        String rowsCount = String.valueOf(factFeaturesService.mappingFeatureListCounts(factCondition));
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
    @RequestMapping("/saveFactFeatures")
    @ResponseBody
    public  Map<String, Object> saveFactFeatures(HttpServletResponse res, HttpServletRequest req) throws UnsupportedEncodingException {
        User user = (User)req.getSession().getAttribute("admin");
        String createPerson = user.getUsername();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String createTime = df.format(System.currentTimeMillis());
        String caseCause = req.getParameter("caseCauseAdd");
        String province = req.getParameter("provinceAdd");
        String caseCauseName = req.getParameter("caseCauseNameAdd");
        String provinceName = req.getParameter("provinceNameAdd");
        String enName = req.getParameter("enNameAdd");
        String standardFeature = req.getParameter("standardFeatureAdd");
        String mappingFeature = req.getParameter("mappingFeatureAdd");
        String mappingFeatureName = req.getParameter("mappingFeatureNameAdd");
        String valueType = req.getParameter("valueTypeAdd");
        String type = req.getParameter("typeAdd");
        String lxType = req.getParameter("lxTypeAdd");
        String lxPlotType = req.getParameter("lxPlotTypeAdd");
        String unit = req.getParameter("unitAdd");
        String lxOrder = req.getParameter("lxOrderAdd");
        String lxRely = req.getParameter("lxRelyAdd");
        String lxRelyName = req.getParameter("lxRelyNameAdd");
        String note = req.getParameter("noteAdd");
        String tip = req.getParameter("tipAdd");
        String parentId = req.getParameter("parentIdAdd");
        String groupIdName = req.getParameter("groupIdNameAdd");
        String isMultiple = req.getParameter("isMultipleAdd");
        String groupId = req.getParameter("groupIdAdd");
        String descS = req.getParameter("descSAdd");
        String startingPointNumber = req.getParameter("startingPointNumberAdd");
        String minValue = req.getParameter("minValuesAdd");
        String maxValue = req.getParameter("maxValuesAdd");
        String provinceItem = req.getParameter("provinceItemAdd");
        String nationItem = req.getParameter("nationItemAdd");
        String provinceCaseCauseItem = req.getParameter("provinceCaseCauseItemAdd");
        String adjustedMaxvalue = req.getParameter("adjustedMaxvalueAdd");
        String standardValue= "";
        if(minValue!=null && maxValue!=null && minValue!="" && maxValue!=""){
            standardValue = String.format("%.2f",(Double.parseDouble(minValue)+Double.parseDouble(maxValue))/2);
        }
        String conditions = enName+"*基准值";

        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("caseCause",caseCauseName);
        param.put("province",provinceName);
        param.put("caseCauseId",caseCause);
        param.put("provinceId",province);
        param.put("enName",enName);
        param.put("standardFeature",standardFeature);
        param.put("mappingFeature",mappingFeature);
        param.put("mappingFeatureName",mappingFeatureName);
        param.put("valueType",valueType);
        param.put("type",type);
        param.put("lxType",lxType);
        param.put("lxPlotType",lxPlotType);
        param.put("unit",unit);
        param.put("lxOrder",lxOrder);
        param.put("lxRely",lxRely);
        param.put("lxRelyName",lxRelyName);
        param.put("parentId",parentId);
        param.put("isMultiple",isMultiple);
        param.put("groupId",groupId);
        param.put("descS",descS);
        param.put("startingPointNumber",startingPointNumber);
        param.put("minValue",minValue);
        param.put("maxValue",maxValue);
        param.put("provinceItem",provinceItem);
        param.put("nationItem",nationItem);
        param.put("provinceCaseCauseItem",provinceCaseCauseItem);
        param.put("adjustedMaxvalue",adjustedMaxvalue);
        param.put("standardValue",standardValue);
        param.put("auditStatus","0");
        param.put("conditions",conditions);
        param.put("createTime",createTime);
        param.put("createPerson",createPerson);
        param.put("note",note);
        param.put("tip",tip);
        param.put("groupIdName",groupIdName);

        //这里要根据类型做判断 012 存前两个表 3存最后一个表
        if(type!=null &&!"".equals(type)&&"4".equals(type)){
            int lxCount = factFeaturesService.saveLxFeatures(param);
            int lxCountReference = factFeaturesService.saveLxFeatureReference(param);
            //int declaringpointconunt = factFeaturesService.saveDeclaringPointRule(param);
            if(lxCount>0 && lxCountReference>0 /*&& declaringpointconunt>0*/){
                result.put("msg","success");
            }else{
                result = null;
            }
        }else{
            int count = factFeaturesService.saveFactFeatures(param);
            int countReference = factFeaturesService.saveFactFeaturesReference(param);
            if(count>0 && countReference>0){
                result.put("msg","success");
            }else{
                result = null;
            }
        }
        return result;
    }

    /**
     * 保存事实特征
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/deteleFactFeature")
    @ResponseBody
    public  Map<String, Object> deteleFactFeature(HttpServletResponse res, HttpServletRequest req) {

        String id = req.getParameter("factFeatureID");
        String type = req.getParameter("type");
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("id",id);
        param.put("type",type);
        try{
            if(type!=null &&!"".equals(type)&&"4".equals(type)){
                int lxCount = factFeaturesService.deleteLxFeaturesById(param);
                int lxCountReference = factFeaturesService.deleteLxFeatureReferenceById(param);
                if(lxCount>0 && lxCountReference>0){
                    result.put("msg","success");
                }else{
                    result = null;
                }
            }else{
                int count = factFeaturesService.deleteFactFeaturesById(param);
                int countReference = factFeaturesService.deleteFactFeatureReferenceById(param);
                if(count>0 && countReference>0){
                    result.put("msg","success");
                }else{
                    result = null;
                }
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
    @RequestMapping("/findOneFeatureById")
    @ResponseBody
    public Map<String, Object> findOneFactFeatureById(Model model, HttpServletResponse res, HttpServletRequest req) {

        String id = req.getParameter("factFeatureID");
        String type = req.getParameter("type");
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> factCondition = new HashMap<String, Object>();
        factCondition.put("id",id);
        factCondition.put("type",type);
        try{
            if(type!=null&&!"".equals(type)&&"4".equals(type)){
                List<FactFeatures> list = factFeaturesService.findOnelxFeatureById(factCondition);
                result.put("list",list);
            }else{
                List<FactFeatures> list = factFeaturesService.findOneFactFeatureById(factCondition);
                result.put("list",list);
            }


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
    @RequestMapping("/updateFactFeatureById")
    @ResponseBody
    public  Map<String, Object> updateFactFeatureById(HttpServletResponse res, HttpServletRequest req) {
        User user = (User)req.getSession().getAttribute("admin");
        String updatePerson = user.getUsername();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String updateTime = df.format(System.currentTimeMillis());
        String caseCause = req.getParameter("caseCauseEdit");
        String province = req.getParameter("provinceEdit");
        String caseCauseName = req.getParameter("caseCauseNameEdit");
        String provinceName = req.getParameter("provinceNameEdit");
        String id = req.getParameter("idEdit");
        String enName = req.getParameter("enNameEdit");
        String standardFeature = req.getParameter("standardFeatureEdit");
        String mappingFeature = req.getParameter("mappingFeatureEdit");
        String mappingFeatureName = req.getParameter("mappingFeatureNameEdit");
        String valueType = req.getParameter("valueTypeEdit");
        String type = req.getParameter("typeEdit");
        String lxType = req.getParameter("lxTypeEdit");
        String lxPlotType = req.getParameter("lxPlotTypeEdit");
        String unit = req.getParameter("unitEdit");
        String lxOrder = req.getParameter("lxOrderEdit");
        String lxRely = req.getParameter("lxRelyEdit");
        String lxRelyName = req.getParameter("lxRelyNameEdit");
        String parentId = req.getParameter("parentIdEdit");
        String isMultiple = req.getParameter("isMultipleEdit");
        String groupId = req.getParameter("groupIdEdit");
        String groupIdName = req.getParameter("groupIdNameEdit");
        String descS = req.getParameter("descSEdit");
        String startingPointNumber = req.getParameter("startingPointNumberEdit");
        String note = req.getParameter("noteEdit");
        String tip = req.getParameter("tipEdit");
        String provinceItem = req.getParameter("provinceItemEdit");
        String nationItem = req.getParameter("nationItemEdit");
        String provinceCaseCauseItem = req.getParameter("provinceCaseCauseItemEdit");
        String adjustedMaxvalue = req.getParameter("adjustedMaxvalueEdit");
        String minValue = req.getParameter("minValuesEdit");
        String maxValue = req.getParameter("maxValuesEdit");
        String standardValue= "";
        if(minValue!=null && maxValue!=null && minValue!="" && maxValue!=""){
            standardValue = String.format("%.2f",(Double.parseDouble(minValue)+Double.parseDouble(maxValue))/2);
        }
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("caseCauseId",caseCause);
        param.put("provinceId",province);
        param.put("caseCause",caseCauseName);
        param.put("province",provinceName);
        param.put("id",id);
        param.put("enName",enName);
        param.put("standardFeature",standardFeature);
        param.put("mappingFeature",mappingFeature);
        param.put("mappingFeatureName",mappingFeatureName);
        param.put("valueType",valueType);
        param.put("type",type);
        param.put("lxType",lxType);
        param.put("lxPlotType",lxPlotType);
        param.put("unit",unit);
        param.put("lxOrder",lxOrder);
        param.put("lxRely",lxRely);
        param.put("lxRelyName",lxRelyName);
        param.put("parentId",parentId);
        param.put("isMultiple",isMultiple);
        param.put("groupId",groupId);
        param.put("groupIdName",groupIdName);
        param.put("descS",descS);
        param.put("startingPointNumber",startingPointNumber);
        param.put("minValue",minValue);
        param.put("maxValue",maxValue);
        param.put("provinceItem",provinceItem);
        param.put("nationItem",nationItem);
        param.put("provinceCaseCauseItem",provinceCaseCauseItem);
        param.put("adjustedMaxvalue",adjustedMaxvalue);
        param.put("standardValue",standardValue);
        param.put("updateTime",updateTime);
        param.put("updatePerson",updatePerson);

        param.put("note",note);
        param.put("tip",tip);
        try{
            if(type!=null &&!"".equals(type)&&"4".equals(type)){
                int lxCount = factFeaturesService.updateLxFeatureById(param);
                int lxCountReference = factFeaturesService.updateLxFeatureReferenceById(param);
                if(lxCount>0 && lxCountReference>0){
                    result.put("msg","success");
                }else{
                    result = null;
                }
            }else{
                int count = factFeaturesService.updateFactFeatureById(param);
                int countReference = factFeaturesService.updateFactFeatureReferenceById(param);
                if(count>0 && countReference>0 ){
                    result.put("msg","success");
                }else{
                    result = null;
                }
            }


        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }


    /**
     * 事实特征Reference
     * @param model
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/factFeatureReferenceList")
    @ResponseBody
    public Map<String, Object> factFeatureReferenceList(Model model, HttpServletResponse res, HttpServletRequest req) {

        String id = req.getParameter("id");
        String caseCause = req.getParameter("caseCause");
        String enName = req.getParameter("enName");
        String province = req.getParameter("province");
        int page =  Integer.parseInt(req.getParameter("page"));
        int pageSize = Integer.parseInt(req.getParameter("rows"));
        int pageNO = (page-1)*pageSize;
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> factCondition = new HashMap<String, Object>();
        factCondition.put("id",id);
        factCondition.put("caseCause",caseCause);
        factCondition.put("enName",enName);
        factCondition.put("province",province);
        factCondition.put("pageNO",String.valueOf(pageNO));
        factCondition.put("pageSize",String.valueOf(pageSize));
        List<FactFeatureReference> list = factFeaturesService.factFeatureReferenceList(factCondition);
        String rowsCount = String.valueOf(factFeaturesService.factFeatureReferenceListCounts(factCondition));
        result.put("total",rowsCount);
        result.put("rows",list);
        return result;

    }

    /**
     * 查询一个事实特征根据最大id   添加默认
     * @param model
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/getAddDefaultFactFeature")
    @ResponseBody
    public Map<String, Object> getAddDefaultFactFeature(Model model, HttpServletResponse res, HttpServletRequest req) {


        Map<String, Object> result = new HashMap<String, Object>();
        try{
            List<FactFeatures> list = factFeaturesService.getAddDefaultFactFeature();
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
    @RequestMapping("/getAddMaxLxOrderFactFeature")
    @ResponseBody
    public Map<String, Object> getAddMaxLxOrderFactFeature(Model model, HttpServletResponse res, HttpServletRequest req) {

        String caseCause = req.getParameter("caseCause");
        String province = req.getParameter("province");
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> maxOrderCondition = new HashMap<String, Object>();
        maxOrderCondition.put("caseCause",caseCause);
        maxOrderCondition.put("province",province);
        try{
            List<FactFeatures> list = factFeaturesService.getAddMaxLxOrderFactFeature(maxOrderCondition);
            FactFeatures factFeatures = list.get(0);
            if(factFeatures != null){
                String fforder = factFeatures.getLxOrder();
                if(fforder!=null && !"".equals(fforder)){
                    factFeatures.setLxOrder(String.valueOf(Integer.parseInt(fforder)+1));
                }
            }
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
        String type = req.getParameter("type");
        String caseCause = req.getParameter("caseCause");
        String province = req.getParameter("province");
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> factCondition = new HashMap<String, Object>();
        factCondition.put("enName",enName);
        factCondition.put("type",type);
        factCondition.put("caseCause",caseCause);
        factCondition.put("province",province);
        try{
            if(type!=null && !"".equals(type) && "4".equals(type)){
                List<FactFeatures> list = factFeaturesService.isEnNameExist4(factCondition);
                result.put("list",list);
            }else{
                List<FactFeatures> list = factFeaturesService.isEnNameExist(factCondition);
                result.put("list",list);
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return result;

    }

    /**
     * 判断标准特征是否存在
     * @param model
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/isChiNameExist")
    @ResponseBody
    public Map<String, Object> isChiNameExist(Model model, HttpServletResponse res, HttpServletRequest req) {

        String standardFeature = req.getParameter("standardFeature");
        String type = req.getParameter("type");
        String caseCause = req.getParameter("caseCause");
        String province = req.getParameter("province");
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> factCondition = new HashMap<String, Object>();
        factCondition.put("standardFeature",standardFeature);
        factCondition.put("type",type);
        factCondition.put("caseCause",caseCause);
        factCondition.put("province",province);

        try{
            if(type!=null && !"".equals(type) && "4".equals(type)){
                List<FactFeatures> list = factFeaturesService.isChiNameExist4(factCondition);
                result.put("list",list);
            }else{
                List<FactFeatures> list = factFeaturesService.isChiNameExist(factCondition);
                result.put("list",list);
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return result;

    }

    /**
     * 判断标准个罪特征是否存在
     * @param model
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/isFactLxExit")
    @ResponseBody
    public Map<String, Object> isFactLxExit(Model model, HttpServletResponse res, HttpServletRequest req) {

        String enName = req.getParameter("enName");
        String caseCause = req.getParameter("caseCause");
        String province = req.getParameter("province");
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> factCondition = new HashMap<String, Object>();
        factCondition.put("enName",enName);
        factCondition.put("caseCause",caseCause);
        factCondition.put("province",province);

        try{
            List<FactFeatures> list = factFeaturesService.isFactLxExit(factCondition);
            result.put("list",list);
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;

    }


}
