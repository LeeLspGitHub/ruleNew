package com.lee.controller;

import com.lee.pojo.Conflict;
import com.lee.pojo.User;
import com.lee.service.ConflictService;
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
 * @ClassName conflictController
 * @Description 冲突控制
 * @Author Lee
 * @Date 2020/01/03 10:16
 */
@Controller
@RequestMapping("/conflict")
@Transactional(rollbackFor = { Exception.class })
public class conflictController {


    @Autowired
    @Qualifier("ConflictServiceImpl")
    private ConflictService conflictService;

    @RequestMapping("/conflictPage")
    public String conflictPage(Model model) {
        return "sysConflict";
    }

   /* *//**
     * 规则列表（查询所有规则）
     * @param model
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/conflictList")
    @ResponseBody
    public Map<String, Object> conflictList(Model model, HttpServletResponse res, HttpServletRequest req) {

        String id = req.getParameter("id");
        String caseCause = req.getParameter("caseCause");
        String province = req.getParameter("province");
        int page =  Integer.parseInt(req.getParameter("page"));
        int pageSize = Integer.parseInt(req.getParameter("rows"));
        int pageNO = (page-1)*pageSize;

        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> conflictCondition = new HashMap<String, Object>();

        conflictCondition.put("id",id);
        conflictCondition.put("caseCause",caseCause);
        conflictCondition.put("province",province);
        conflictCondition.put("pageNO",String.valueOf(pageNO));
        conflictCondition.put("pageSize",String.valueOf(pageSize));
        List<Conflict> list = conflictService.ConflictList(conflictCondition);
        String rowsCount = String.valueOf(conflictService.ConflictListCounts(conflictCondition));
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
    @RequestMapping("/saveConflict")
    @ResponseBody
    public  Map<String, Object> saveConflict(HttpServletResponse res, HttpServletRequest req) {
        User user = (User)req.getSession().getAttribute("admin");
        String createPerson = user.getUsername();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String createTime = df.format(System.currentTimeMillis());
        String caseCause = req.getParameter("caseCauseAdd");
        String province = req.getParameter("provinceAdd");
        String caseCauseName = req.getParameter("caseCauseNameAdd");
        String provinceName = req.getParameter("provinceNameAdd");
        String enName = req.getParameter("enNameAdd");
        String descS = req.getParameter("descSAdd");

        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();

        param.put("caseCause",caseCauseName);
        param.put("province",provinceName);
        param.put("caseCauseId",caseCause);
        param.put("provinceId",province);
        param.put("enName",enName);
        param.put("descS",descS);
        param.put("createPerson",createPerson);
        param.put("createTime",createTime);
        int count = conflictService.saveConflict(param);
        if(count>0){
            result.put("msg","success");
        }else{
            result = null;
        }
        return result;
    }

    /**
     * 删除冲突
     * @param res
     * @param req
     * @return
     */
    @RequestMapping("/deleteConflictById")
    @ResponseBody
    public  Map<String, Object> deleteConflictById(HttpServletResponse res, HttpServletRequest req) {

        String id = req.getParameter("conflictID");
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("id",id);

        try{
            int count = conflictService.deleteConflictById(param);
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
    @RequestMapping("/findOneConflictById")
    @ResponseBody
    public Map<String, Object> findOneConflictById(Model model, HttpServletResponse res, HttpServletRequest req) {

        String id = req.getParameter("conflictID");
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> startPointCondition = new HashMap<String, Object>();
        startPointCondition.put("id",id);

        try{
            List<Conflict> list = conflictService.findOneConflictById(startPointCondition);
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
   @RequestMapping("/updateConflict")
    @ResponseBody
    public  Map<String, Object> updateConflict(HttpServletResponse res, HttpServletRequest req) {
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
        String descS = req.getParameter("descSEdit");

        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();

        param.put("caseCause",caseCauseName);
        param.put("province",provinceName);
        param.put("caseCauseId",caseCause);
        param.put("provinceId",province);
        param.put("id",id);
       param.put("enName",enName);
        param.put("updatePerson",updatePerson);
        param.put("updateTime",updateTime);
        param.put("descS",descS);
        try{
            int count = conflictService.updateConflict(param);
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
