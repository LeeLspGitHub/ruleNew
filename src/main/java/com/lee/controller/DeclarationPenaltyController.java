package com.lee.controller;

import com.lee.pojo.DeclarationPenalty;
import com.lee.pojo.User;
import com.lee.service.DeclarationPenaltyService;
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
 * @Description 法定刑控制
 * @Author Lee
 * @Date 2020/01/03 10:16
 */
@Controller
@RequestMapping("/declarationpenalty")
@Transactional(rollbackFor = { Exception.class })
public class DeclarationPenaltyController {


    @Autowired
    @Qualifier("DeclarationPenaltyServiceImpl")
    private DeclarationPenaltyService declarationPenaltyService;

    @RequestMapping("/declarationPenaltyPage")
    public String declarationPenaltyPage(Model model) {
        return "declarationPenalty";
    }

    /**
     * 规则列表（查询所有规则）
     * @param model
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/declarationPenaltyList")
    @ResponseBody
    public Map<String, Object> declarationPenaltyList(Model model, HttpServletResponse res, HttpServletRequest req) {

        String id = req.getParameter("id");
        String caseCause = req.getParameter("caseCause");
        String province = req.getParameter("province");
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
        benchmarkPointCondition.put("pageNO",String.valueOf(pageNO));
        benchmarkPointCondition.put("pageSize",String.valueOf(pageSize));
        List<DeclarationPenalty> list = declarationPenaltyService.declarationPenaltyList(benchmarkPointCondition);
        String rowsCount = String.valueOf(declarationPenaltyService.declarationPenaltyListCounts(benchmarkPointCondition));
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
    @RequestMapping("/saveDeclarationPenalty")
    @ResponseBody
    public  Map<String, Object> saveDeclarationPenalty(HttpServletResponse res, HttpServletRequest req) {
        User user = (User)req.getSession().getAttribute("admin");
        String createPerson = user.getUsername();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String createTime = df.format(System.currentTimeMillis());
        String caseCause = req.getParameter("caseCauseAdd");
        String province = req.getParameter("provinceAdd");
        String caseCauseName = req.getParameter("caseCauseNameAdd");
        String provinceName = req.getParameter("provinceNameAdd");
        String startNumber = req.getParameter("startNumberAdd");
        String lMinValue = req.getParameter("lMinValueAdd");
        String lMaxValue = req.getParameter("lMaxValueAdd");
        String uMinValue = req.getParameter("uMinValueAdd");
        String uMaxValue = req.getParameter("uMaxValueAdd");
        String lxCondition = req.getParameter("lxConditionAdd");
        String lxFlckTrue = req.getParameter("lxFlckTrueAdd");
        String lxFlckFalse = req.getParameter("lxFlckFalseAdd");
        String descS = req.getParameter("descSAdd");
        String lStandardValue= "";
        if(lMinValue!=null && lMaxValue!=null && lMinValue!="" && lMaxValue!=""){
            lStandardValue = String.format("%.2f",(Double.parseDouble(lMinValue)+Double.parseDouble(lMaxValue))/2);
        }
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();

        param.put("caseCause",caseCauseName);
        param.put("province",provinceName);
        param.put("caseCauseId",caseCause);
        param.put("provinceId",province);
        param.put("startNumber",startNumber);
        param.put("uMinValue",uMinValue);
        param.put("uMaxValue",uMaxValue);
        param.put("lMinValue",lMinValue);
        param.put("lMaxValue",lMaxValue);
        param.put("lStandardValue",lStandardValue);
        param.put("lxCondition",lxCondition);
        param.put("lxFlckTrue",lxFlckTrue);
        param.put("lxFlckFalse",lxFlckFalse);
        param.put("createPerson",createPerson);
        param.put("createTime",createTime);
        param.put("descS",descS);
        int count = declarationPenaltyService.saveDeclarationPenalty(param);
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
    @RequestMapping("/deleteDeclarationPenaltyById")
    @ResponseBody
    public  Map<String, Object> deleteDeclarationPenaltyById(HttpServletResponse res, HttpServletRequest req) {

        String id = req.getParameter("declarationPenaltyID");
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("id",id);

        try{
            int count = declarationPenaltyService.deleteDeclarationPenaltyById(param);
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
    public Map<String, Object> findOneDeclarationPenaltyById(Model model, HttpServletResponse res, HttpServletRequest req) {

        String id = req.getParameter("declarationPenaltyID");

        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> startPointCondition = new HashMap<String, Object>();
        startPointCondition.put("id",id);

        try{
            List<DeclarationPenalty> list = declarationPenaltyService.findOneDeclarationPenaltyById(startPointCondition);
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
    @RequestMapping("/updateDeclarationPenalty")
    @ResponseBody
    public  Map<String, Object> updateDeclarationPenalty(HttpServletResponse res, HttpServletRequest req) {
        User user = (User)req.getSession().getAttribute("admin");
        String updatePerson = user.getUsername();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String updateTime = df.format(System.currentTimeMillis());
        String caseCause = req.getParameter("caseCauseEdit");
        String province = req.getParameter("provinceEdit");
        String caseCauseName = req.getParameter("caseCauseNameEdit");
        String provinceName = req.getParameter("provinceNameEdit");
        String id = req.getParameter("idEdit");
        String startNumber = req.getParameter("startNumberEdit");
        String lMinValue = req.getParameter("lMinValueEdit");
        String lMaxValue = req.getParameter("lMaxValueEdit");
        String uMinValue = req.getParameter("uMinValueEdit");
        String uMaxValue = req.getParameter("uMaxValueEdit");
        String lxCondition = req.getParameter("lxConditionEdit");
        String lxFlckTrue = req.getParameter("lxFlckTrueEdit");
        String lxFlckFalse = req.getParameter("lxFlckFalseEdit");
        String descS = req.getParameter("descSEdit");
        String lStandardValue= "";
        if(lMinValue!=null && lMaxValue!=null && lMinValue!="" && lMaxValue!=""){
            lStandardValue = String.format("%.2f",(Double.parseDouble(lMinValue)+Double.parseDouble(lMaxValue))/2);
        }
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();

        param.put("caseCause",caseCauseName);
        param.put("province",provinceName);
        param.put("caseCauseId",caseCause);
        param.put("provinceId",province);
        param.put("id",id);
        param.put("startNumber",startNumber);
        param.put("uMinValue",uMinValue);
        param.put("uMaxValue",uMaxValue);
        param.put("lMinValue",lMinValue);
        param.put("lMaxValue",lMaxValue);
        param.put("lStandardValue",lStandardValue);
        param.put("lxCondition",lxCondition);
        param.put("lxFlckTrue",lxFlckTrue);
        param.put("lxFlckFalse",lxFlckFalse);
        param.put("updatePerson",updatePerson);
        param.put("updateTime",updateTime);
        param.put("descS",descS);
        try{
            int count = declarationPenaltyService.updateDeclarationPenalty(param);
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
