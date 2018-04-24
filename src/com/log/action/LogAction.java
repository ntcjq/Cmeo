package com.log.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.entity.Log;
import com.log.service.LogService;

import net.sf.json.JSONArray;

@Controller
public class LogAction {

	@Resource(name="logService")
	private LogService logService;
	
	/**
	 * 动态查询日志信息
	 * @return
	 */
	@RequestMapping(value="getLogListByConditions",method=RequestMethod.POST)
	public String getLogListByConditions(@RequestParam("id")String id,@RequestParam("managerId")String managerId,
			@RequestParam("visitModel")String visitModel,@RequestParam("startTime")String startTime,
			@RequestParam("endTime")String endTime,@RequestParam("currentPage")String currentPage,Model model){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("managerId", managerId);
		map.put("visitModel", visitModel);
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		//一页显示的数据量
		int onePageCount = 8;
		map.put("onePageCount", onePageCount);
		if(currentPage == null || "".equals(currentPage)){
			currentPage = "1";
		}
		//查询时用不到这个条件，这是为了翻页所以设置进map的
		map.put("currentPage",currentPage);
		//从第几条开始查
		int startCount =onePageCount*(Integer.parseInt(currentPage)-1);
		map.put("startCount",startCount);
		List<Log> logList = logService.selectLogListByConditions(map);
		//总共有多少条数据
		int allCount = logService.selectLogListByConditionsAll(map);
		//总共分多少页
		int pageCount = allCount/onePageCount;
		int judge = allCount%onePageCount;
		if(judge != 0){
			pageCount = pageCount + 1;
		}
		model.addAttribute("logList", logList);
		model.addAttribute("map", map);
		model.addAttribute("allCount", allCount);
		model.addAttribute("pageCount", pageCount);
		return "log/log-list2";
	}
	
	/**
	 * 动态查询日志信息
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="getLogListByConditionsUseAjax",method=RequestMethod.POST)
	public String getLogListByConditionsUseAjax(@RequestParam("id")String id,@RequestParam("managerId")String managerId,
			@RequestParam("visitModel")String visitModel,@RequestParam("startTime")String startTime,
			@RequestParam("endTime")String endTime,@RequestParam("currentPage")String currentPage,Model model,HttpServletResponse response) throws IOException{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("managerId", managerId);
		map.put("visitModel", visitModel);
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		//一页显示的数据量
		int onePageCount = 8;
		map.put("onePageCount", onePageCount);
		if(currentPage == null || "".equals(currentPage)){
			currentPage = "1";
		}
		//查询时用不到这个条件，这是为了翻页所以设置进map的
		map.put("currentPage",currentPage);
		//从第几条开始查
		int startCount =onePageCount*(Integer.parseInt(currentPage)-1);
		map.put("startCount",startCount);
		List<Log> logList = logService.selectLogListByConditions(map);
		//总共有多少条数据
		int allCount = logService.selectLogListByConditionsAll(map);
		//总共分多少页
		int pageCount = allCount/onePageCount;
		int judge = allCount%onePageCount;
		if(judge != 0){
			pageCount = pageCount + 1;
		}
		JSONArray js =JSONArray.fromObject(logList);
		JSONArray mapJson = JSONArray.fromObject(map);
		String result = js.toString()+";"+mapJson.toString()+";"+allCount+";"+pageCount;
		response.setContentType("text/html;charset=UTF-8");  
        response.getWriter().print(result); 
		return null;
	}
}
